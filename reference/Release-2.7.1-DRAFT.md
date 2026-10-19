<!-- DRAFT, not linked from the index or the changelog. Grounded on origin/develop since v2.7.0 (fab52b4d41) as of 2026-10-19. The Team Lead reviews before anything is published. -->

# Alliance Business Suite 2.7.1 (draft)

## English

```markdown
## [2.7.1] - TBD

### Added

- **A monthly AI budget on every plan.** Each plan now includes a monthly budget for the AI that Alliance Business Suite pays for: Free USD 1, Starter USD 8, Growth USD 25, Professional USD 40 and Business USD 80. It is one shared pool for the whole workspace, and anyone without a personal limit can use the whole pool. Annual plans get the same monthly figure for every month. AI does not stop at the budget yet (see Coming).

### Improved

- A plan change you confirm right at the end of its price quote now asks you to see the price again, instead of showing an error.

### Fixed

- A renewal invoice issued just as a subscription ended, through a refund or a plan change, is now voided automatically.

### Security

- Changes our team makes to your workspace from the platform administration console now need an administrator acting as themselves, never an agent or an automation, and every change is recorded.
- Our deployment and administration scripts take their secrets from the environment and check the certificate of every server they connect to.

### Coming in 2.7.1

- **AI usage limits.** AI stops at your plan's monthly budget, with raises you approve.
- **Prepaid AI credit packs**, for plans with a monthly AI budget.
- **Background agent runs.** An agent keeps working after you close the page, for up to 60 minutes, and Nucleus tells you when it finishes. Up to 5 running at once per person and 25 per workspace.
- **Module access grants.** Fenix Alliance can give your workspace access to a module for a set time, shown with a "Granted by Fenix Alliance" badge.
- **Several accounts per integration**, including your personal ones, with an account picker and a default.
- **Agents that use your connected accounts safely**, only with your consent for each agent and account, with approvals for anything consequential, revocable at any time and always recorded.
- **Sign in with Google and Microsoft accounts** for integrations.
- **Team conversations** with agents.
- **Stronger protection for invoice credits**, so two credits landing on one invoice at the same moment can never exceed it.
```

## Español

```markdown
## [2.7.1] - Por definir

### Novedades

- **Un presupuesto mensual de IA en cada plan.** Cada plan incluye ahora un presupuesto mensual para la IA que paga Alliance Business Suite: Gratis USD 1, Starter USD 8, Growth USD 25, Professional USD 40 y Business USD 80. Es un solo cupo compartido por todo el espacio de trabajo, y quien no tenga un límite personal puede usar todo el cupo. Los planes anuales reciben la misma cifra mensual cada mes. La IA todavía no se detiene al llegar al presupuesto (ver Próximamente).

### Mejoras

- Un cambio de plan que confirmas justo al final de su cotización ahora te pide ver el precio de nuevo, en lugar de mostrar un error.

### Correcciones

- Una factura de renovación emitida justo cuando una suscripción terminaba, por un reembolso o un cambio de plan, ahora se anula automáticamente.

### Seguridad

- Los cambios que nuestro equipo hace en tu espacio desde la consola de administración de la plataforma ahora requieren un administrador que actúe como sí mismo, nunca un agente ni una automatización, y cada cambio queda registrado.
- Nuestros scripts de despliegue y administración toman sus secretos del entorno y verifican el certificado de cada servidor al que se conectan.

### Próximamente en la 2.7.1

- **Límites de uso de IA.** La IA se detiene al llegar al presupuesto mensual de tu plan, con aumentos que tú apruebas.
- **Paquetes de créditos de IA prepagados**, para planes con presupuesto mensual de IA.
- **Ejecuciones de agentes en segundo plano.** Un agente sigue trabajando después de que cierras la página, hasta por 60 minutos, y Nucleus te avisa cuando termina. Hasta 5 en curso a la vez por persona y 25 por espacio.
- **Accesos a módulos otorgados.** Fenix Alliance puede darle a tu espacio acceso a un módulo por un tiempo definido, con la etiqueta "Otorgado por Fenix Alliance".
- **Varias cuentas por integración**, incluidas las personales, con un selector de cuenta y una predeterminada.
- **Agentes que usan tus cuentas conectadas de forma segura**, solo con tu consentimiento para cada agente y cuenta, con aprobaciones para lo importante, revocable en cualquier momento y siempre registrado.
- **Inicio de sesión con cuentas de Google y Microsoft** para las integraciones.
- **Conversaciones en equipo** con agentes.
- **Más protección para los abonos de una factura**, para que dos abonos que llegan al mismo tiempo nunca la superen.
```

## Grounding (remove before publishing)

| Line | origin/develop |
|---|---|
| Plan AI budget, shared pool, annual = monthly | 2018e05b5b |
| Plan change re-preview at the quote edge | 2018e05b5b (quote valid 290 s) |
| Renewal invoice voided after refund or plan-change end | 846cee95cc |
| Platform admin changes need a root admin acting as themselves, audited | 527ac10011 |
| Scripts: secrets from the environment, certificate checks | 02354f9d74, c8062ab0d3 |
| Credit packs only for plans with a monthly AI allowance (Coming) | 1f13bb01e4 |
| Background runs (Coming): store and statuses only | 7d72fd38c4, 0ee0c993a8, c8fde7c47b |
| Connected-account use by agents (Coming): action catalogue only | a01daba901 |
| Invoice credit protection (Coming): part 1 only, part 2 needs the 2.7.1 migration | 880ccedb0f |
| Not on origin: guest-cart cookie signing, module grants, several accounts per integration, Google and Microsoft sign-in, team conversations, AI enforcement, credit packs on | none |
