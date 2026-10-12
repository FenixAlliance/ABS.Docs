<#
.SYNOPSIS
    Generates the public REST API service reference pages for the Alliance Business Suite.

.DESCRIPTION
    Reads the REST controller source under FenixAlliance.ABS/FenixAlliance.ABS.Services.<Name>/ (text parsing,
    no Roslyn, no build required) and writes one Markdown page per service to <OutputDir>/<Name>.md.

    Each page holds ONLY generated content, between the markers
        <!-- generated:start -->
        <!-- generated:end -->
    If a page already exists and carries both markers, only the span between them is replaced, so hand-written
    text outside the markers survives a rerun. A page that exists WITHOUT the markers is never overwritten; it is
    reported in the run summary instead.

    Per controller (resource) the page has one table: HTTP verb, full path, the mediator request type the action
    sends, the permission it requires, the access mode, and a summary.

    How each column is derived:
      * Verb / path   - class-level [Route] combined with the action's [Http*] template (and any action-level
                        [Route]). Tokens: [controller] -> class name minus "Controller"; {version:apiVersion} ->
                        the controller's [ApiVersion] major (default 2). Templates starting with "~/" or "/" are
                        absolute and drop the class prefix. Route constraints are stripped ({id:guid} -> {id}).
                        [HttpGet] with no template, [HttpGet(Name = ...)], and several verbs on one line
                        ([HttpGet("a"), HttpPost("a")]) are all handled; each verb is one row.
      * Request       - the type constructed in the action's mediator.SendAsync(...) call (or the variable / bound
                        parameter passed to it).
      * Permission    - (A) the permission argument of [BusinessCapability(key, name, permission, effect)] on the
                        request type; else (B) the requiredPermissions: [...] list of the use case whose
                        ExecuteAsync takes that request type. Permission constants are resolved to their string
                        value through FenixAlliance.ABS.Domain.SDK/Constants/Permissions.cs.
      * Access        - from the use case: ExecuteTenant* -> Tenant, ExecuteUser* -> User,
                        ExecuteAnonymous* -> Anonymous.
      * Summary       - the action's XML doc <summary> if present, else [SwaggerOperation(Summary = "...")].

    Excluded from the pages and listed in the run summary instead:
      * controllers or actions marked [ApiExplorerSettings(IgnoreApi = true)];
      * actions whose use case authorizes against the ROOT tenant (GetRootTenantId() passed to
        ExecuteTenant*Async), or whose controller passes the root tenant id into a tenant-scoped use case.
    Retired actions ([Obsolete] on the action or controller, or a 410 Gone result) go to a separate "Retired" table.

    Output is deterministic (ordinal sorting, no timestamps), plain ASCII, CRLF line endings, no BOM.

.PARAMETER PlatformRoot
    The ABS Platform repository root. Defaults to two levels above this script (Docs.Customer/tools -> Platform).

.PARAMETER OutputDir
    Where the pages are written. Defaults to <PlatformRoot>/Docs.Customer/Services/Reference.

.PARAMETER Service
    Optional list of service folder names (for example Invoicing, HR) to limit the run.

.PARAMETER SummaryPath
    Optional path of a JSON file that receives the full run summary (counts, coverage, flags, every row).

.EXAMPLE
    pwsh -NoProfile -File Docs.Customer/tools/New-ServiceReference.ps1 -PlatformRoot C:/Users/PC/Code/ABS/Platform
#>
[CmdletBinding()]
param(
	[string]$PlatformRoot = (Join-Path $PSScriptRoot '..\..'),
	[string]$OutputDir,
	[string[]]$Service,
	[string]$SummaryPath,
	[string]$NoHandlerListPath,
	[string]$NoMediatorListPath,
	[string]$StubListPath
)

Set-StrictMode -Version 3.0
$ErrorActionPreference = 'Stop'

$PlatformRoot = (Resolve-Path -LiteralPath $PlatformRoot).Path
if (-not $OutputDir) { $OutputDir = Join-Path $PlatformRoot 'Docs.Customer\Services\Reference' }
$servicesRoot = Join-Path $PlatformRoot 'FenixAlliance.ABS'
$permissionsFile = Join-Path $PlatformRoot 'FenixAlliance.ABS.Domain.SDK\Constants\Permissions.cs'
$indexRoots = @(
	(Join-Path $PlatformRoot 'FenixAlliance.ABS.Application.SDK'),
	(Join-Path $PlatformRoot 'FenixAlliance.ABS.Application'),
	(Join-Path $PlatformRoot 'FenixAlliance.ABS.Domain.SDK'),
	(Join-Path $PlatformRoot 'FenixAlliance.ABS.UBL'),
	(Join-Path $PlatformRoot 'FenixAlliance.ABS.AI'),
	(Join-Path $PlatformRoot 'FenixAlliance.ABS.Communications.Hub'),
	(Join-Path $PlatformRoot 'FenixAlliance.ABP\FenixAlliance.ABP.Workflows'),
	(Join-Path $PlatformRoot 'FenixAlliance.ABP\FenixAlliance.ABP.Storage.Hub'),
	(Join-Path $PlatformRoot 'FenixAlliance.ABP\FenixAlliance.ABP.Search.Hub'),
	(Join-Path $PlatformRoot 'FenixAlliance.ABP\FenixAlliance.ABP.Search'),
	(Join-Path $PlatformRoot 'FenixAlliance.ABS\FenixAlliance.ABS.Connectors')
)
# The service projects themselves are indexed too (some declare their own request types and use cases).
$indexRoots += @(Get-ChildItem -LiteralPath (Join-Path $PlatformRoot 'FenixAlliance.ABS') -Directory |
	Where-Object { $_.Name -match '^FenixAlliance\.ABS\.Services\.\w+$' } | ForEach-Object { $_.FullName })

$platformCommit = (& git -C $PlatformRoot rev-parse --short HEAD 2>$null)
if (-not $platformCommit) { $platformCommit = 'unknown' }
$platformCommit = "$platformCommit".Trim()

$MarkerStart = '<!-- generated:start -->'
$MarkerEnd = '<!-- generated:end -->'
$Ordinal = [System.StringComparer]::Ordinal
$VerbOrder = @{ 'GET' = 0; 'POST' = 1; 'PUT' = 2; 'PATCH' = 3; 'DELETE' = 4; 'HEAD' = 5; 'OPTIONS' = 6 }
$VerbAttr = @{ 'HttpGet' = 'GET'; 'HttpPost' = 'POST'; 'HttpPut' = 'PUT'; 'HttpPatch' = 'PATCH'; 'HttpDelete' = 'DELETE'; 'HttpHead' = 'HEAD'; 'HttpOptions' = 'OPTIONS' }

# ---------------------------------------------------------------------------------------------------------------
# Source scanner (inline C#, compiled once). Masks string/char literals, comments and preprocessor lines with
# spaces (offsets and newlines preserved) so structure can be parsed on the masked copy and values read from the
# original at the same offsets.
# ---------------------------------------------------------------------------------------------------------------
if (-not ('AbsServiceRefSource' -as [type])) {
	Add-Type -Language CSharp -TypeDefinition @'
using System;
using System.Collections.Generic;

public static class AbsServiceRefSource
{
	static void Blank(char[] s, string t, int a, int b)
	{
		for (int x = a; x < b && x < s.Length; x++) { if (t[x] != '\n' && t[x] != '\r') s[x] = ' '; }
	}

	public static string Mask(string t)
	{
		char[] s = t.ToCharArray();
		int n = t.Length, i = 0;
		bool lineStart = true;
		while (i < n)
		{
			char c = t[i];
			if (c == '\n') { lineStart = true; i++; continue; }
			if (lineStart && (c == ' ' || c == '\t' || c == '\r' || c == '\uFEFF')) { i++; continue; }
			if (lineStart && c == '#') { int j = i; while (j < n && t[j] != '\n') { s[j] = ' '; j++; } i = j; continue; }
			lineStart = false;
			if (c == '/' && i + 1 < n && t[i + 1] == '/') { int j = i; while (j < n && t[j] != '\n') { s[j] = ' '; j++; } i = j; continue; }
			if (c == '/' && i + 1 < n && t[i + 1] == '*') { int j = t.IndexOf("*/", i + 2, StringComparison.Ordinal); int e = j < 0 ? n : j + 2; Blank(s, t, i, e); i = e; continue; }
			if (c == '\'')
			{
				int e = (i + 1 < n && t[i + 1] == '\\') ? t.IndexOf('\'', Math.Min(i + 3, n - 1)) : i + 2;
				if (e < 0 || e >= n) e = n - 1;
				Blank(s, t, i + 1, e); i = e + 1; continue;
			}
			int p = i; bool verbatim = false, interp = false;
			while (p < n && (t[p] == '@' || t[p] == '$')) { if (t[p] == '@') verbatim = true; else interp = true; p++; }
			if (p < n && t[p] == '"')
			{
				if (p + 2 < n && t[p + 1] == '"' && t[p + 2] == '"')
				{
					int q = p; while (q < n && t[q] == '"') q++;
					string close = new string('"', q - p);
					int j = t.IndexOf(close, q, StringComparison.Ordinal);
					Blank(s, t, q, j < 0 ? n : j);
					i = j < 0 ? n : j + close.Length; continue;
				}
				int k = p + 1, hole = 0;
				while (k < n)
				{
					char d = t[k];
					if (interp && d == '{') { if (hole == 0 && k + 1 < n && t[k + 1] == '{') { k += 2; continue; } hole++; k++; continue; }
					if (interp && d == '}' && hole > 0) { hole--; k++; continue; }
					if (hole > 0 && d == '"') { int m = k + 1; while (m < n && t[m] != '"') { if (t[m] == '\\') m++; m++; } k = m + 1; continue; }
					if (verbatim) { if (d == '"') { if (k + 1 < n && t[k + 1] == '"') { k += 2; continue; } break; } }
					else { if (d == '\\') { k += 2; continue; } if (d == '"' || d == '\n') break; }
					k++;
				}
				if (k > n) k = n;
				Blank(s, t, p + 1, k); i = Math.Min(k + 1, n); continue;
			}
			i++;
		}
		return new string(s);
	}

	// Index of the bracket that closes the one at 'open' ('{', '(' or '['), or -1.
	public static int Match(string m, int open)
	{
		char o = m[open];
		char c = o == '{' ? '}' : (o == '(' ? ')' : ']');
		int d = 0;
		for (int i = open; i < m.Length; i++)
		{
			if (m[i] == o) d++;
			else if (m[i] == c) { d--; if (d == 0) return i; }
		}
		return -1;
	}

	// Splits a class body (masked, [start, end)) into top-level member segments: start,end pairs.
	public static int[] Members(string m, int start, int end)
	{
		var list = new List<int>();
		int seg = start, brace = 0, paren = 0, brack = 0;
		for (int i = start; i < end; i++)
		{
			char ch = m[i];
			switch (ch)
			{
				case '{': brace++; break;
				case '}': brace--; if (brace == 0 && paren == 0 && brack == 0) { list.Add(seg); list.Add(i + 1); seg = i + 1; } break;
				case '(': paren++; break;
				case ')': paren--; break;
				case '[': brack++; break;
				case ']': brack--; break;
				case ';': if (brace == 0 && paren == 0 && brack == 0) { list.Add(seg); list.Add(i + 1); seg = i + 1; } break;
			}
		}
		if (seg < end) { list.Add(seg); list.Add(end); }
		return list.ToArray();
	}

	// Positions of top-level commas in a masked argument string.
	public static int[] TopLevelCommas(string m)
	{
		var list = new List<int>();
		int d = 0;
		for (int i = 0; i < m.Length; i++)
		{
			char ch = m[i];
			if (ch == '(' || ch == '[' || ch == '{' || ch == '<') d++;
			else if (ch == ')' || ch == ']' || ch == '}' || ch == '>') d--;
			else if (ch == ',' && d == 0) list.Add(i);
		}
		return list.ToArray();
	}
}
'@
}

# ---------------------------------------------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------------------------------------------
function Read-Source([string]$Path) {
	$t = [System.IO.File]::ReadAllText($Path, [System.Text.Encoding]::UTF8)
	if ($t.Length -gt 0 -and $t[0] -eq [char]0xFEFF) { $t = $t.Substring(1) }
	return $t
}

function Get-SourceFiles([string]$Root) {
	if (-not (Test-Path -LiteralPath $Root)) { return @() }
	Get-ChildItem -LiteralPath $Root -Recurse -File -Filter '*.cs' |
		Where-Object { $_.FullName -notmatch '[\\/](bin|obj|node_modules)[\\/]' } |
		Sort-Object -Property FullName -Culture 'en-US' -CaseSensitive:$false
}

function Split-TopLevel([string]$Original, [string]$Masked) {
	# Splits an argument list on top-level commas; returns trimmed original pieces.
	$parts = New-Object System.Collections.Generic.List[string]
	$commas = [AbsServiceRefSource]::TopLevelCommas($Masked)
	$prev = 0
	foreach ($c in $commas) { $parts.Add($Original.Substring($prev, $c - $prev).Trim()); $prev = $c + 1 }
	$last = $Original.Substring($prev).Trim()
	if ($last.Length -gt 0 -or $parts.Count -gt 0) { $parts.Add($last) }
	return , $parts
}

function Get-StringLiteral([string]$Expr) {
	$e = $Expr.Trim()
	if ($e -match '^@"((?:[^"]|"")*)"$') { return $Matches[1].Replace('""', '"') }
	if ($e -match '^"((?:[^"\\]|\\.)*)"$') { return [regex]::Unescape($Matches[1]) }
	if ($e -match '^nameof\(\s*([\w.]+)\s*\)$') { return ($Matches[1] -split '\.')[-1] }
	return $null
}

function Get-Attributes([string]$Original, [string]$Masked, [int]$From, [int]$To) {
	# Returns attribute objects (Name, Args (original), ArgsMasked, Positional[], Named{}) for every top-level
	# [ ... ] group in [From, To), plus the end offset of the last group.
	$result = New-Object System.Collections.Generic.List[object]
	$i = $From
	$lastEnd = $From
	while ($i -lt $To) {
		$ch = $Masked[$i]
		if ([char]::IsWhiteSpace($ch)) { $i++; continue }
		if ($ch -ne '[') { break }
		$close = [AbsServiceRefSource]::Match($Masked, $i)
		if ($close -lt 0 -or $close -ge $To) { break }
		$innerO = $Original.Substring($i + 1, $close - $i - 1)
		$innerM = $Masked.Substring($i + 1, $close - $i - 1)
		$commas = [AbsServiceRefSource]::TopLevelCommas($innerM)
		$bounds = @(0) + @($commas | ForEach-Object { $_ + 1 })
		$ends = @($commas) + @($innerM.Length)
		for ($k = 0; $k -lt $bounds.Count; $k++) {
			$pO = $innerO.Substring($bounds[$k], $ends[$k] - $bounds[$k])
			$pM = $innerM.Substring($bounds[$k], $ends[$k] - $bounds[$k])
			$lead = $pM.Length - $pM.TrimStart().Length
			$pO = $pO.Substring($lead).TrimEnd(); $pM = $pM.Substring($lead).TrimEnd()
			if ($pM -match '^(?:\w+\s*:\s*)?([\w.]+)') {
				$name = ($Matches[1] -split '\.')[-1]
				if ($name.EndsWith('Attribute')) { $name = $name.Substring(0, $name.Length - 9) }
				$argsO = ''; $argsM = ''
				$open = $pM.IndexOf('(')
				if ($open -ge 0) {
					$cl = [AbsServiceRefSource]::Match($pM, $open)
					if ($cl -gt $open) { $argsO = $pO.Substring($open + 1, $cl - $open - 1); $argsM = $pM.Substring($open + 1, $cl - $open - 1) }
				}
				$positional = New-Object System.Collections.Generic.List[string]
				$named = @{}
				if ($argsM.Trim().Length -gt 0) {
					$aO = Split-TopLevel $argsO $argsM
					foreach ($a in $aO) {
						if ($a -match '^(\w+)\s*=(?!=)\s*(.*)$' -or $a -match '^(\w+)\s*:\s*(.*)$') { $named[$Matches[1]] = $Matches[2].Trim() }
						else { $positional.Add($a) }
					}
				}
				$result.Add([pscustomobject]@{ Name = $name; Args = $argsO; Positional = $positional; Named = $named; Text = $pO })
			}
		}
		$i = $close + 1
		$lastEnd = $i
	}
	return [pscustomobject]@{ Items = $result; End = $lastEnd }
}

function ConvertTo-AsciiLine([string]$Text) {
	if ($null -eq $Text) { return '' }
	$t = $Text.Replace([string][char]0x2014, '-').Replace([string][char]0x2013, '-').Replace([string][char]0x2012, '-').Replace([string][char]0x2011, '-').Replace([string][char]0x2010, '-')
	$t = $t.Replace([string][char]0x2018, "'").Replace([string][char]0x2019, "'").Replace([string][char]0x201C, '"').Replace([string][char]0x201D, '"')
	$t = $t.Replace([string][char]0x2026, '...').Replace([string][char]0x00A0, ' ').Replace([string][char]0x2192, '->')
	$t = $t.Normalize([System.Text.NormalizationForm]::FormD)
	$sb = New-Object System.Text.StringBuilder
	foreach ($c in $t.ToCharArray()) { if ([int]$c -lt 128 -and [int]$c -ne 13 -and [int]$c -ne 10) { [void]$sb.Append($c) } }
	return $sb.ToString()
}

function Format-PermissionCell($Row) {
	# Only permission values (lower-case tokens) are shown as code; anything else is plain language.
	$parts = @($Row.Permission -split ',\s*' | Where-Object { $_ -and ($_ -cmatch '^[a-z][a-z0-9_.:-]*$') })
	$cell = (@($parts | ForEach-Object { '`' + $_ + '`' }) -join ', ')
	if ($cell -and $Row.PermissionNote) { $cell += ' (' + (ConvertTo-Cell $Row.PermissionNote) + ')' }
	if (-not $cell -and $Row.PermissionRuntime) { $cell = ConvertTo-Cell $Row.PermissionRuntime }
	return $cell
}

function ConvertTo-CustomerAccess([string]$Access) {
	# Internal authorization modes -> customer terms. A workspace (tenant) endpoint that also has a user path is still
	# described by its workspace rule.
	if (-not $Access) { return '' }
	$modes = @($Access -split ',\s*' | Where-Object { $_ })
	$out = New-Object System.Collections.Generic.List[string]
	foreach ($mo in @('Tenant', 'User', 'Anonymous', 'Delegated')) {
		if ($modes -notcontains $mo) { continue }
		if ($mo -eq 'User' -and $modes -contains 'Tenant') { continue }
		$label = switch ($mo) { 'Tenant' { 'Workspace member' } 'User' { 'Signed-in user' } 'Anonymous' { 'Public' } 'Delegated' { 'Checked by the service' } }
		$out.Add($label)
	}
	return ($out -join ', ')
}

function ConvertTo-Cell([string]$Text) {
	if ($null -eq $Text) { return '' }
	$t = $Text -replace '[\r\n\t]+', ' '
	$t = $t.Replace([string][char]0x2014, '-').Replace([string][char]0x2013, '-').Replace([string][char]0x2012, '-').Replace([string][char]0x2011, '-').Replace([string][char]0x2010, '-')
	$t = $t.Replace([string][char]0x2018, "'").Replace([string][char]0x2019, "'").Replace([string][char]0x201C, '"').Replace([string][char]0x201D, '"')
	$t = $t.Replace([string][char]0x2026, '...').Replace([string][char]0x00A0, ' ').Replace([string][char]0x2192, '->')
	$t = $t.Normalize([System.Text.NormalizationForm]::FormD)
	$sb = New-Object System.Text.StringBuilder
	foreach ($c in $t.ToCharArray()) { if ([int]$c -lt 128) { [void]$sb.Append($c) } }
	$t = $sb.ToString()
	$t = ($t -replace '\s{2,}', ' ').Trim()
	$t = $t.Replace('|', '\|').Replace('<', '&lt;').Replace('>', '&gt;')
	return $t
}

function Get-DocSummary([string]$Region) {
	$lines = [regex]::Matches($Region, '(?m)^[ \t]*///[ \t]?(.*)$') | ForEach-Object { $_.Groups[1].Value }
	if (-not $lines) { return $null }
	$doc = ($lines -join ' ')
	$m = [regex]::Match($doc, '<summary>(.*?)</summary>', 'Singleline')
	if (-not $m.Success) { return $null }
	$s = $m.Groups[1].Value
	$s = [regex]::Replace($s, '<(?:see|seealso)\s+(?:cref|href|langword)="(?:[A-Z]:)?([^"]+)"\s*/>', { param($x) ($x.Groups[1].Value -split '\.')[-1] })
	$s = [regex]::Replace($s, '<(?:paramref|typeparamref)\s+name="([^"]+)"\s*/>', '$1')
	$s = [regex]::Replace($s, '<[^>]+>', '')
	$s = [System.Net.WebUtility]::HtmlDecode($s)
	$s = ($s -replace '\s+', ' ').Trim()
	if ($s.Length -eq 0) { return $null }
	return $s
}

function Join-Route([string]$Prefix, [string]$Template) {
	if ($null -eq $Template -or $Template -eq '') { return $Prefix }
	if ($Template.StartsWith('~/')) { return $Template.Substring(2) }
	if ($Template.StartsWith('/')) { return $Template.Substring(1) }
	if ($Prefix -eq '') { return $Template }
	return ($Prefix.TrimEnd('/') + '/' + $Template)
}

function Format-Path([string]$Route, [string]$ControllerToken, [string]$ActionToken, [string]$VersionMajor) {
	$r = $Route.Replace('[controller]', $ControllerToken).Replace('[action]', $ActionToken)
	$r = $r -replace '\{version:apiVersion\}', $VersionMajor
	$r = [regex]::Replace($r, '\{(\*{0,2}\w+)(?::[^{}?=]+(?:\([^)]*\))?)*(\?)?(=[^}]*)?\}', '{$1$2}')
	return '/' + $r.Trim('/')
}

# ---------------------------------------------------------------------------------------------------------------
# 1. Permission constants: "Invoices.Read" -> "invoices_read"
# ---------------------------------------------------------------------------------------------------------------
$permissionMap = New-Object 'System.Collections.Generic.Dictionary[string,string]' ([System.StringComparer]::Ordinal)
if (Test-Path -LiteralPath $permissionsFile) {
	$pt = Read-Source $permissionsFile
	$pm = [AbsServiceRefSource]::Mask($pt)
	$stack = New-Object System.Collections.Generic.List[object]
	$depth = 0
	$pendingClass = $null
	$tokens = [regex]::Matches($pm, '\bclass\s+(\w+)|[{}]|\bconst\s+string\s+(\w+)\s*=')
	foreach ($tk in $tokens) {
		if ($tk.Groups[1].Success) { $pendingClass = $tk.Groups[1].Value; continue }
		if ($tk.Value -eq '{') { $depth++; if ($pendingClass) { $stack.Add([pscustomobject]@{ Name = $pendingClass; Depth = $depth }); $pendingClass = $null }; continue }
		if ($tk.Value -eq '}') { if ($stack.Count -gt 0 -and $stack[$stack.Count - 1].Depth -eq $depth) { $stack.RemoveAt($stack.Count - 1) }; $depth--; continue }
		if ($tk.Groups[2].Success) {
			$rest = $pt.Substring($tk.Index + $tk.Length)
			$vm = [regex]::Match($rest, '^\s*"([^"]*)"')
			if ($vm.Success) {
				$names = @($stack | Select-Object -Skip 1 | ForEach-Object { $_.Name }) + $tk.Groups[2].Value
				$permissionMap[($names -join '.')] = $vm.Groups[1].Value
			}
		}
	}
}

function Resolve-Permission([string]$Expr) {
	$e = $Expr.Trim()
	$lit = Get-StringLiteral $e
	if ($null -ne $lit -and -not $e.StartsWith('nameof')) { return $lit }
	$segs = $e -split '\.'
	for ($k = 0; $k -lt $segs.Count - 1; $k++) {
		$key = ($segs[$k..($segs.Count - 1)] -join '.')
		if ($permissionMap.ContainsKey($key)) { return $permissionMap[$key] }
	}
	return $e
}

# ---------------------------------------------------------------------------------------------------------------
# 2. Request-type indices
#    A: [BusinessCapability(...)] on the request type
#    B: the use case whose ExecuteAsync takes the request type (requiredPermissions, access mode, root tenant)
# ---------------------------------------------------------------------------------------------------------------
$capIndex = @{}     # type -> list of { Permission; Mode; Source }
$ucIndex = @{}      # type -> list of { Permissions[]; Dynamic; Access[]; RootTenant; RootAdmin; File; Class }

$capRegex = [regex]'\[BusinessCapability\('
$typeAfterRegex = [regex]'\G\s*(?:\[[^\]]*\]\s*)*(?:(?:public|internal|private|protected|sealed|partial|abstract|static|readonly)\s+)*(?:record\s+(?:class\s+|struct\s+)?|class\s+|struct\s+)(\w+)'
$classRegex = [regex]'(?m)^[ \t]*(?:(?:public|internal|private|protected|sealed|partial|abstract|static|file)\s+)*(?:class|record)\s+(\w+)'
$execRegex = [regex]'\bExecuteAsync\s*\(\s*(?:[\w.]+\.)?(\w+)(?:<[^()]*>)?\s+\w+\s*[,)]'
$reqPermRegex = [regex]'requiredPermissions\s*:\s*'
$modeRegex = [regex]'\bExecute(Tenant|User|Anonymous)(?:Query|Command)Async\b'
$rootDirect = [regex]'\bExecuteTenant\w*Async\s*(?:<[^()]*>)?\s*\(\s*new\s*(?:TenantId)?\s*\(\s*(?:new\s+Guid\s*\()?\s*[\w.]*GetRootTenantId\s*\(\s*\)'
$rootVar = [regex]'(?:var|TenantId\??)\s+(\w+)\s*=\s*(?:new\s*(?:TenantId)?\s*\(\s*(?:new\s+Guid\s*\()?\s*[\w.]*GetRootTenantId\s*\(\s*\)|RootAdminGate\.RootTenant\s*\()'

# Pre-pass: string constants and permission-list fields/properties (for example
#   public const string RefundPermission = Permissions.PaymentRefunds.Create;
#   public static readonly List<string> Read = [AuthPermissions.Applications.Read];)
# keyed both as "Class.Member" (global) and "file|Member" (bare use in the same file).
$fieldGlobal = @{}
$fieldLocal = @{}
$fieldRegex = [regex]'(?:\bconst\s+string|\bstatic\s+(?:readonly\s+)?(?:string|List<string>|IReadOnlyList<string>|IReadOnlyCollection<string>|IEnumerable<string>|ICollection<string>|string\[\]))\s+(\w+)\s*(?:=>|=)\s*([^;]+);'
foreach ($root in $indexRoots) {
	foreach ($f in (Get-SourceFiles $root)) {
		if ($f.FullName -eq $permissionsFile) { continue }
		$t = Read-Source $f.FullName
		if (-not $t.Contains('Permission')) { continue }
		$m = [AbsServiceRefSource]::Mask($t)
		$rel = $f.FullName.Substring($PlatformRoot.Length + 1)
		$classes = @($classRegex.Matches($m))
		foreach ($fm in $fieldRegex.Matches($m)) {
			$owner = $null
			foreach ($c in $classes) { if ($c.Index -lt $fm.Index) { $owner = $c.Groups[1].Value } else { break } }
			$g = $fm.Groups[2]
			$entry = [pscustomobject]@{ ExprO = $t.Substring($g.Index, $g.Length).Trim(); ExprM = $g.Value.Trim(); File = $rel }
			$name = $fm.Groups[1].Value
			if ($owner) { $fieldGlobal["$owner.$name"] = $entry }
			$fieldLocal["$rel|$name"] = $entry
		}
	}
}

function Test-PermissionValue([string]$Value) { return ($Value -cmatch '^[a-z][a-z0-9_.:-]*$') }

function Get-RuntimePhrase([string]$Expr) {
	if ($Expr -match '(?i)descriptor|dataset') { return 'Depends on the dataset' }
	return 'Depends on the request'
}

function Find-Field([string]$Expr, [string]$Rel) {
	$e = $Expr.Trim()
	if ($e -notmatch '\.') { $k = "$Rel|$e"; if ($fieldLocal.ContainsKey($k)) { return $fieldLocal[$k] }; return $null }
	$segs = $e -split '\.'
	$k = ($segs[-2] + '.' + $segs[-1])
	if ($fieldGlobal.ContainsKey($k)) { return $fieldGlobal[$k] }
	return $null
}

function Resolve-PermissionList([string]$ExprO, [string]$ExprM, [string]$Rel, [int]$Depth = 0) {
	# Resolves a requiredPermissions argument to permission strings, plain-language notes (conditional extras) and
	# runtime phrases (the permission depends on data). Never returns a code identifier as a permission.
	$r = [pscustomobject]@{
		Perms = New-Object System.Collections.Generic.List[string]
		Notes = New-Object System.Collections.Generic.List[string]
		Runtime = New-Object System.Collections.Generic.List[string]
	}
	$e = $ExprO.Trim(); $em = $ExprM.Trim()
	if ($Depth -gt 4 -or $e -eq '') { $r.Runtime.Add((Get-RuntimePhrase $e)); return $r }

	# Known helper: ConversationAccessPermissions.For(scope, P) -> [P], plus bots_manage for every user's conversations.
	if ($e -match '^(?:[\w.]+\.)?ConversationAccessPermissions\.For\s*\(\s*[^,]+,\s*([\w.]+)\s*\)$') {
		$v = Resolve-Permission $Matches[1]
		if (Test-PermissionValue $v) { $r.Perms.Add($v) } else { $r.Runtime.Add('Depends on the request') }
		$r.Notes.Add("bots_manage too, to reach every user's conversations")
		return $r
	}

	$open = -1; $close = -1
	if ($em.StartsWith('[') -and $em.EndsWith(']')) { $open = 0; $close = $em.Length - 1 }
	elseif ($em -match '^new\b[^{]*\{' -and $em.EndsWith('}')) { $open = $em.IndexOf('{'); $close = $em.Length - 1 }
	if ($open -ge 0) {
		$innerO = $e.Substring($open + 1, $close - $open - 1)
		$innerM = $em.Substring($open + 1, $close - $open - 1)
		$itemsO = Split-TopLevel $innerO $innerM
		$itemsM = Split-TopLevel $innerM $innerM
		for ($i = 0; $i -lt $itemsO.Count; $i++) {
			if (-not $itemsO[$i]) { continue }
			$sub = Resolve-PermissionList $itemsO[$i] $itemsM[$i] $Rel ($Depth + 1)
			foreach ($p in $sub.Perms) { if (-not $r.Perms.Contains($p)) { $r.Perms.Add($p) } }
			foreach ($n in $sub.Notes) { if (-not $r.Notes.Contains($n)) { $r.Notes.Add($n) } }
			foreach ($u in $sub.Runtime) { if (-not $r.Runtime.Contains($u)) { $r.Runtime.Add($u) } }
		}
		return $r
	}

	$v = Resolve-Permission $e
	if (Test-PermissionValue $v) { $r.Perms.Add($v); return $r }
	if ($e -match '^[A-Za-z_][\w.]*$') {
		$fld = Find-Field $e $Rel
		if ($fld) { return (Resolve-PermissionList $fld.ExprO $fld.ExprM $fld.File ($Depth + 1)) }
	}
	$r.Runtime.Add((Get-RuntimePhrase $e))
	return $r
}

$indexFiles = 0
foreach ($root in $indexRoots) {
	foreach ($f in (Get-SourceFiles $root)) {
		$t = Read-Source $f.FullName
		$hasCap = $t.Contains('[BusinessCapability(')
		$hasExec = $t.Contains('ExecuteAsync')
		if (-not $hasCap -and -not $hasExec) { continue }
		$indexFiles++
		$m = [AbsServiceRefSource]::Mask($t)
		$rel = $f.FullName.Substring($PlatformRoot.Length + 1)

		if ($hasCap) {
			foreach ($cm in $capRegex.Matches($m)) {
				$open = $cm.Index + $cm.Length - 1
				$close = [AbsServiceRefSource]::Match($m, $open)
				if ($close -lt 0) { continue }
				$bracketClose = [AbsServiceRefSource]::Match($m, $cm.Index)
				if ($bracketClose -lt 0) { continue }
				$tm = $typeAfterRegex.Match($m, $bracketClose + 1)
				if (-not $tm.Success) { continue }
				$typeName = $tm.Groups[1].Value
				$argsO = $t.Substring($open + 1, $close - $open - 1)
				$argsM = $m.Substring($open + 1, $close - $open - 1)
				$pieces = Split-TopLevel $argsO $argsM
				$positional = @($pieces | Where-Object { $_ -notmatch '^\w+\s*=(?!=)' })
				$namedMode = $pieces | Where-Object { $_ -match '^AuthorizationMode\s*=' } | Select-Object -First 1
				$perm = ''
				$mode = 'PermissionRequired'
				if ($positional.Count -ge 4) {
					$capRes = Resolve-PermissionList $positional[2] $positional[2] $rel
					$perm = ($capRes.Perms -join ', ')
				}
				else { $mode = 'IdentityOnly' }
				if ($namedMode) { $mode = ($namedMode -split '\.')[-1].Trim() }
				if (-not $capIndex.ContainsKey($typeName)) { $capIndex[$typeName] = New-Object System.Collections.Generic.List[object] }
				$capIndex[$typeName].Add([pscustomobject]@{ Permission = $perm; Mode = $mode; File = $rel })
			}
		}

		if ($hasExec) {
			$classes = @($classRegex.Matches($m))
			for ($ci = 0; $ci -lt $classes.Count; $ci++) {
				$start = $classes[$ci].Index
				$end = if ($ci + 1 -lt $classes.Count) { $classes[$ci + 1].Index } else { $m.Length }
				$body = $m.Substring($start, $end - $start)
				$bodyO = $t.Substring($start, $end - $start)
				$execs = $execRegex.Matches($body)
				if ($execs.Count -eq 0) { continue }
				$perms = New-Object System.Collections.Generic.List[string]
				$notes = New-Object System.Collections.Generic.List[string]
				$runtime = New-Object System.Collections.Generic.List[string]
				foreach ($rp in $reqPermRegex.Matches($body)) {
					$after = $rp.Index + $rp.Length
					# The argument runs to the next top-level ',' or ')'.
					$d = 0; $k = $after
					while ($k -lt $body.Length) {
						$ch = $body[$k]
						if ($ch -eq '(' -or $ch -eq '[' -or $ch -eq '{') { $d++ }
						elseif ($ch -eq ')' -or $ch -eq ']' -or $ch -eq '}') { if ($d -eq 0) { break }; $d-- }
						elseif ($ch -eq ',' -and $d -eq 0) { break }
						$k++
					}
					$exprO = $bodyO.Substring($after, $k - $after).Trim()
					$exprM = $body.Substring($after, $k - $after).Trim()
					if ($exprM -match '^(null|\[\s*\])$') { continue }
					$res = Resolve-PermissionList $exprO $exprM $rel
					foreach ($p in $res.Perms) { if (-not $perms.Contains($p)) { $perms.Add($p) } }
					foreach ($n in $res.Notes) { if (-not $notes.Contains($n)) { $notes.Add($n) } }
					foreach ($u in $res.Runtime) { if (-not $runtime.Contains($u)) { $runtime.Add($u) } }
				}
				$dynamic = ($runtime.Count -gt 0)
				$access = New-Object System.Collections.Generic.List[string]
				foreach ($mm in $modeRegex.Matches($body)) { if (-not $access.Contains($mm.Groups[1].Value)) { $access.Add($mm.Groups[1].Value) } }
				$root = $rootDirect.IsMatch($body)
				if (-not $root) {
					foreach ($rv in $rootVar.Matches($body)) {
						if ([regex]::IsMatch($body, '\bExecuteTenant\w*Async\s*(?:<[^()]*>)?\s*\(\s*' + [regex]::Escape($rv.Groups[1].Value) + '\b')) { $root = $true }
					}
				}
				# A NEGATED IsRootAdmin check that refuses the caller is a root-admin gate (root tenant only). A non-negated one
				# (for example "operator AND permission" as an extra path) is only flagged.
				if ($body -match '!\s*await\s+[\w.]+\.IsRootAdmin\s*\(') { $root = $true }
				$rootAdmin = $body.Contains('IsRootAdmin(')
				foreach ($ex in $execs) {
					$typeName = $ex.Groups[1].Value
					if (-not $ucIndex.ContainsKey($typeName)) { $ucIndex[$typeName] = New-Object System.Collections.Generic.List[object] }
					$ucIndex[$typeName].Add([pscustomobject]@{
						Permissions = @($perms); Notes = @($notes); Runtime = @($runtime); Dynamic = $dynamic; Access = @($access); RootTenant = $root; RootAdmin = $rootAdmin
						File = $rel; Class = $classes[$ci].Groups[1].Value
					})
				}
			}
		}
	}
}

# ---------------------------------------------------------------------------------------------------------------
# 3. Controllers
# ---------------------------------------------------------------------------------------------------------------
$flags = New-Object System.Collections.Generic.List[object]
function Add-Flag([string]$Kind, [string]$ServiceName, [string]$Where, [string]$Detail) {
	$flags.Add([pscustomobject]@{ Kind = $Kind; Service = $ServiceName; Where = $Where; Detail = $Detail })
}

$serviceDirs = Get-ChildItem -LiteralPath $servicesRoot -Directory | Where-Object { $_.Name -match '^FenixAlliance\.ABS\.Services\.\w+$' } |
	Sort-Object -Property Name -Culture 'en-US'
if ($Service) { $serviceDirs = $serviceDirs | Where-Object { $Service -contains $_.Name.Substring('FenixAlliance.ABS.Services.'.Length) } }

$classDeclRegex = [regex]'(?m)^[ \t]*(?<mods>(?:(?:public|internal|sealed|abstract|partial|static)\s+)*)class\s+(?<name>\w+)(?<rest>[^{;]*)'
$services = New-Object System.Collections.Generic.List[object]
$allRows = New-Object System.Collections.Generic.List[object]
$controllerCount = 0

foreach ($dir in $serviceDirs) {
	$svcName = $dir.Name.Substring('FenixAlliance.ABS.Services.'.Length)
	$controllers = New-Object System.Collections.Generic.List[object]

	foreach ($f in (Get-SourceFiles $dir.FullName)) {
		$t = Read-Source $f.FullName
		if (-not $t.Contains('Controller')) { continue }
		$m = [AbsServiceRefSource]::Mask($t)
		$rel = $f.FullName.Substring($PlatformRoot.Length + 1)

		foreach ($cd in $classDeclRegex.Matches($m)) {
			$className = $cd.Groups['name'].Value
			$rest = $cd.Groups['rest'].Value
			if ($cd.Groups['mods'].Value -match '\babstract\b') { continue }
			# Class attributes: the [..] groups immediately before the declaration.
			$scan = $cd.Index - 1
			while ($scan -ge 0 -and $m[$scan] -ne ';' -and $m[$scan] -ne '}' -and $m[$scan] -ne '{') { $scan-- }
			$cattrs = Get-Attributes $t $m ($scan + 1) $cd.Index
			$hasApiController = [bool]($cattrs.Items | Where-Object Name -eq 'ApiController')
			$inheritsController = $rest -match ':[^{]*\b(PlatformController|ControllerBase|Controller)\b'
			if (-not $hasApiController -and -not $inheritsController) { continue }

			$bodyOpen = $m.IndexOf('{', $cd.Index + $cd.Length - $rest.Length)
			if ($bodyOpen -lt 0) { continue }
			$bodyClose = [AbsServiceRefSource]::Match($m, $bodyOpen)
			if ($bodyClose -lt 0) { continue }
			$controllerCount++

			$resource = if ($className.EndsWith('Controller')) { $className.Substring(0, $className.Length - 10) } else { $className }
			$classRoutes = @($cattrs.Items | Where-Object Name -eq 'Route' | ForEach-Object { Get-StringLiteral $_.Positional[0] })
			$apiVersion = $cattrs.Items | Where-Object Name -eq 'ApiVersion' | Select-Object -First 1
			$versionMajor = '2'
			if ($apiVersion) { $v = Get-StringLiteral $apiVersion.Positional[0]; if ($v) { $versionMajor = ($v -split '\.')[0] } }
			$classIgnore = [bool]($cattrs.Items | Where-Object { $_.Name -eq 'ApiExplorerSettings' -and $_.Named.ContainsKey('IgnoreApi') -and $_.Named['IgnoreApi'] -eq 'true' })
			$classObsolete = $cattrs.Items | Where-Object Name -eq 'Obsolete' | Select-Object -First 1
			$classAnon = [bool]($cattrs.Items | Where-Object Name -eq 'AllowAnonymous')
			$where = "$rel ($className)"

			if ($classRoutes.Count -eq 0) { $classRoutes = @(''); Add-Flag 'NoClassRoute' $svcName $where 'Controller has no class-level [Route]; action templates are used as-is.' }
			elseif ($classRoutes.Count -gt 1) { Add-Flag 'MultipleClassRoutes' $svcName $where ("Class routes: " + ($classRoutes -join ', ')) }
			if ($classIgnore) { Add-Flag 'InternalController' $svcName $where '[ApiExplorerSettings(IgnoreApi = true)]: controller excluded from the reference.' }

			$rows = New-Object System.Collections.Generic.List[object]
			$segs = [AbsServiceRefSource]::Members($m, $bodyOpen + 1, $bodyClose)
			for ($s = 0; $s -lt $segs.Count; $s += 2) {
				$segStart = $segs[$s]; $segEnd = $segs[$s + 1]
				$at = Get-Attributes $t $m $segStart $segEnd
				$sigStart = $at.End
				$sigM = $m.Substring($sigStart, $segEnd - $sigStart)
				if ($sigM -notmatch '^\s*(?:(?:public|private|protected|internal|static|async|virtual|override|new|sealed|extern|unsafe)\s+)+') { continue }
				$isPublic = $sigM -match '^\s*(?:\w+\s+)*?public\b'
				$isStatic = $sigM -match '^\s*(?:\w+\s+)*?static\b'
				$nm = [regex]::Match($sigM, '(\w+)\s*(?:<[^()]*>)?\s*\(')
				if (-not $nm.Success) { continue }
				if ($sigM.Substring(0, $nm.Index) -match '\b(class|record|struct|interface|delegate|event)\b') { continue }
				$methodName = $nm.Groups[1].Value
				if ($methodName -eq $className) { continue }
				$verbs = @($at.Items | Where-Object { $VerbAttr.ContainsKey($_.Name) })
				$actionRoutes = @($at.Items | Where-Object Name -eq 'Route')
				$acceptVerbs = @($at.Items | Where-Object Name -eq 'AcceptVerbs')
				if ($at.Items | Where-Object Name -eq 'NonAction') { continue }
				if (-not $isPublic -or $isStatic) { continue }
				if ($verbs.Count -eq 0 -and $acceptVerbs.Count -eq 0) {
					if ($rest -match 'PlatformController|ControllerBase|Controller' -and $sigM -match '\b(Task|ValueTask|IActionResult|ActionResult)\b') {
						Add-Flag 'NoVerbAttribute' $svcName "$where.$methodName" 'Public action without an [Http*] attribute; not documented.'
					}
					continue
				}

				$regionO = $t.Substring($segStart, $sigStart - $segStart)
				$bodyO = $t.Substring($sigStart, $segEnd - $sigStart)
				$bodyM = $sigM

				# Summary
				$summary = Get-DocSummary $regionO
				$summarySource = 'xml'
				if (-not $summary) {
					$so = $at.Items | Where-Object Name -eq 'SwaggerOperation' | Select-Object -First 1
					$summarySource = 'none'
					if ($so) {
						$sv = $null
						if ($so.Named.ContainsKey('Summary')) { $sv = Get-StringLiteral $so.Named['Summary'] }
						elseif ($so.Positional.Count -ge 1) { $sv = Get-StringLiteral $so.Positional[0] }
						if ($sv) { $summary = $sv; $summarySource = 'swagger' }
					}
				}

				# Request types
				$requestTypes = New-Object System.Collections.Generic.List[string]
				foreach ($sa in [regex]::Matches($bodyM, '\bSendAsync\s*(?:<[^()]*>)?\s*\(\s*(?:new\s+(?<t>[A-Z]\w*)|(?<v>[A-Za-z_]\w*)\s*[,)])')) {
					$tn = $null
					if ($sa.Groups['t'].Success) { $tn = $sa.Groups['t'].Value }
					else {
						$vn = [regex]::Escape($sa.Groups['v'].Value)
						$vm = [regex]::Match($bodyM, '(?:\bvar|\b(?<d>[A-Z]\w*))\s+' + $vn + '\s*=\s*new\s*(?<t>[A-Z]\w*)?\s*\(')
						if ($vm.Success) { $tn = if ($vm.Groups['t'].Success) { $vm.Groups['t'].Value } else { $vm.Groups['d'].Value } }
						else {
							$pm2 = [regex]::Match($bodyM, '(?<t>[A-Z]\w*)(?:<[^()]*>)?\??\s+' + $vn + '\s*[,)=]')
							if ($pm2.Success) { $tn = $pm2.Groups['t'].Value }
						}
					}
					if ($tn -and -not $requestTypes.Contains($tn)) { $requestTypes.Add($tn) }
				}
				$line = 1 + [regex]::Matches($t.Substring(0, $sigStart + $nm.Index), "`n").Count
				# Without a mediator call, the action is kept only when it visibly calls a collaborator (an injected service,
				# HttpContext, Request, User...). A body that only returns a constant or nothing is not documented.
				$callsService = $bodyM -cmatch '\b(?!mediator\b)(?:_?[a-z]\w*|HttpContext|Request|User)\s*\??\.\s*[A-Z]\w*\s*(?:<[^()]*>)?\s*\('
				# Stub: after the parameter list the body is nothing but "return Ok();" / "=> Ok();", optionally preceded by
				# "await Task.Delay(n);". Comments (for example a TODO) are already blanked by the masker.
				$isStub = $false
				$pOpen = $nm.Index + $nm.Length - 1
				$pClose = [AbsServiceRefSource]::Match($bodyM, $pOpen)
				if ($pClose -gt 0) {
					$tailM = $bodyM.Substring($pClose + 1)
					$tailM = [regex]::Replace($tailM, 'await\s+Task\.Delay\s*\([^()]*\)\s*;', '')
					$tailM = [regex]::Replace($tailM, '(?:return|=>)\s*Ok\s*\(\s*\)\s*;', '')
					$isStub = ($tailM -replace '[\s{}]', '').Length -eq 0
				}
				if ($requestTypes.Count -eq 0) { Add-Flag 'NoMediatorDispatch' $svcName "$where.$methodName" 'No mediator.SendAsync request found in the action body.' }

				# Permission / access / root
				$noHandler = $false
				$permNotes = New-Object System.Collections.Generic.List[string]
				$permRuntime = New-Object System.Collections.Generic.List[string]
				$perms = New-Object System.Collections.Generic.List[string]
				$access = New-Object System.Collections.Generic.List[string]
				$permSource = 'none'
				$rootTenant = $false
				$rootAdmin = $false
				foreach ($rt in $requestTypes) {
					$capPerm = $null
					if ($capIndex.ContainsKey($rt)) {
						$distinct = @($capIndex[$rt] | ForEach-Object { $_.Permission } | Sort-Object -Unique)
						if ($distinct.Count -gt 1) { Add-Flag 'AmbiguousRequestType' $svcName "$where.$methodName" "$rt has several [BusinessCapability] declarations: $($distinct -join ', ')" }
						$withPerm = @($distinct | Where-Object { $_ })
						if ($withPerm.Count -gt 0) { $capPerm = $withPerm }
					}
					$ucPerm = $null
					if ($ucIndex.ContainsKey($rt)) {
						$ucs = $ucIndex[$rt]
						if (@($ucs | ForEach-Object { $_.Class } | Sort-Object -Unique).Count -gt 1) {
							Add-Flag 'AmbiguousRequestType' $svcName "$where.$methodName" "$rt is handled by several use cases: $((@($ucs | ForEach-Object { $_.Class }) | Sort-Object -Unique) -join ', ')"
						}
						$up = @($ucs | ForEach-Object { $_.Permissions } | Where-Object { $_ } | Sort-Object -Unique)
						if ($up.Count -gt 0) { $ucPerm = $up }
						foreach ($u in $ucs) {
							foreach ($a in $u.Access) { if (-not $access.Contains($a)) { $access.Add($a) } }
							# A use case that calls no IAuthService.Execute*Async itself delegates authorization to a helper.
							if (@($u.Access).Count -eq 0 -and -not $access.Contains('Delegated')) { $access.Add('Delegated') }
							if ($u.RootTenant) { $rootTenant = $true }
							if ($u.RootAdmin) { $rootAdmin = $true }
							if ($u.Dynamic -and -not $ucPerm -and -not $capPerm) { $permSource = 'dynamic' }
							foreach ($n in $u.Notes) { if (-not $permNotes.Contains($n)) { $permNotes.Add($n) } }
							if (-not $capPerm) { foreach ($x in $u.Runtime) { if (-not $permRuntime.Contains($x)) { $permRuntime.Add($x) } } }
						}
					}
					if ($capPerm) {
						foreach ($p in $capPerm) { if (-not $perms.Contains($p)) { $perms.Add($p) } }
						$permSource = 'capability'
						if ($ucPerm -and (Compare-Object @($capPerm) @($ucPerm))) {
							Add-Flag 'PermissionDisagreement' $svcName "$where.$methodName" "$rt [BusinessCapability] says $($capPerm -join ', '); use case requires $($ucPerm -join ', ')"
						}
					}
					elseif ($ucPerm) {
						foreach ($p in $ucPerm) { if (-not $perms.Contains($p)) { $perms.Add($p) } }
						if ($permSource -ne 'capability') { $permSource = 'usecase' }
					}
					if (-not $capIndex.ContainsKey($rt) -and -not $ucIndex.ContainsKey($rt)) {
						$noHandler = $true
						Add-Flag 'NoHandlerFound' $svcName "$where.$methodName" "$rt has no [BusinessCapability] and no use case ExecuteAsync($rt ...) in the indexed source."
					}
				}
				if ($classAnon -or ($at.Items | Where-Object Name -eq 'AllowAnonymous')) { if (-not $access.Contains('Anonymous')) { $access.Add('Anonymous') } }

				$controllerRoot = $bodyM -match 'GetRootTenantId\s*\(' -and ($access -contains 'Tenant')
				# Root-only enforced deeper (in an application service) is invisible to the use-case scan, but the action's
				# own documentation (XML doc, SwaggerOperation Summary/Description) states it. Treat that as declared intent.
				$declaredRoot = $regionO -match '(?i)root[- ]tenant only|only the (?:instance(?:''s)? )?root tenant|root-tenant (?:instance )?administrators only'
				$rootReason = if ($rootTenant) { 'use case authorizes against the root tenant' } elseif ($controllerRoot) { 'controller passes the root tenant id to a tenant-scoped use case' } elseif ($declaredRoot) { 'action documentation declares it root tenant only' } else { $null }
				if ($bodyM -match 'GetRootTenantId\s*\(' -and -not $controllerRoot) {
					Add-Flag 'ControllerUsesRootTenantId' $svcName "$where.$methodName" 'Action passes the root tenant id to a non-tenant-scoped use case; kept in the reference.'
				}
				if ($rootAdmin -and -not $rootTenant) { Add-Flag 'RootAdminCheck' $svcName "$where.$methodName" 'Use case also checks IsRootAdmin (operator path); kept in the reference.' }

				# Retired?
				$methodObsolete = $at.Items | Where-Object Name -eq 'Obsolete' | Select-Object -First 1
				$gone = $bodyM -match 'Status410Gone|StatusCode\s*\(\s*410\b|statusCode\s*:\s*410\b'
				$retiredReason = $null
				if ($classObsolete) { $retiredReason = 'Controller is [Obsolete]' + $(if ($classObsolete.Positional.Count -gt 0) { ': ' + (Get-StringLiteral $classObsolete.Positional[0]) } else { '' }) }
				elseif ($methodObsolete) { $retiredReason = '[Obsolete]' + $(if ($methodObsolete.Positional.Count -gt 0) { ': ' + (Get-StringLiteral $methodObsolete.Positional[0]) } else { '' }) }
				elseif ($gone) { $retiredReason = 'Returns 410 Gone' }

				$methodIgnore = [bool]($at.Items | Where-Object { $_.Name -eq 'ApiExplorerSettings' -and $_.Named.ContainsKey('IgnoreApi') -and $_.Named['IgnoreApi'] -eq 'true' })

				# Templates
				$templates = New-Object System.Collections.Generic.List[object]
				foreach ($va in $verbs) {
					$tpl = $null
					if ($va.Positional.Count -ge 1) {
						$tpl = Get-StringLiteral $va.Positional[0]
						if ($null -eq $tpl) { Add-Flag 'UnresolvedTemplate' $svcName "$where.$methodName" "Template expression not a literal: $($va.Positional[0])"; $tpl = $va.Positional[0] }
					}
					if ($null -eq $tpl -and $va.Named.ContainsKey('template')) { $tpl = Get-StringLiteral $va.Named['template'] }
					$templates.Add([pscustomobject]@{ Verb = $VerbAttr[$va.Name]; Template = $tpl })
				}
				foreach ($av in $acceptVerbs) {
					foreach ($p in $av.Positional) { $vv = Get-StringLiteral $p; if ($vv) { $templates.Add([pscustomobject]@{ Verb = $vv.ToUpperInvariant(); Template = $null }) } }
				}
				$actionToken = if ($methodName.EndsWith('Async')) { $methodName.Substring(0, $methodName.Length - 5) } else { $methodName }
				$an = $at.Items | Where-Object Name -eq 'ActionName' | Select-Object -First 1
				if ($an) { $av2 = Get-StringLiteral $an.Positional[0]; if ($av2) { $actionToken = $av2; if ($actionToken.EndsWith('Async')) { $actionToken = $actionToken.Substring(0, $actionToken.Length - 5) } } }

				foreach ($tp in $templates) {
					$routeBases = New-Object System.Collections.Generic.List[string]
					if ($actionRoutes.Count -gt 0 -and $null -eq $tp.Template) {
						foreach ($ar in $actionRoutes) { foreach ($cr in $classRoutes) { $routeBases.Add((Join-Route $cr (Get-StringLiteral $ar.Positional[0]))) } }
					}
					else { foreach ($cr in $classRoutes) { $routeBases.Add((Join-Route $cr $tp.Template)) } }
					foreach ($rb in $routeBases) {
						$path = Format-Path $rb $resource $actionToken $versionMajor
						$row = [pscustomobject]@{
							Service = $svcName; Controller = $className; Resource = $resource; Method = $methodName
							Verb = $tp.Verb; Path = $path; Request = ($requestTypes -join ', ')
							Permission = ($perms -join ', '); PermissionNote = ($permNotes -join '; '); PermissionRuntime = ($permRuntime -join '; ');PermissionSource = $(if ($perms.Count -gt 0) { $permSource } elseif ($permSource -eq 'dynamic') { 'dynamic' } else { 'none' })
							Access = ($access -join ', '); Summary = $summary; SummarySource = $summarySource
							Retired = $retiredReason; File = $rel; Line = $line; Status = 'Documented'
							NoDispatch = ($requestTypes.Count -eq 0); CallsService = $callsService
						}
						if ($classIgnore -or $methodIgnore) { $row.Status = 'Internal'; if ($methodIgnore -and -not $classIgnore) { Add-Flag 'InternalAction' $svcName "$where.$methodName" '[ApiExplorerSettings(IgnoreApi = true)] on the action: excluded.' } }
						elseif ($rootReason) { $row.Status = 'RootTenantOnly'; Add-Flag 'RootTenantOnly' $svcName "$where.$methodName" "$($tp.Verb) $path excluded: $rootReason." }
						elseif ($noHandler) { $row.Status = 'NoHandler' }
						elseif ($isStub) { $row.Status = 'Stub' }
						elseif ($requestTypes.Count -eq 0 -and -not $callsService) { $row.Status = 'NoDispatchNoService' }
						elseif ($retiredReason) { $row.Status = 'Retired' }
						$rows.Add($row)
						$allRows.Add($row)
					}
				}
			}
			$controllers.Add([pscustomobject]@{ Name = $className; Resource = $resource; File = $rel; Rows = $rows; Ignored = $classIgnore })
		}
	}
	if ($controllers.Count -gt 0) { $services.Add([pscustomobject]@{ Name = $svcName; Controllers = $controllers }) }
}

# ---------------------------------------------------------------------------------------------------------------
# 3b. Resource headings. A row under /<Resource>/<Segment> whose singular-resource + segment (or resource + segment)
#     names another controller's resource in the same service is shown under that resource's heading.
foreach ($svc in $services) {
	$resNames = @{}
	foreach ($c in $svc.Controllers) { $resNames[$c.Resource] = $true }
	foreach ($c in $svc.Controllers) {
		foreach ($r in $c.Rows) {
			$r | Add-Member -NotePropertyName DisplayResource -NotePropertyValue $r.Resource -Force
			$pm3 = [regex]::Match($r.Path, '^/api/v\d+/[^/]+/([^/{}]+)/([A-Za-z]+)(?:/|$)')
			if (-not $pm3.Success -or $pm3.Groups[1].Value -cne $r.Resource) { continue }
			$res = $r.Resource; $seg = $pm3.Groups[2].Value
			$singular = if ($res.EndsWith('ies')) { $res.Substring(0, $res.Length - 3) + 'y' } elseif ($res.EndsWith('s')) { $res.Substring(0, $res.Length - 1) } else { $res }
			foreach ($cand in @(($singular + $seg), ($res + $seg))) {
				if ($cand -cne $res -and $resNames.ContainsKey($cand)) {
					$r.DisplayResource = $cand
					if ($r.Status -eq 'Documented') { Add-Flag 'ResourceMerged' $svc.Name "$($r.File) ($($r.Controller)).$($r.Method)" "$($r.Verb) $($r.Path) shown under $cand" }
					break
				}
			}
		}
	}
}

# 4. Render
# ---------------------------------------------------------------------------------------------------------------
function Compare-Rows {
	param($Rows)
	$list = New-Object 'System.Collections.Generic.List[object]'
	foreach ($r in $Rows) { $list.Add($r) }
	$cmp = [System.Comparison[object]] {
		param($a, $b)
		$c = [string]::CompareOrdinal($a.Path, $b.Path)
		if ($c -ne 0) { return $c }
		$c = $VerbOrder[$a.Verb] - $VerbOrder[$b.Verb]
		if ($c -ne 0) { return $c }
		return [string]::CompareOrdinal($a.Method, $b.Method)
	}
	$list.Sort($cmp)
	return , $list
}

function Get-RouteSegment($Svc) {
	$counts = @{}
	foreach ($c in $Svc.Controllers) { foreach ($r in $c.Rows) { if ($r.Path -match '^/api/v\d+/(\w+)/') { $counts[$Matches[1]] = 1 + $(if ($counts.ContainsKey($Matches[1])) { $counts[$Matches[1]] } else { 0 }) } } }
	if ($counts.Count -eq 0) { return $null }
	return ($counts.GetEnumerator() | Sort-Object -Property @{ Expression = { -$_.Value } }, @{ Expression = { $_.Key } } | Select-Object -First 1).Key
}

if (-not (Test-Path -LiteralPath $OutputDir)) { New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null }
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$written = New-Object System.Collections.Generic.List[object]
$skippedFiles = New-Object System.Collections.Generic.List[string]

$sortedServices = New-Object 'System.Collections.Generic.List[object]'
foreach ($sv in $services) { $sortedServices.Add($sv) }
$sortedServices.Sort([System.Comparison[object]] { param($a, $b) [string]::CompareOrdinal($a.Name, $b.Name) })

foreach ($svc in $sortedServices) {
	$documented = @($svc.Controllers | ForEach-Object { $_.Rows } | Where-Object Status -eq 'Documented')
	$retired = @($svc.Controllers | ForEach-Object { $_.Rows } | Where-Object Status -eq 'Retired')
	$noPublic = ($documented.Count -eq 0 -and $retired.Count -eq 0)
	if ($noPublic) { Add-Flag 'NoPublicActions' $svc.Name '' 'No public endpoint left after exclusions; the page says so (it is still written so a stale page cannot survive).' }

	$segment = Get-RouteSegment $svc
	$L = New-Object System.Collections.Generic.List[string]
	$L.Add($MarkerStart)
	$h1Index = $L.Count
	$L.Add("# $($svc.Name) service reference")
	$L.Add('')
	$L.Add('> This page is generated from the controller source by `Docs.Customer/tools/New-ServiceReference.ps1`. Do not edit the content between the generated markers; rerun the generator instead.')
	$L.Add('')
	if ($segment) { $L.Add("Route segment: ``$segment``. Paths are relative to the API host. Workspace endpoints read the workspace from the ``tenantId`` request value (for example the query string) or the ``X-TenantId`` header.") ; $L.Add('') }
	$L.Add('Columns: **Permission** is the permission the caller needs (blank when the endpoint declares none). **Who can call**: Workspace member (a member of the workspace, holding the permission when one is listed), Signed-in user (any signed-in user), Public (no sign-in needed), or Checked by the service (the service decides per record, for example a workspace member or an enrolled learner).')
	$L.Add('')

	# One heading per resource. Rows are grouped by DisplayResource, so a resource served by two controllers (for
	# example /AssetCategories and /Assets/Categories) appears once, with both routes.
	$headings = New-Object 'System.Collections.Generic.List[string]'
	foreach ($r in $documented) { if (-not $headings.Contains($r.DisplayResource)) { $headings.Add($r.DisplayResource) } }
	$headings.Sort([System.StringComparer]::Ordinal)

	foreach ($h in $headings) {
		$rows = @($documented | Where-Object { $_.DisplayResource -ceq $h })
		if ($rows.Count -eq 0) { continue }
		$L.Add("## $h")
		$L.Add('')
		$L.Add('| Verb | Path | Permission | Who can call | Summary |')
		$L.Add('| --- | --- | --- | --- | --- |')
		foreach ($r in (Compare-Rows $rows)) {
			$perm = Format-PermissionCell $r
			$L.Add("| $($r.Verb) | ``$(ConvertTo-Cell $r.Path)`` | $perm | $(ConvertTo-Cell (ConvertTo-CustomerAccess $r.Access)) | $(ConvertTo-Cell $r.Summary) |")
		}
		$L.Add('')
	}

	if ($noPublic) { $L.Add('This service has no public endpoints in this release.'); $L.Add('') }

	if ($retired.Count -gt 0) {
		$L.Add('## Retired')
		$L.Add('')
		$L.Add('These endpoints are still served but are retired. Do not build new integrations on them.')
		$L.Add('')
		$L.Add('| Resource | Verb | Path | Reason |')
		$L.Add('| --- | --- | --- | --- |')
		$rr = Compare-Rows $retired
		$rrList = New-Object 'System.Collections.Generic.List[object]'
		foreach ($x in $rr) { $rrList.Add($x) }
		$rrList.Sort([System.Comparison[object]] { param($a, $b) $x = [string]::CompareOrdinal($a.Resource, $b.Resource); if ($x -ne 0) { $x } else { $y = [string]::CompareOrdinal($a.Path, $b.Path); if ($y -ne 0) { $y } else { $VerbOrder[$a.Verb] - $VerbOrder[$b.Verb] } } })
		foreach ($r in $rrList) {
			$L.Add("| $(ConvertTo-Cell $r.Resource) | $($r.Verb) | ``$(ConvertTo-Cell $r.Path)`` | $(ConvertTo-Cell $r.Retired) |")
		}
		$L.Add('')
	}
	$L.Add("Generated from the source at commit $platformCommit.")
	$L.Add($MarkerEnd)

	$target = Join-Path $OutputDir "$($svc.Name).md"
	$existing = $null
	if (Test-Path -LiteralPath $target) {
		$existing = [System.IO.File]::ReadAllText($target)
		$si = $existing.IndexOf($MarkerStart, [System.StringComparison]::Ordinal)
		$ei = $existing.IndexOf($MarkerEnd, [System.StringComparison]::Ordinal)
		if ($si -lt 0 -or $ei -lt $si) { $skippedFiles.Add($target); Add-Flag 'ExistingFileWithoutMarkers' $svc.Name $target 'File exists without generated markers; not overwritten.'; continue }
		# A hand-written H1 outside the markers wins; the generated H1 (and its blank line) is then left out.
		$outside = $existing.Substring(0, $si) + "`n" + $existing.Substring($ei + $MarkerEnd.Length)
		if ($outside -match '(?m)^#[ \t]+\S') { $L.RemoveAt($h1Index); $L.RemoveAt($h1Index) }
	}
	$block = ($L | ForEach-Object { ConvertTo-AsciiLine $_ }) -join "`r`n"
	if ($null -ne $existing) {
		$content = $existing.Substring(0, $si) + $block + $existing.Substring($ei + $MarkerEnd.Length)
		$content = ($content -replace "`r?`n", "`r`n")
	}
	else { $content = $block + "`r`n" }
	[System.IO.File]::WriteAllText($target, $content, $utf8NoBom)
	$written.Add([pscustomobject]@{
		Service = $svc.Name; File = $target
		Controllers = @($svc.Controllers | Where-Object { @($_.Rows | Where-Object Status -eq 'Documented').Count -gt 0 }).Count
		Resources = @($documented | ForEach-Object { $_.DisplayResource } | Sort-Object -Unique).Count
		Actions = $documented.Count; Retired = $retired.Count
		WithPermission = @($documented | Where-Object { $_.Permission }).Count
	})
}

# ---------------------------------------------------------------------------------------------------------------
# 5. Run summary
# ---------------------------------------------------------------------------------------------------------------
$docRows = @($allRows | Where-Object Status -eq 'Documented')
$bySource = $docRows | Group-Object -Property PermissionSource | Sort-Object -Property Name -Culture 'en-US'
Write-Host ''
Write-Host "New-ServiceReference: $($written.Count) page(s) written to $OutputDir"
Write-Host "Controllers parsed: $controllerCount; index files scanned: $indexFiles; capability types: $($capIndex.Count); use-case types: $($ucIndex.Count); permission constants: $($permissionMap.Count)"
Write-Host ''
Write-Host ('{0,-16} {1,11} {2,8} {3,8} {4,12}' -f 'Service', 'Controllers', 'Actions', 'Retired', 'Permission')
foreach ($w in $written) { Write-Host ('{0,-16} {1,11} {2,8} {3,8} {4,12}' -f $w.Service, $w.Controllers, $w.Actions, $w.Retired, "$($w.WithPermission)/$($w.Actions)") }
$tot = 0; $totP = 0; $totC = 0; $totR = 0
foreach ($w in $written) { $tot += $w.Actions; $totP += $w.WithPermission; $totC += $w.Controllers; $totR += $w.Retired }
Write-Host ('{0,-16} {1,11} {2,8} {3,8} {4,12}' -f 'TOTAL', $totC, $tot, $totR, "$totP/$tot")
Write-Host ''
Write-Host 'Permission source (documented actions):'
foreach ($g in $bySource) { Write-Host ("  {0,-12} {1}" -f $g.Name, $g.Count) }
Write-Host 'Summary source (documented actions):'
foreach ($g in ($docRows | Group-Object -Property SummarySource | Sort-Object -Property Name -Culture 'en-US')) { Write-Host ("  {0,-12} {1}" -f $g.Name, $g.Count) }
Write-Host 'Row status (all parsed actions):'
foreach ($g in ($allRows | Group-Object -Property Status | Sort-Object -Property Name -Culture 'en-US')) { Write-Host ("  {0,-16} {1}" -f $g.Name, $g.Count) }
Write-Host ''
Write-Host 'Flags:'
foreach ($g in ($flags | Group-Object -Property Kind | Sort-Object -Property Name -Culture 'en-US')) { Write-Host ("  {0,-28} {1}" -f $g.Name, $g.Count) }
foreach ($k in @('ResourceMerged', 'InternalController', 'InternalAction', 'RootTenantOnly', 'NoMediatorDispatch', 'NoHandlerFound', 'AmbiguousRequestType', 'PermissionDisagreement', 'RootAdminCheck', 'ControllerUsesRootTenantId', 'NoClassRoute', 'MultipleClassRoutes', 'UnresolvedTemplate', 'NoVerbAttribute', 'NoPublicActions', 'ExistingFileWithoutMarkers')) {
	$items = @($flags | Where-Object Kind -eq $k)
	if ($items.Count -eq 0) { continue }
	Write-Host ''
	Write-Host "[$k]"
	foreach ($it in $items) { Write-Host "  $($it.Service) | $($it.Where) | $($it.Detail)" }
}

function Write-RowList([string]$Path, $Rows, [scriptblock]$Format) {
	$list = New-Object 'System.Collections.Generic.List[string]'
	foreach ($r in $Rows) { $list.Add((& $Format $r)) }
	$list.Sort([System.StringComparer]::Ordinal)
	$dirOf = Split-Path -Parent $Path
	if ($dirOf -and -not (Test-Path -LiteralPath $dirOf)) { New-Item -ItemType Directory -Path $dirOf -Force | Out-Null }
	[System.IO.File]::WriteAllText($Path, (($list -join "`r`n") + "`r`n"), $utf8NoBom)
	Write-Host "List ($($list.Count) rows): $Path"
}
if ($NoHandlerListPath) {
	Write-RowList $NoHandlerListPath @($allRows | Where-Object Status -eq 'NoHandler') { param($r) "$($r.Service) | $($r.Verb) | $($r.Path) | $($r.Request)" }
}
if ($StubListPath) {
	Write-RowList $StubListPath @($allRows | Where-Object Status -eq 'Stub') { param($r) "$($r.Service) | $($r.Verb) | $($r.Path) | $($r.File):$($r.Line)" }
}
if ($NoMediatorListPath) {
	# Every action without a mediator call, whatever its final status, with the decision taken for the public page.
	Write-RowList $NoMediatorListPath @($allRows | Where-Object NoDispatch) {
		param($r)
		$decision = if ($r.Status -eq 'Documented') { 'kept (calls a service)' } elseif ($r.Status -eq 'NoDispatchNoService') { 'removed (no service call)' } else { "removed ($($r.Status))" }
		"$($r.Service) | $($r.Verb) | $($r.Path) | $($r.File):$($r.Line) | $decision"
	}
}

if ($SummaryPath) {
	$summaryObj = [pscustomobject]@{
		OutputDir = $OutputDir; Pages = $written; ControllersParsed = $controllerCount
		Flags = $flags; Rows = $allRows
	}
	[System.IO.File]::WriteAllText($SummaryPath, ($summaryObj | ConvertTo-Json -Depth 6), $utf8NoBom)
	Write-Host ''
	Write-Host "Summary JSON: $SummaryPath"
}
