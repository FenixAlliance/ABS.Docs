<!-- DRAFT, not linked from the index or the changelog. Grounded on origin/develop since v2.7.0 (fab52b4d41), refreshed 2026-10-20 at eaf0252a0f. The Team Lead reviews before anything is published. -->

# Alliance Business Suite 2.7.1 (draft)

## English

```markdown
## [2.7.1] - TBD

### Added

- **A monthly AI budget on every plan.** Each plan now includes a monthly budget for the AI that Alliance Business Suite pays for: Free USD 1, Starter USD 8, Growth USD 25, Professional USD 40 and Business USD 80. It is one shared pool for the whole workspace, and anyone without a personal limit can use the whole pool. Annual plans get the same monthly figure for every month. AI does not stop at the budget yet (see Coming).
- **Your own AI limits, on the usage page.** Each person sees what is left of their AI for the session, the week and the month, and of the workspace pool.
- **Demo and internal plans.** Fenix Alliance can give a workspace a Demo plan or an Internal plan without a sale, and remove it. A workspace on such a plan cannot buy AI credit packs.
- **Module access for a set time.** When Fenix Alliance gives your workspace access to a module, the grant has a term: a Demo lasts the days set on it (30 by default, up to 90), and an Internal grant lasts until it is removed.
- **Courses in a collection, from Studio.** The course collections list has a Courses action to see, add and remove a collection's courses.

### Improved

- A plan change you confirm right at the end of its price quote now asks you to see the price again, instead of showing an error.
- A renewal invoice that is voided now says why: replaced by your new plan, cancelled at the end of the period, or the subscription ended.

### Fixed

- A renewal invoice issued just as a subscription ended, through a refund or a plan change, is now voided automatically.
- Accounting: a posting never picks a fiscal period when more than one could apply, and a fiscal period is only ever written into your own fiscal year.

### Security

- The guest cart cookie is signed, so a cart can only be reached by the visitor it belongs to.
- Sign-in, workspace switching and image saves only send you back to pages on this site.
- Public product pages return only what is meant to be public: reviews, questions, images and attachments of publicly visible items.
- A file whose malware scan never arrives is held back after 60 minutes and never served until the scan clears it.
- Payment provider evidence and payer identity checks no longer appear in general payment reads.
- An agent's checkout needs an approval unless a person is buying directly.
- Changes our team makes to your workspace from the platform administration console need an administrator acting as themselves, never an agent or an automation, and every change is recorded.
- A suspended or disabled account cannot run anything in the background.
- Live updates check that you still belong to what you are watching, and stop for anyone who no longer does.
- Our deployment and administration scripts take their secrets from the environment and check the certificate of every server they connect to.

### Coming in 2.7.1

- **AI usage limits.** AI stops at your plan's monthly budget, with raises you approve.
- **Prepaid AI credit packs**, for plans with a monthly AI budget.
- **Background agent runs.** An agent keeps working after you close the page, for up to 60 minutes, and Nucleus tells you when it finishes. Up to 5 running at once per person and 25 per workspace.
- **Several accounts per integration**, including your personal ones, with an account picker and a default.
- **Connecting Google and Microsoft accounts** to your integrations.
- **Agents that use your connected accounts safely**, only with your consent for each agent and account, with approvals for anything consequential, revocable at any time and always recorded.
- **Team conversations** with agents.
- **Stronger protection for invoice credits**, so two credits landing on one invoice at the same moment can never exceed it.
```

## Español

```markdown
## [2.7.1] - Por definir

### Novedades

- **Un presupuesto mensual de IA en cada plan.** Cada plan incluye ahora un presupuesto mensual para la IA que paga Alliance Business Suite: Gratis USD 1, Starter USD 8, Growth USD 25, Professional USD 40 y Business USD 80. Es un solo cupo compartido por todo el espacio de trabajo, y quien no tenga un límite personal puede usar todo el cupo. Los planes anuales reciben la misma cifra mensual cada mes. La IA todavía no se detiene al llegar al presupuesto (ver Próximamente).
- **Tus propios límites de IA, en la página de uso.** Cada persona ve cuánto le queda de IA en la sesión, la semana y el mes, y cuánto queda del cupo del espacio.
- **Planes de demostración e internos.** Fenix Alliance puede darle a un espacio un plan Demo o un plan Interno sin una venta, y retirarlo. Un espacio con uno de esos planes no puede comprar paquetes de créditos de IA.
- **Acceso a módulos por un tiempo definido.** Cuando Fenix Alliance le da a tu espacio acceso a un módulo, el acceso tiene un plazo: una Demo dura los días fijados (30 por defecto, hasta 90), y un acceso Interno dura hasta que se retira.
- **Cursos de una colección, desde Studio.** La lista de colecciones de cursos tiene una acción Cursos para ver, agregar y quitar los cursos de una colección.

### Mejoras

- Un cambio de plan que confirmas justo al final de su cotización ahora te pide ver el precio de nuevo, en lugar de mostrar un error.
- Una factura de renovación anulada ahora dice por qué: la reemplazó tu nuevo plan, se canceló al final del periodo o la suscripción terminó.

### Correcciones

- Una factura de renovación emitida justo cuando una suscripción terminaba, por un reembolso o un cambio de plan, ahora se anula automáticamente.
- Contabilidad: un asiento nunca escoge un periodo fiscal cuando podría aplicar más de uno, y un periodo fiscal solo se escribe dentro de tu propio año fiscal.

### Seguridad

- La cookie del carrito de invitado va firmada, así que un carrito solo lo alcanza el visitante al que pertenece.
- El inicio de sesión, el cambio de espacio y el guardado de imágenes solo te devuelven a páginas de este sitio.
- Las páginas públicas de productos devuelven solo lo que debe ser público: reseñas, preguntas, imágenes y adjuntos de artículos visibles al público.
- Un archivo cuyo análisis de malware nunca llega queda retenido a los 60 minutos y no se entrega hasta que el análisis lo libere.
- La evidencia del proveedor de pagos y las verificaciones de identidad de quien paga ya no aparecen en las lecturas generales de pagos.
- El pago de un agente necesita una aprobación, salvo que una persona esté comprando directamente.
- Los cambios que nuestro equipo hace en tu espacio desde la consola de administración de la plataforma requieren un administrador que actúe como sí mismo, nunca un agente ni una automatización, y cada cambio queda registrado.
- Una cuenta suspendida o deshabilitada no puede ejecutar nada en segundo plano.
- Las actualizaciones en vivo verifican que sigues perteneciendo a lo que estás viendo, y se detienen para quien ya no pertenece.
- Nuestros scripts de despliegue y administración toman sus secretos del entorno y verifican el certificado de cada servidor al que se conectan.

### Próximamente en la 2.7.1

- **Límites de uso de IA.** La IA se detiene al llegar al presupuesto mensual de tu plan, con aumentos que tú apruebas.
- **Paquetes de créditos de IA prepagados**, para planes con presupuesto mensual de IA.
- **Ejecuciones de agentes en segundo plano.** Un agente sigue trabajando después de que cierras la página, hasta por 60 minutos, y Nucleus te avisa cuando termina. Hasta 5 en curso a la vez por persona y 25 por espacio.
- **Varias cuentas por integración**, incluidas las personales, con un selector de cuenta y una predeterminada.
- **Conectar cuentas de Google y Microsoft** a tus integraciones.
- **Agentes que usan tus cuentas conectadas de forma segura**, solo con tu consentimiento para cada agente y cuenta, con aprobaciones para lo importante, revocable en cualquier momento y siempre registrado.
- **Conversaciones en equipo** con agentes.
- **Más protección para los abonos de una factura**, para que dos abonos que llegan al mismo tiempo nunca la superen.
```

## Grounding (remove before publishing)

| Line | origin/develop |
|---|---|
| Plan AI budget, shared pool, annual = monthly, not enforced | 2018e05b5b, e340e10bbe |
| Your AI limits on the usage page | 2022266a31 |
| Demo and Internal plan grants; no credit packs on them | e0be0ce907, eca03ede91, ddd76205c4, ed6c2e83a3, 0d4f51850c |
| Module grant term (Demo 30, max 90; Internal open) | 6e436788d6 |
| Collection courses in Studio | 9f752f8f9f |
| Plan change re-preview at the quote edge | 2018e05b5b |
| Voided renewal says why | dac6b7711e |
| Renewal invoice voided after refund or plan-change end | 846cee95cc |
| Fiscal period fixes | e4ce91888b, 8086a35b65 |
| Signed guest cart cookie | 3aac0e9e77, 5cfa024b75 |
| Redirects stay on this site | e015e259ec, ce659b6975, 141564049d |
| Public item reads | cbca47146c, 68503e7339, af43fbe2f1 |
| Malware scan quarantine | f9121e4265 |
| Payment evidence and KYC out of general reads | e87cd96dd2 |
| Agent checkout needs approval | 3e7ba19684 |
| Platform admin needs a root admin acting as themselves, audited | 527ac10011, b623867cb7, fbdd0687b6 |
| Suspended account runs nothing off-request | ffeb4ec3c7 |
| Live update membership re-check | 000f3acd6f |
| Scripts: secrets and certificate checks | 02354f9d74, c8062ab0d3 |
| Coming: background runs (routes and host built, switched off) | 54b299b31b, 7d72fd38c4, a4b60a9e51 |
| Coming: Google and Microsoft accounts (server side only) | 60df269970, a689bca1e9 |
| Coming: connected-account use by agents (seams and action catalogues only) | a01daba901, cca3de20e4, 11054e93d1, fafec3eb9f |
| Coming: invoice credit protection (part 1 only, part 2 with the 2.7.1 migration) | 880ccedb0f |
| Not on origin: several accounts per integration, team conversations, AI enforcement, credit packs on | none |
| Left out as internal: Data Protection key re-protection and Key Vault wrapping, OpenIddict key re-issue, tenant purge blob cleanup, test isolation | 3c5d5525ec, dd026decfb, 6a86985258, 27f1c00f82, and the test commits |
