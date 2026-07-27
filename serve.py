#!/usr/bin/env python3
"""Serve the Alliance Business Suite customer documentation (DocFX _site).

Zero-dependency static file server for the DocFX build output. It locates the
_site folder next to this script, so you can run it from anywhere:

    python serve.py                 # serve the existing build on http://127.0.0.1:8085
    python serve.py --build         # run 'docfx build docfx.json' first, then serve
    python serve.py --port 9000     # serve on a different port
    python serve.py --open          # open the site in the default browser
    python serve.py --host 0.0.0.0  # expose on the LAN (use with care)

If _site does not exist yet, it is built automatically. Stop with Ctrl+C.
"""
import argparse
import functools
import http.server
import os
import subprocess
import sys
import webbrowser

HERE = os.path.dirname(os.path.abspath(__file__))
SITE_DIR = os.path.join(HERE, "_site")
DOCFX_JSON = os.path.join(HERE, "docfx.json")


def build_site():
    """Run 'docfx build docfx.json' in the docs folder."""
    if not os.path.isfile(DOCFX_JSON):
        sys.exit("error: docfx.json not found next to serve.py ({0})".format(HERE))
    print("Building DocFX site: docfx build docfx.json")
    result = subprocess.run(["docfx", "build", "docfx.json"], cwd=HERE)
    if result.returncode != 0:
        sys.exit("error: docfx build failed (exit {0})".format(result.returncode))


class Server(http.server.ThreadingHTTPServer):
    # Allow an immediate restart on the same port after Ctrl+C.
    allow_reuse_address = True


def main():
    parser = argparse.ArgumentParser(
        description="Serve the ABS customer documentation (DocFX _site)."
    )
    parser.add_argument("--port", type=int, default=8085,
                        help="port to serve on (default 8085)")
    parser.add_argument("--host", default="127.0.0.1",
                        help="bind host (default 127.0.0.1; use 0.0.0.0 for LAN)")
    parser.add_argument("--build", action="store_true",
                        help="run 'docfx build docfx.json' before serving")
    parser.add_argument("--open", dest="open_browser", action="store_true",
                        help="open the site in the default browser")
    args = parser.parse_args()

    # Print progress immediately even when stdout is redirected to a file/pipe.
    try:
        sys.stdout.reconfigure(line_buffering=True)
    except (AttributeError, ValueError):
        pass

    if args.build or not os.path.isdir(SITE_DIR):
        if not args.build:
            print("_site not found -- building it first.")
        build_site()

    if not os.path.isdir(SITE_DIR):
        sys.exit("error: _site does not exist even after build ({0})".format(SITE_DIR))

    # Make sure the MIME types DocFX relies on are served correctly.
    http.server.SimpleHTTPRequestHandler.extensions_map.update({
        ".json": "application/json",
        ".yml": "text/yaml",
        ".svg": "image/svg+xml",
        ".woff": "font/woff",
        ".woff2": "font/woff2",
    })

    handler = functools.partial(
        http.server.SimpleHTTPRequestHandler, directory=SITE_DIR
    )

    display_host = "localhost" if args.host in ("127.0.0.1", "0.0.0.0") else args.host
    url = "http://{0}:{1}/".format(display_host, args.port)

    try:
        httpd = Server((args.host, args.port), handler)
    except OSError as exc:
        sys.exit("error: could not bind {0}:{1} ({2})".format(args.host, args.port, exc))

    print("Serving {0}".format(SITE_DIR))
    print("  -> {0}".format(url))
    print("Press Ctrl+C to stop.")
    if args.open_browser:
        webbrowser.open(url)

    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\nStopped.")
    finally:
        httpd.server_close()


if __name__ == "__main__":
    main()
