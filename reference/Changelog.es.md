# Registro de cambios

Aquí se registran los cambios importantes de Alliance Business Suite, en español, desde la versión 2.7.0.

El formato sigue [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/), y el proyecto usa [versionado semántico](https://semver.org/lang/es/).

> Las versiones anteriores a la 2.7.0 están en el [registro de cambios en inglés](Changelog.md).

## [2.7.0] - 2026-10-20

**Tu equipo de personas y agentes, sobre IA gobernada.**
Los agentes trabajan con su propia identidad, bajo aprobaciones en las que puedes confiar. Esta versión también incluye los cambios de la 2.5.0 y la 2.6.0.

### Novedades

- **Agentes con identidad propia.** Un agente puede tener un rol que tú permites, reducido a lo que de verdad necesita cada vez que actúa. Quienes administran el espacio ven y cambian las capacidades de cada agente una por una.
- **Aprobaciones en las que puedes confiar.** Las acciones con peso económico o legal, como emitir una factura, agregarle una nota o borrarla, y el pago de un agente, esperan a que una persona apruebe exactamente lo que va a pasar. La tarjeta de aprobación muestra lo que apruebas, fijado al abrir la solicitud, y una decisión solo cuenta mientras quien aprueba conserve el permiso.
- **Conversaciones largas que no pierden el contexto.** Los agentes conservan el hilo de una conversación larga: los turnos antiguos se resumen, los resultados grandes se guardan y se leen por páginas, y un agente puede recordar partes anteriores de la conversación.
- **Facturas que recibes.** Una pestaña Recibidas en las facturas de tu Billetera, en Studio, muestra las facturas que te enviaron otras organizaciones.
- **Uso de IA a la vista.** El uso de IA ahora se mide por espacio de trabajo y por persona, así que puedes ver en Nucleus Web cuánto usa tu equipo.
- **Opciones de IA del espacio.** Decide en Studio si los agentes pueden usar el control del computador y la grabación de voz, y cuánto tiempo pueden conservar tus datos los proveedores de IA.
- **Búsqueda, configurada desde Studio.** Configura la búsqueda de tu espacio en Studio, mira su estado en palabras claras y elige qué automatización ejecuta.
- **Organización.** Archiva y restaura departamentos, cargos y equipos con la vista "Mostrar archivados", y ve la tarjeta de un equipo al pasar el cursor.
- **Talento humano.** Páginas de Studio para flujos y etapas de evaluación, tipos de licencia, programas de formación, periodos de nómina, tipos de empleado y cargos, además de acciones del ciclo de vida de trabajos por encargo y empleadores.
- **Contabilidad.** Líneas de presupuesto en Studio, balance de prueba por libro a la tasa de cierre del periodo y un resumen del estado de resultados.
- **Cursos.** Define el precio y la moneda de un curso en Studio y ve el estado de cada matrícula.
- **Banners.** Cambia la ubicación y el portal de una asignación de banner sin crearla de nuevo.

### Mejoras

- El estado de un pedido sigue su ciclo de vida real, y ya funcionan las rutas restantes de Logística y de unidades de negocio.
- Los errores de GraphQL usan los mismos códigos estables que la API REST.
- Las alertas de producción avisan ante tipos de error nuevos y ante ráfagas.

### Seguridad

- Los enlaces de pago y los inicios de pago tienen límite de frecuencia, y el cobro en vivo se puede apagar al instante si hace falta.
- Cada intento de borrar un espacio de trabajo deja un registro de auditoría que el borrado no puede eliminar.
- El seguimiento de correos y la respuesta de los proveedores quedan atados a la entrega a la que pertenecen, y los enlaces de seguimiento mal formados se rechazan de entrada.
- Un agente nunca puede pasar por persona donde se exige la identidad de una persona.
- Los intervalos de tiempo, turnos y eventos de formación solo se enlazan con horarios, empleados y programas de tu propio espacio.

### Próximamente

- **Regístrate, elige un plan y paga con tarjeta por tu cuenta**, con un correo de factura lista, un comprobante, un correo de bienvenida cuando tu espacio esté activo y recordatorios de renovación, en español o inglés.
- **Pagos con tarjeta con 3-D Secure a través de PayPal, y el medio de pago Wompi.**
- **Pagar las facturas que recibes**, desde la página de pago para compradores en Nucleus Web.
- **Un enlace de pago que quien paga puede volver a abrir** para continuar, y reembolsos del proveedor que se contabilizan solos y abonan su factura una sola vez.
- **Facturación electrónica para Colombia (DIAN)**, activada por espacio de trabajo.
- **Más modelos de IA:** Google Gemini y Mistral AI.
- **Cambiar tu plan en línea**, con una vista previa y crédito por el tiempo no usado.
- **Cupos mensuales de IA por plan, límites de uso y paquetes de créditos de IA prepagados.**
- **Conectar Claude, ChatGPT o Grok con Alliance Business Suite por MCP.**
- **Ejecuciones programadas de agentes.**
- **Agentes que actúan en tu nombre (intercambio de tokens).**
