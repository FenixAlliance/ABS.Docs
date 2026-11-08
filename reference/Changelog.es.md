# Registro de cambios

Aquí se registran los cambios importantes de Alliance Business Suite, en español, desde la versión 2.7.0.

El formato sigue [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/), y el proyecto usa [versionado semántico](https://semver.org/lang/es/).

> Las versiones anteriores a la 2.7.0 están en el [registro de cambios en inglés](Changelog.md).

## [2.8.1] - DATE-WHEN-LIVE

### Añadido

- PENDING-ACHOSTED (AI m1794086322975, regla de texto aceptada por el TL; conservar solo si los computadores de agente alojados (e1) están en el rango con push y activados; si la web abierta alojada se activa en la 2.8.1 (CEO q12 b), cambiar la segunda frase por "El dueño puede elegir la web abierta al crear un computador alojado."): **Computadores de agente alojados.** Los computadores de agente alojados pueden usar ABS y los archivos de su espacio de trabajo. Navegar por otros sitios web aún no está disponible en los computadores alojados. Los computadores que ejecutas tú mismo conservan sus sitios permitidos como antes.
- **Los computadores de agente vienen incluidos en los planes de pago.** Los computadores de agente ahora forman parte de los planes de pago de la plataforma, con una reserva que comparte cada espacio de trabajo: Starter incluye 10 horas RCU al mes, 5 GiB-mes de Cloud Workspace Storage y 1 computador a la vez; Growth, 40 horas RCU, 10 GiB-mes y 3 computadores; Professional, 75, 20 GiB-mes y 10; Business, 150, 40 GiB-mes y 50 (1 RCU = 1 vCPU + 2 GiB de memoria, así que un computador de 2 vCPU / 4 GiB usa 2 horas RCU por hora). Un GiB-mes es almacenamiento en el tiempo: 10 GiB guardados durante la mitad de un mes de 30 días son 5 GiB-mes. El estado guardado de un computador de agente en pausa cuenta en él y se conserva mientras exista el dispositivo, según los términos de tu suscripción y de almacenamiento. Cuando se agota el almacenamiento, el nuevo trabajo guardado se rechaza antes de empezar; los computadores que ya existen siguen pausándose de forma segura. En los planes anuales, los doce meses de cómputo están disponibles durante todo el año, y la asignación de almacenamiento es la misma cada mes. El plan Free no incluye computadores de agente. Desde la 2.8.1, una suscripción registra el uso incluido de su plan cuando se activa o cambia de plan, y lo conserva hasta que cambie de plan, aunque los planes cambien después. Una suscripción existente lo registra en su siguiente renovación y, hasta entonces, usa el plan actual.
- PENDING-FORGET (Security m1794163783695: Firefox 153 puede guardar los inicios de sesión en ~/.config/mozilla/firefox, que olvidar no borra; conservar "e inicios de sesión" solo cuando se vea funcionar en la ruta real sobre el digest en aceptación; si no, quitarlo o que el CEO lo acepte con sus propias palabras): **Gestiona los computadores de agente alojados.** En un computador alojado, el dueño de un agente puede restablecerlo para que olvide sus archivos e inicios de sesión guardados, o activar "Olvidar las sesiones iniciadas al detenerse", y los administradores eligen su región y su tamaño, en Studio y Nucleus Web.
- **Elige cómo vuelven los computadores de agente alojados después de una pausa.** Los dueños y administradores del espacio de trabajo ahora pueden elegir, en los ajustes de los computadores de agente, cómo vuelven los computadores alojados de sus agentes después de una pausa: "Reanudar aplicaciones y archivos" o "Reiniciar aplicaciones, conservar archivos", cada uno permitido, obligatorio o no permitido, además de un valor por defecto para los computadores nuevos. El computador de cada agente muestra qué comportamiento aplica y por qué, y cuánto almacenamiento conserva; un ajuste fijado por la política del espacio de trabajo o por un disco de datos se muestra de solo lectura con el motivo. Un cambio aplica en la siguiente pausa del computador. Si el espacio de trabajo ya no permite las aplicaciones abiertas guardadas de un computador, no las reanudará; puedes reiniciar sus aplicaciones y conservar sus archivos, o restablecerlo.

### Cambiado (léelo, por favor)

- **Para operadores con instalación propia: los complementos admitidos ahora se componen.** Un ensamblado de complemento que admite tu lista de permitidos DynamicModules ahora registra sus servicios y páginas al iniciar, una sola vez. Antes de la 2.8.1 sus constructores se ejecutaban, pero sus módulos nunca se componían. Con la lista de permitidos vacía (el valor por defecto), no se carga nada, como antes. Si el constructor o la composición de un módulo de complemento falla, la comprobación de estado de la composición de módulos lo marca como Degraded, solo con los nombres del tipo y de la excepción, y el inicio termina.
- **Asigna tres cuentas más antes de la contabilización automática.** Antes de que la contabilización automática funcione en un espacio de trabajo, asigna también las cuentas de pérdida por contracargos, obligación con el vendedor y costo del vendedor del marketplace. Mientras no estén asignadas, el reconocimiento de ingresos por suscripciones se pausa en ese espacio de trabajo, y se reanuda sin perder nada cuando lo estén.

### Seguridad

- **Nucleus Pocket mantiene privadas las pantallas de aprobación y de agentes.** En Android, las pantallas de aprobación y de agentes se ocultan en el selector de aplicaciones y no se pueden capturar en capturas de pantalla ni grabaciones de pantalla. En iOS se ocultan en el selector de aplicaciones, pero iOS no permite que una aplicación bloquee las capturas ni la grabación de pantalla. En Android, los datos de Pocket quedan fuera de la copia de seguridad en la nube y de la transferencia entre dispositivos.

## [2.8.0] - 2026-11-06

Esta es la versión semántica 2.8.0. No es la antigua *Product release 2.8.0* del registro en inglés.

### Añadido

- **Conecta Claude o ChatGPT con Alliance Business Suite.** Un asistente de IA ahora puede conectarse a tu cuenta por el Model Context Protocol (MCP) en `https://absuite.net/mcp`. Inicias sesión tú mismo y apruebas la conexión; el asistente nunca ve tu contraseña. El asistente actúa dentro de tus propios permisos y del acceso que aprobaste, en el espacio de trabajo que nombra cada solicitud, y solo dentro de lo que ese espacio de trabajo permite a la IA. La conexión se enciende poco después de que esta versión esté en línea, y lo anunciaremos. Consulta [Conecta un asistente de IA por MCP](../Online-Services/Agents/Connect-AI-Assistants-over-MCP.es.md).
- **Las acciones de IA se agrupan según lo que hacen.** Cada acción de IA pertenece ahora a una clase de efecto, como leer o crear registros. Un espacio de trabajo nuevo empieza con la IA autorizada a leer y crear, y todas las demás clases de efecto apagadas. Un espacio de trabajo que ya existía antes de la 2.8.0 sigue funcionando como antes: la IA puede leer, crear y cambiar registros. Exportar y publicar están apagados en todos los espacios de trabajo. Los ajustes con los que un administrador del espacio de trabajo cambia estas clases llegan en la 2.8.1.
- **Elige qué herramientas MCP puede usar cada agente.** Un administrador del espacio de trabajo ahora concede a un agente las herramientas de una conexión MCP una por una. A un agente solo se le ofrecen las herramientas que se le concedieron.
- **Ejecuta agentes en tus propios equipos.** Los administradores del espacio de trabajo pueden ver los equipos registrados para ejecutar agentes, y aprobarlos, rechazarlos, renombrarlos, moverlos o revocarlos. Revocar un equipo termina sus sesiones y rechaza su siguiente solicitud. La clave de un equipo se guarda en el almacén de claves protegido del sistema operativo: en Windows, o en Secret Service en Linux.
- **Equipos de agente.** El equipo de un agente conserva sus archivos e inicios de sesión entre sesiones. En un equipo que ejecutas tú mismo, un agente puede navegar por la web abierta, con categorías bloqueadas y sin acceso a los hosts internos de tu plataforma.
- **Lo que se escribe como sensible queda oculto.** Cuando un agente escribe algo marcado como sensible, el texto se oculta en la transcripción y la transmisión de la ejecución.
- **La línea de comandos `absuite`.** La línea de comandos ahora se llama `absuite` y llega a todos los servicios: `absuite <servicio> <recurso> <verbo>`. Puede leer, crear, actualizar y borrar registros, con una prueba en seco y una confirmación escrita antes de borrar. Los scripts reciben una salida estable (`-o json`, `jsonc`, `table`, `tsv`, `yaml` o `none`, y `--query` con JMESPath), códigos de salida estables y `--no-input` para ejecuciones desatendidas. `--verbose` y `--debug` nunca muestran un secreto.
- **Costos de envío desde tus zonas de envío.** Un envío ahora se cotiza con la zona de envío que corresponde a su destino (código postal, luego país o región, luego una zona Everywhere y luego la zona Default), el método de la zona, la clase de envío del artículo y sus políticas de envío, en la moneda del pedido. Los administradores del espacio de trabajo pueden definir los métodos y regiones de una zona, los países de una región y los costos por clase de un método.
- **Informes guardados de Analytics.** Puedes guardar una vista del Analytics Explorer como informe del espacio de trabajo, y abrirlo, renombrarlo y borrarlo después.
- **Responde en un ticket de soporte.** Puedes responder en la conversación de un ticket de soporte con tu propio perfil. La acción Ver de las listas de Helpdesk ahora abre una página de detalles de solo lectura.
- **Notificaciones sociales.** Se te avisa cuando alguien comenta, responde, reacciona o te menciona en tu contenido, siempre que puedas leerlo.
- **Conecta Facebook, Instagram y LinkedIn.** Las cuentas sociales se conectan con el mismo flujo de inicio de sesión que las demás integraciones, y una cuenta conectada se puede agregar a una publicación en borrador.
- **Finalización de cursos.** Una inscripción se puede completar, y emitir un certificado de finalización la completa.
- **Tus propias licencias.** Un miembro con sesión iniciada puede listar las licencias que tiene en un espacio de trabajo.
- **Un interruptor de emergencia para los cobros.** Un administrador puede pausar de inmediato el cobro de pagos reales. La plataforma revisa el interruptor cada pocos segundos y, si no puede leerlo, no cobra.
- **Facturación electrónica (DIAN).** Un documento electrónico firmado se envía a la autoridad tributaria por una sola cola. La plataforma consulta el estado del documento ante la autoridad antes de cada envío, reintenta un número limitado de veces y emite una alerta cuando deja de reintentar.
- **Edita documentos de Office en el navegador con Collabora.** Puedes abrir archivos de Word, Excel y PowerPoint guardados en tu espacio de trabajo y editarlos en el navegador con Collabora Online, ya sea con el editor de la plataforma o con un servidor de Collabora que conecte tu espacio de trabajo. Cada vez que guardas se conserva la versión anterior. La edición está disponible cuando se habilita un editor en tu entorno. Los editores de OnlyOffice y Microsoft llegan en la 2.9.
- **Japonés y chino.** Studio y los portales de clientes ya están disponibles en japonés y chino (simplificado), además de inglés, español, francés, alemán, italiano y portugués. Cualquier texto que aún no esté traducido se muestra en inglés en lugar de una clave interna. Los correos también se envían en japonés y chino.
- **Para operadores con instalación propia: una licencia queda vinculada a su instalación.** Cada instalación propia ahora tiene su propio ID de instalación. El instalador lo crea y lo muestra durante la configuración. Úsalo al comprar una licencia; puedes introducir la licencia en el último paso del instalador. Una licencia emitida para una instalación solo funciona en esa instalación, y las versiones anteriores la rechazan, así que actualiza a la 2.8.0 antes de aplicar una licencia nueva. Al restaurar o clonar una base de datos, su ID de instalación va con ella, y la copia cuenta como la misma instalación. La vinculación impide copiar una licencia entre instalaciones; no sustituye los términos de la licencia. Si usas el servicio alojado, no cambia nada.
- **Usa tu propia aplicación OAuth para una integración o un servidor MCP.** Los administradores del espacio de trabajo pueden usar su propia aplicación OAuth para un proveedor de integración o un servidor MCP, así que la pantalla de inicio de sesión y los límites son los de tu espacio de trabajo. El secreto del cliente se guarda cifrado y no se vuelve a mostrar. Cambiar o quitar la aplicación pide a todos los que están conectados a ese proveedor que se conecten de nuevo.
- **Reembolsa un pago desde su página de detalles.** La página de detalles de un pago ahora lista sus operaciones con el proveedor (cobros, reembolsos y anulaciones) con su estado y su importe. Una persona con el permiso de reembolso puede reembolsar ahí un cobro exitoso por completo, después de una confirmación que muestra el importe. Studio indica que un reembolso está hecho solo cuando el proveedor lo confirma; hasta entonces muestra que el reembolso se envió y espera al proveedor. Si un reembolso no se puede hacer (por ejemplo, ya hay uno en curso o el cobro se canceló), explica el motivo con palabras sencillas. Los reembolsos siempre son por el importe completo de un cobro; no hay reembolsos parciales. Un reembolso lo hace una persona en Studio, no una integración ni un agente. Está en Contabilidad > Facturación > Pagos, o en Billetera > Pagos; luego abre un pago.

### Cambiado (léelo, por favor)

- **Un reembolso o contracargo retira un curso.** Cuando el pago de un curso se reembolsa por completo o se contracarga, se revocan la inscripción y su certificado de finalización, y se registra el motivo.
- **Los ajustes de factura se escriben como porcentajes.** Las columnas y campos de ajuste dicen "Descuento %" y "Recargo %", y escribes 15 para 15 %. Un valor fuera de 0 % a 100 % se rechaza.
- **Un espacio de trabajo borrado se cierra de inmediato.** Cuando se borra un espacio de trabajo, se rechazan sus miembros, aplicaciones y agentes, se revocan los tokens de sus aplicaciones conectadas, se detienen sus suscripciones y se anulan sus facturas abiertas.
- **Cambiar el inicio de sesión de alguien cierra su sesión.** Cuando un administrador edita los datos de inicio de sesión de una persona, se cierra su sesión en todas partes y el cambio queda registrado.
- **Algunas listas ahora necesitan su permiso de lectura.** El contenido y las inscripciones de cursos, los artículos de conocimiento, las políticas de garantía, devolución y reembolso y las prioridades de tickets necesitan cada uno su propio permiso de lectura. Los miembros y lectores siguen leyéndolos. Crear, editar y borrar prioridades de tickets sigue necesitando los permisos de tickets. Para los roles personalizados, consulta Problemas conocidos.
- **Aprobaciones.** Nadie aprueba su propia exportación de agente, publicación de agente, pago, solicitud de factura u horas de proyecto, y un plazo que vence nunca aprueba nada.
- **Las acciones de los agentes siguen tus reglas de aprobación.** Las acciones de agentes que cambian, exportan o publican datos siguen las reglas de aprobación de tu espacio de trabajo, aplicadas en el servidor.
- **Un carrito rechaza monedas mezcladas.** Un carrito rechaza un artículo con precio en otra moneda, y el pago rechaza un artículo que ya no está disponible.
- **Para operadores con instalación propia: abre la compuerta antes de reenviar correo caducado.** Si reenvías un mensaje de correo de la cola de mensajes fallidos que caducó mientras su compuerta sigue cerrada, vuelve a la cola de mensajes fallidos. Abre primero la compuerta y luego reenvíalo.
- **Archivar una versión de un flujo de trabajo no detiene las ejecuciones en curso.** Las ejecuciones que empezaron con esa versión siguen adelante. Si deben detenerse, cancélalas.
- **Los vendedores del Marketplace no pagan comisión.** Los vendedores del Marketplace no pagan comisión a la plataforma en la 2.8.0: la tasa es del 0 %. La comisión ahora es una configuración de la plataforma con fecha, que controla el operador de la plataforma y nunca un espacio de trabajo; los operadores con instalación propia la configuran en los ajustes de ABP Commerce (`ABP:Commerce:MarketplaceCommissionRates`). Cualquier tasa por encima del 0 % se aplica solo a los pedidos hechos al menos 60 días después de avisar a los vendedores, y nunca cambia el precio de un pedido anterior. Los pagos a los vendedores aún no son automáticos; llegan en la 2.9.
- **Cada vendedor del Marketplace factura con su propia identidad ante la DIAN.** Para vender, un vendedor necesita su propia identidad de facturación electrónica ante la autoridad tributaria (DIAN). Una línea de pedido de un vendedor sin ella se rechaza al finalizar la compra, y otra vez si se emite una factura, y la plataforma nunca la factura con su propia identidad.
- **Los precios muestran el IVA antes de pagar.** Los precios de los planes, los complementos y los paquetes de créditos de IA ahora muestran el IVA del 19 % y el total que pagarás antes de confirmar, y ese total es exactamente lo que cobra la factura. El IVA aplica a los espacios de trabajo en Colombia y a los que no tienen un país confirmado; un espacio de trabajo cuyo país confirmado está fuera de Colombia se factura como exportación, sin IVA.
- **Los registros de facturación electrónica se conservan.** Un espacio de trabajo que tiene facturas emitidas, números de factura usados, documentos enviados a la autoridad tributaria (DIAN), asientos contables registrados o pagos no se puede eliminar de forma permanente mientras deban conservarse: al administrador de la plataforma que lo intente se le indica el motivo, y no se elimina nada. Los documentos intercambiados con la DIAN, incluidas la factura firmada y la respuesta de la DIAN, también se conservan por al menos 10 años contados desde el 1 de enero del año siguiente al de su almacenamiento. La eliminación de los datos de una persona funciona como antes.
- **Los planes de pago ahora incluyen los módulos de negocio.** Todos los planes de pago (Starter y superiores) incluyen los módulos horizontales, como Contabilidad, Marketing, Proyectos y Helpdesk, y los planes siguen diferenciándose por puestos, uso e IA. Si ya pagas un plan, sus módulos se activan de inmediato. Los espacios de trabajo gratuitos conservan los módulos que tienen hoy.

### Mejorado

- Borrar un método de envío, transportista, bodega o lista de empaque que otros registros aún usan se rechaza con un mensaje claro, en lugar de un error de base de datos.
- La búsqueda en base de datos ordena los resultados por relevancia (BM25).
- Las páginas de los portales se muestran con menos lecturas de base de datos, y una dirección de portal con o sin `www` llega al mismo portal.
- Studio: los campos de porcentaje muestran el porcentaje que escribiste, el selector de empresa y la cuadrícula de inicio de la cuenta funcionan como se espera, las cuadrículas se apilan en el teléfono en modo oscuro y una lista que no carga muestra una frase sencilla en lugar del texto del error. El carrito de la tienda muestra un mensaje en lugar de fallar cuando falla una llamada del carrito.
- Las actividades de un contacto de CRM borrado salen de la búsqueda.
- **Los flujos de trabajo conservan su configuración de ejecución después de una espera.** Un flujo de trabajo duradero que se reanuda después de una espera, una tarea de usuario o una aprobación ahora conserva su configuración de ejecución, así que los pasos posteriores a la espera se comportan como antes de ella. Un paso gobernado después de un paso de espera (Delay) ahora se ejecuta cuando el temporizador de la espera reanuda el flujo, y cada pasada registra su historial de pasos.

### Seguridad

- Los enlaces que envía la plataforma, como las invitaciones a firmar, siempre usan la dirección configurada de la plataforma, nunca una tomada de la solicitud entrante.
- Una solicitud MCP actúa solo en el espacio de trabajo que nombra y nunca pasa a otro, y las API REST y GraphQL rechazan un token MCP.
- Una aplicación administrada por la plataforma solo la puede cambiar o eliminar un administrador de la plataforma.
- Los registros que apuntan a otros registros (aprobaciones, evaluaciones, ausencias y nómina de RR. HH., listas de precios y ubicaciones de envío de facturas, participantes de sesiones de comunicaciones) solo aceptan registros de tu propio espacio de trabajo.
- Las listas de seguidores solo muestran perfiles que puedes ver.
- **Las listas de licencias ya no devuelven el archivo de licencia firmado.** En las versiones 2.7.0 a 2.7.4, la API de licencias devolvía el archivo de licencia firmado de cada licencia heredada, que incluye el nombre y el correo electrónico del titular de la licencia. Solo podían verlo los miembros del mismo espacio de trabajo con permiso para leer licencias, además de los agentes de IA y los clientes MCP de un espacio de trabajo que hubiera encendido la capacidad de IA que lista licencias (apagada por defecto). Nunca fue visible fuera del espacio de trabajo, ninguna pantalla de Studio lo mostraba y el archivo no sirve para activar nada. No hace falta hacer nada.
- **El seguimiento de entregas ya no guarda direcciones de correo en claro.** Las direcciones de correo que se guardan para el seguimiento de entregas y las exclusiones ahora se almacenan como resúmenes con clave, con una clave que solo tiene el operador, en lugar de un hash simple. Un registro de entregas por sí solo ya no se puede relacionar con una dirección. No cambia nada en cómo se envía o se recibe el correo. Los operadores con instalación propia lo activan configurando `ABSUITE_ADDRESS_DIGEST_HMAC1` con 32 bytes aleatorios en base64 (una referencia de Key Vault en Azure) y ejecutando después el relleno único con `ABSUITE_ADDRESS_DIGEST_BACKFILL_ENABLED=true`. Mientras no haya una clave, la plataforma sigue usando el resumen anterior, así que nada se rompe.
- El texto de las alertas en los correos del sistema siempre se codifica en HTML, así que el marcado de una alerta se muestra como texto.
- **Las páginas y plantillas del portal nunca ven los secretos del portal.** Las páginas, los diseños y las plantillas personalizadas del portal ahora reciben una copia solo pública del portal y su configuración. Las claves de la aplicación del portal, los tokens de acceso y los secretos de integración nunca están disponibles para una página o plantilla. Una dirección de sitio que ningún portal reclama ahora muestra la estructura básica del sitio en lugar de un error, y las páginas de recuperación de cuenta y de cierre de sesión funcionan en cualquier dirección. Si una plantilla personalizada leía una clave o un token del portal desde la configuración, ahora recibe un valor vacío; mueve esa lógica al servidor.
- **Para operadores con instalación propia: solo el espacio de trabajo raíz escribe plantillas de código.** Las plantillas de código (Razor y C#) ahora solo las pueden escribir y compilar los propietarios y administradores humanos del espacio de trabajo raíz. Cada guardado y cada primera compilación quedan auditados. Una entrada de `CodeAuthoringTenantIds` para cualquier otro espacio de trabajo se ignora, con una advertencia al iniciar. Las plantillas de código ya guardadas en otros espacios de trabajo dejan de compilarse; se muestran como contenido estático y saneado.

### Problemas conocidos

- PENDING-OPENWEB (CEO q12 b, 2026-11-08: quitar esta línea si la web abierta alojada se activa en la 2.8.1): **La web abierta en los computadores de agente alojados** aún no está disponible. Funciona en los computadores que ejecutas tú mismo.
- **La conexión de asistentes de IA no está encendida al lanzamiento.** Las conexiones MCP se abren poco después de que la 2.8.0 esté en línea. Hasta entonces, `https://absuite.net/mcp` no responde.
- **El autorregistro de otros clientes MCP está apagado al lanzamiento.** Otros clientes MCP (Cursor, VS Code y otros) podrán registrarse solos cuando se encienda el registro dinámico; lo anunciaremos.
- **Roles personalizados y las listas de Soporte.** Un rol personalizado que leía artículos de conocimiento, políticas de garantía, devolución o reembolso o prioridades de tickets antes de la 2.8.0 puede ver "no autorizado" en esas listas y en sus páginas de detalles de Helpdesk hasta que restauremos su acceso. Para arreglarlo ya, un administrador del espacio de trabajo le concede al rol el permiso de lectura correspondiente: KnowledgeArticles.Read, WarrantyPolicies.Read, ReturnPolicies.Read, RefundPolicies.Read o SupportTicketPriorities.Read.
- **Grok** todavía no puede conectarse.
- **Conectar servidores MCP externos a tus agentes** desde Studio todavía no está abierto. Las concesiones de herramientas funcionan con las conexiones que ya existen.
- **Las renovaciones con tarjeta guardada** todavía necesitan que el comprador pague. El cobro automático de una tarjeta guardada está preparado, pero ningún proveedor de pagos lo admite todavía.

## [2.7.4] - DATE-WHEN-LIVE

### Añadido

- **Consulta las operaciones de un pago con el proveedor.** El personal que puede ver pagos ahora ve las operaciones de cada pago con el proveedor (cobro, reembolso y cancelación), con su estado, montos, referencia del proveedor y horas. No se muestran identificadores internos ni datos sin procesar del proveedor.

### Seguridad

- **Las claves de los proveedores de pago se guardan cifradas.** Desde esta versión, las claves que guardas en Studio para cualquier proveedor de pago siempre se guardan cifradas. Esto incluye Mercado Pago, Wompi, Stripe, PayPal, PayU, ePayco, Amazon Pay, Amazon, American Express, Mercado Libre, Airwallex, Authorize.Net, Braintree, Mastercard, Visa, OpenPay, Nequi y Skrill. Si el cifrado no está disponible, el guardado se rechaza y Studio muestra un error. Las claves guardadas antes de esta versión se quedan como se guardaron; al guardarlas de nuevo se aplica la nueva regla.
- **Un solo juego de claves por proveedor de pago.** Desde esta versión, cada proveedor de pago conserva exactamente un juego de claves guardado por espacio de trabajo. Si un espacio de trabajo tiene dos, los pagos con ese proveedor se pausan y no se cobra nada, y la página de configuración del proveedor en Studio pide a un administrador que elimine el juego sobrante. Los pagos se reanudan en cuanto se elimina. La plataforma ya no elige uno de los dos al azar.

## [2.7.2] - DATE-WHEN-LIVE

### Añadido

- **Borra tu cuenta.** Ahora puedes borrar tu propia cuenta desde Yo > Configuración > Borrar tu cuenta. La confirmas, se cierra tu sesión de inmediato y tienes 14 días para cambiar de opinión con el enlace de cancelación que te enviamos por correo. Un administrador de la plataforma también puede borrar la cuenta de un usuario. Borrar una cuenta elimina o anonimiza los datos de la persona en toda la plataforma: perfil e inicio de sesión, contactos y solicitudes, publicaciones y mensajes sociales, listas de deseos, chats de IA, archivos, correos y boletines, asignaciones de tareas, puestos de licencia y datos de pago guardados. Las tareas abiertas pasan a un administrador del espacio de trabajo o quedan marcadas para reasignar, las aprobaciones que esperaban a la persona esperan un nuevo aprobador y un puesto del plan que tenía pasa a otro propietario activo. Se conserva lo que exige la ley: facturas y recibos emitidos, documentos electrónicos ya enviados a la autoridad tributaria y asientos contables registrados. Donde el contenido conservado sigue visible, como una entrada de blog, una reseña o un mensaje, el autor aparece como "Usuario eliminado".
- **Una insignia "Gratis" para los cursos gratuitos.** Los cursos con precio 0 muestran la insignia Gratis en Studio, y Studio te pide confirmar antes de guardar un curso como gratuito.

### Cambiado (léelo, por favor)

- **Los espacios de trabajo de los que saliste dejan tu lista.** Los espacios de trabajo de los que te retiraron ya no aparecen en tu lista ni en el selector, y los selectores ya no muestran la columna "Habilitado".
- **Borrar una aplicación conserva su historial.** Borrar una aplicación que ha actuado como miembro de tu espacio de trabajo ahora la deshabilita y conserva su historial, en lugar de eliminarla.
- **Archivos abiertos por su enlace.** Dentro de un espacio de trabajo, un archivo abierto por su enlace solo se muestra cuando es un tipo de archivo que se puede compartir así y tienes permiso para leer ese tipo de registro. Los demás archivos se abren desde el registro al que pertenecen.
- Las suscripciones no se renuevan ni se cobran mientras la cuenta de quien paga esté suspendida o pendiente de borrado.
- Algunos endpoints de la API sin terminar (detalle de márgenes, píxeles de seguimiento y un webhook de hosting) ahora responden "no implementado" en lugar de un éxito vacío.

### Mejorado

- Las páginas públicas de portales y tiendas cargan más rápido: saber en qué sitio está un visitante requiere muchas menos lecturas de la base de datos, y la ubicación del visitante se recuerda unos minutos y no se consulta para los rastreadores.
- Las páginas de Talento humano en Studio (empleados, evaluaciones, ausencias, nómina y más) usan el mismo diseño de página y barra de título que el resto de Studio.
- Quitar una pieza de un conjunto de banners conserva sus vistas y clics en el rendimiento total del conjunto.
- La documentación de la API indica el límite de tamaño de página, como máximo 120 filas por página, para que los SDK generados lo comprueben antes de llamar.

### Corregido

- El feed de productos de Google Merchant envía enlaces de producto correctos, usa los valores de existencias de Google y omite los productos sin imagen, así Google deja de rechazar artículos.
- Editar un pedido en Studio ya no rompe su vínculo con el carrito original.
- En facturas en otra moneda, el saldo pendiente en dólares estadounidenses es correcto después de aplicar los pagos.
- El catálogo público de cursos ya no muestra cursos de espacios de trabajo cerrados.
- La primera vez que una aplicación instalada ejecuta un flujo de trabajo en tu espacio de trabajo, termina en lugar de fallar.
- Si un asistente de IA no puede cargar los mensajes anteriores de una conversación, lo dice y te pide intentarlo de nuevo, en lugar de responder sin contexto. Esa ejecución no cuenta como uso.
- Los intervalos de tiempo, turnos y eventos de formación ya no pueden ser su propio padre ni formar un ciclo.
- Una compra que no se puede pagar en línea se rechaza antes de crear nada.

### Seguridad

- Iniciar sesión en una cuenta cerrada, suspendida o pendiente de borrado da la misma respuesta que una contraseña incorrecta, y el navegador nunca guarda en caché las páginas de borrado.
- El inicio de sesión, el registro y la recuperación de contraseña rechazan una respuesta CAPTCHA tomada de otra página u otro sitio.
- Una persona que fue retirada de un espacio de trabajo y vuelve a unirse regresa como miembro regular, sin sus permisos anteriores.
- Deshabilitar una aplicación detiene de inmediato sus ejecuciones programadas y sus agentes.
- Los registros solo pueden hacer referencia a datos de tu propio espacio de trabajo: registros contables (comisiones, diarios, centros de costo, grupos de cuentas, cuentas bancarias), impuestos de líneas de factura (tus políticas de impuestos o las estándar de la plataforma), categorías de artículos, imágenes y adjuntos de artículos, contactos, páginas web, entradas de blog, menús, plantillas de certificados de cursos, adjuntos de publicaciones sociales, e industrias y territorios. Los registros padre ya no pueden formar un ciclo.
- Cuando se registra un pago, la plataforma completa las billeteras que pagan y reciben y los datos de ubicación; nunca se toman de la solicitud.
- Editar una factura ya no puede redirigirla a la billetera de otro pagador, y una cuenta bancaria solo puede vincularse a una billetera por el propietario de esa billetera.
- El comprador y la tasa de cambio de un pedido ya no pueden cambiarse al editar el pedido, y el receptor de un pedido solo puede cambiarlo el emisor mientras el pedido es nuevo y aún no está facturado.
- Los vendedores solo pueden iniciar una suscripción en un plan publicado y todavía disponible.
- Los detalles de un pago ya no muestran una puntuación de fraude, que la plataforma nunca calculaba.
- Canjear una licencia requiere el permiso de gestión de licencias, y ya no se aceptan licencias firmadas con una antigua clave de desarrollo.
- La dirección de un servidor de herramientas de IA personalizado no puede contener una cadena de consulta, así las claves no pueden esconderse en ella, y los demás administradores ven la dirección sin ella.
- La página pública de firma de documentos solo muestra mensajes claros y esperados cuando algo sale mal.
- Los nuevos planes de cuentas se crean a partir de un archivo de catálogo fijo y verificado.
- Las descargas CSV del Explorador de Analytics neutralizan las fórmulas de hoja de cálculo incluso detrás de espacios iniciales.
- Refuerzos menores: la configuración de los proveedores de pago no puede apuntar al almacenamiento protegido de credenciales de la plataforma, las imágenes de publicaciones sociales llevan una cabecera de seguridad adicional para el navegador y, después de subir la imagen principal de un artículo, solo se te devuelve a una página de este sitio.

### Próximamente

- **Pagar con tarjeta un plan o un paquete de crédito de IA en la aplicación.** El pago con tarjeta se abre en una actualización posterior.
- **Tus propios servidores de herramientas de IA (MCP)**, conectados por su dirección web, para los administradores del espacio de trabajo.
- **Pausar una programación de agente y ver su historial de ejecuciones**, y agentes programados que mantienen una sola conversación entre ejecuciones.
- **Aprobaciones para agentes que actúan en tus cuentas personales conectadas**, vistas y decididas solo por ti.
- **Comprobaciones de la DIAN antes de firmar una factura electrónica**: primero se comprueban los datos que faltan de las partes y los rangos de numeración.

## [2.7.1] - 2026-10-22

### Novedades

- **Un presupuesto mensual de IA en cada plan.** Cada plan incluye ahora un presupuesto mensual para la IA que paga Alliance Business Suite: Gratis USD 1, Starter USD 8, Growth USD 25, Professional USD 40 y Business USD 80. Es un solo cupo compartido por todo el espacio de trabajo, y quien no tenga un límite personal puede usar todo el cupo. Los planes anuales reciben la misma cifra mensual cada mes. La IA todavía no se detiene al llegar al presupuesto (ver Próximamente).
- **Tus propios límites de IA, en la página de uso.** Cada persona ve cuánto le queda de IA en la sesión, la semana y el mes, y cuánto queda del cupo del espacio.
- **Planes de demostración e internos.** Fenix Alliance puede darle a un espacio un plan Demo o un plan Interno sin una venta, y retirarlo. Un espacio con uno de esos planes no puede comprar paquetes de créditos de IA.
- **Acceso a módulos por un tiempo definido.** Cuando Fenix Alliance le da a tu espacio acceso a un módulo, el acceso tiene un plazo: una Demo dura los días fijados (30 por defecto, hasta 90), y un acceso Interno dura hasta que se retira.
- **Cursos de una colección, desde Studio.** La lista de colecciones de cursos tiene una acción Cursos para ver, agregar y quitar los cursos de una colección.
- **Un límite diario para la lectura web de los agentes que puedes cambiar.** La lectura de páginas web ahora se cuenta por espacio y por día, y puedes fijar el límite diario dentro del tope de la plataforma. Si el conteo no se puede leer, la lectura se detiene en lugar de seguir sin control.
- **Límites diarios por capacidad de los agentes.** En Nucleus Web, quien administra el espacio puede fijar cuántas llamadas al día puede hacer una capacidad de un agente, donde la plataforma las cuenta.
- **El inicio de Contabilidad de un vistazo.** El inicio de Contabilidad muestra el periodo fiscal actual y cuántos asientos esperan atención, con un enlace a cada uno.
- **Descargar CSV en el explorador de Analítica.** Después de ejecutar una consulta, puedes descargar como archivo CSV las mismas filas que muestra la gráfica.
- **Firma electrónica secuencial que avanza sola.** Cuando un firmante termina su paso, los siguientes firmantes se invitan automáticamente, y una solicitud cancelada o un firmante que ya terminó nunca recibe una invitación nueva.
- **Los módulos que otorga Fenix Alliance quedan marcados.** Tu lista de módulos marca con "Otorgado por Fenix Alliance" un módulo que Fenix Alliance otorgó y muestra cuándo termina el acceso, y Fenix Alliance ahora también puede ocultar un módulo concreto.
- **Aprobaciones en Pocket.** La app móvil Pocket tiene una bandeja de aprobaciones donde puedes abrir y decidir aprobaciones, como en Nucleus Desktop.
- **Paginación, filtros y orden en la referencia de la API.** La documentación de la API ahora describe las opciones de paginación, filtro y orden de cada lista, para que los SDK generados las puedan usar.

### Cambios (léelos)

- **Los disparadores webhook de los flujos de trabajo necesitan firma.** Un disparador webhook sin firma ya no se ejecuta. Si tu espacio usa disparadores webhook, configura la firma en cada uno para que sigan funcionando.
- **Conectar Mercado Libre queda en pausa en Studio.** No puedes conectar una cuenta de Mercado Libre hasta que su nuevo flujo de conexión esté listo (ver Próximamente). Tu configuración guardada se conserva.
- En los portales, la creación de cursos en la Academia y los tableros de candidatos y empleadores de Talento quedan cerrados hasta que se reconstruyan detrás del inicio de sesión, y también las páginas de validación de licencias.
- El carrusel de cursos sale de la página de inicio de Boomlabs Academy y de las páginas de ClassPass y SRA hasta que muestre solo los cursos de esa academia.
- La edición de documentos en el navegador y las direcciones antiguas del bot de soporte ya no se sirven en ningún portal.

### Mejoras

- Un cambio de plan que confirmas justo al final de su cotización ahora te pide ver el precio de nuevo, en lugar de mostrar un error.
- Una factura de renovación anulada ahora dice por qué: la reemplazó tu nuevo plan, se canceló al final del periodo o la suscripción terminó.
- Nucleus Web abre más rápido: la aplicación descarga cerca de un 21% menos de JavaScript y la mitad de los estilos que bloquean la carga, y el tablero aparece en cuanto se conoce tu espacio.
- El panel de uso de IA en Nucleus Web muestra las cifras en dólares de cada periodo, y el periodo de un plan anual dice "Este año del plan".
- La página pública de precios muestra solo lo que puedes comprar hoy; la facturación anual, el modelo Gratis y los complementos aparecen como próximos.
- Las cotizaciones, los pedidos y las facturas guardan qué precio, lista de precios y descuento valoró cada línea, de la cotización al pedido y a la factura.
- Nucleus Desktop muestra tus propios límites de IA, y una ejecución de agente fallida se explica con nuestras propias palabras.
- Un pago hecho sobre una factura conserva la tasa de cambio de la factura, así que el asiento contable del pago la registra.
- Una acción que ya espera una aprobación no puede abrir una segunda solicitud de aprobación para lo mismo.
- El motivo de rechazo de un firmante tiene como máximo 1.000 caracteres.

### Correcciones

- Una factura de renovación emitida justo cuando una suscripción terminaba, por un reembolso o un cambio de plan, ahora se anula automáticamente.
- Contabilidad: un asiento nunca escoge un periodo fiscal cuando podría aplicar más de uno, y un periodo fiscal solo se escribe dentro de tu propio año fiscal.
- Las páginas de periodos fiscales funcionan para un espacio cuya autoridad tributaria se define por su código, como DIAN.
- Guardar la configuración de Wompi conserva la tolerancia del webhook en lugar de reiniciarla.
- Dos abonos, dos pagos, o un pago y una anulación, que llegan a una factura al mismo tiempo ahora dan un solo resultado, así que los abonos nunca superan la factura y una factura nunca puede quedar pagada y anulada a la vez.
- Los agentes vuelven a ver el historial de su conversación, y sus herramientas para recordar conversaciones anteriores vuelven a funcionar.
- Las facturas, los pedidos, las cotizaciones y las oportunidades muestran todas sus líneas, incluso más allá del límite de página, con un aviso cuando la lista es larga, y otras listas largas de Studio cargan en lugar de fallar.
- Las vistas de facturas y pagos muestran la tasa de cambio como "1 USD = N" en tu moneda, nunca como un monto ni como 0,00.
- Un cobro de ePayco registra su tasa de cambio solo en su propio pago y nunca cambia las tasas que ven los demás.
- Una persona aparece como bloqueada o deshabilitada solo mientras un bloqueo está realmente vigente.
- El primer disparador de flujo de trabajo de un espacio se guarda completo en un solo paso.
- Al eliminar una cuenta o un espacio también se borran sus datos de conversación, así que la eliminación ya no queda bloqueada.
- Un curso solo se puede agregar una vez a una colección, aunque dos personas lo agreguen al mismo tiempo.
- Los documentos electrónicos de Colombia llevan las responsabilidades fiscales de la parte en el campo correcto, y la fecha de la tasa de cambio del pago se conserva bien.
- El catálogo de Google Merchant pone los precios en la moneda pedida y nunca la etiqueta mal, y el catálogo de Facebook sigue el formato de catálogo de Meta.
- La página de opciones de IA siempre administra el espacio que se muestra en el encabezado.

### Seguridad

- La cookie del carrito de invitado va firmada, así que un carrito solo lo alcanza el visitante al que pertenece.
- El inicio de sesión, el cambio de espacio y el guardado de imágenes solo te devuelven a páginas de este sitio.
- Las páginas públicas de productos devuelven solo lo que debe ser público: reseñas, preguntas, imágenes y adjuntos de artículos visibles al público.
- Un archivo cuyo análisis de malware nunca llega queda retenido a los 60 minutos y no se entrega hasta que el análisis lo libere.
- La evidencia del proveedor de pagos y las verificaciones de identidad de quien paga ya no aparecen en las lecturas generales de pagos.
- El pago de un agente necesita una aprobación, salvo que una persona esté comprando directamente.
- La puntuación de fraude de un pago la fija solo la plataforma, nunca la aplicación que crea o actualiza el pago.
- Los cambios que nuestro equipo hace en tu espacio desde la consola de administración de la plataforma requieren un administrador que actúe como sí mismo, nunca un agente ni una automatización, y cada cambio queda registrado.
- Una cuenta suspendida o deshabilitada no puede ejecutar nada en segundo plano.
- Las actualizaciones en vivo verifican que sigues perteneciendo a lo que estás viendo, y se detienen para quien ya no pertenece.
- Nuestros scripts de despliegue y administración toman sus secretos del entorno y verifican el certificado de cada servidor al que se conectan.
- El conector para editar documentos de Office en el navegador queda apagado mientras rehacemos cómo protege el acceso.
- Un documento enviado a firma electrónica solo puede tomar un archivo normal del espacio o sus propios archivos firmados, nunca un archivo de una conversación privada.
- Las líneas de factura, los precios y las partes de facturas y documentos fiscales siempre vienen de tu propio espacio o de artículos publicados.
- Al leer productos, imágenes y adjuntos publicados de otro espacio solo ves sus datos públicos, y las páginas públicas de precios ignoran las listas de precios privadas.
- La API GraphQL rechaza consultas muy profundas o muy costosas y las solicitudes en lote, y su explorador de esquema solo está disponible en desarrollo.
- Un carrito tiene como máximo 50 líneas, y leer un carrito de invitado ya no consulta la ubicación del visitante.
- Las verificaciones de propiedad nunca toman un propietario ausente como coincidencia, en registros como contactos, cotizaciones, billeteras y facturas.
- Una página antigua del bot de soporte se retira y se quita la llave que llevaba.
- Las entradas de blog en borrador ya no se pueden leer desde el portal público.
- Los catálogos para Google y Facebook comparten solo los productos publicados del propio espacio.
- Más páginas públicas piden iniciar sesión donde corresponde.
- Los disparadores webhook de los flujos de trabajo solo aceptan solicitudes firmadas y con fecha y hora, y una solicitud repetida se ejecuta una sola vez.
- Solo el propietario y el gerente financiero pueden cambiar la configuración de los proveedores de pago y los destinos de los pagos salientes; un cajero ya no puede.
- Iniciar sesión con una cuenta externa usa solo un correo que ese proveedor haya verificado, vincula el inicio de sesión solo después de que confirmes tu buzón y nunca se salta tu verificación en dos pasos.
- Las imágenes de las publicaciones se entregan solo a quienes pueden ver la publicación, y las imágenes nuevas se guardan de forma privada.
- Una página web en la papelera o programada para más adelante ya no es pública.
- Las listas de cursos, inscripciones y certificados se limitan a tu propio espacio, y la tabla de certificados necesita permiso de gestión de cursos.
- Los adjuntos de un ticket de soporte solo se pueden abrir desde el ticket, con permiso sobre tickets.
- Las listas de comparación y de vistos recientemente muestran un producto solo mientras sea público o tuyo.
- Las reglas y políticas de impuestos de otro espacio nunca se aplican a tus artículos ni a tus precios.
- Los visitantes y quienes no son miembros solo ven los datos públicos de los portales y de sus propietarios.
- Configurar un plan de cuentas solo descarga de nuestro catálogo verificado, y la opción Vacío no descarga nada.
- Las consultas de listas de la API demasiado costosas se rechazan con un mensaje claro en lugar de llegar a la base de datos.
- Más tipos de credenciales de conectores, como contraseñas de certificados y llaves técnicas, se ocultan como cualquier otro secreto.
- El pago con PayU limita las solicitudes repetidas desde una misma dirección.
- Una membresía deshabilitada ya no muestra su correo ni recibe actualizaciones en vivo en el selector de espacios, y un aprobador reasignado deja de recibir las actualizaciones en vivo de esa aprobación.
- Las imágenes del editor de contenido solo las guarda en caché tu propio navegador, por unos minutos.
- Los antiguos endpoints de entrenamiento de modelos de IA ya no son accesibles.
- Se retira el flujo antiguo de conexión con Mercado Libre, y tu configuración guardada se conserva.

### Próximamente

- **Límites de uso de IA.** La IA se detiene al llegar al presupuesto mensual de tu plan, con aumentos que tú apruebas.
- **Paquetes de créditos de IA prepagados**, para planes con presupuesto mensual de IA.
- **Varias cuentas por integración**, incluidas las personales, con un selector de cuenta y una predeterminada.
- **Conectar cuentas de Google y Microsoft** a tus integraciones. Al desconectar una cuenta de Google también se retira su acceso en Google.
- **Agentes que usan tus cuentas conectadas de forma segura**, solo con tu consentimiento para cada agente y cuenta, con aprobaciones para lo importante, revocable en cualquier momento y siempre registrado.
- **Conversaciones en equipo** con agentes.
- **Facturación electrónica DIAN para tu espacio**, incluidas las notas crédito y débito de Colombia con su propio código DIAN (CUDE), y el CUFE o el CUDE y el código QR en el PDF de la factura. Está apagada por defecto y el envío a DIAN todavía no está conectado; mientras no esté activa, tus facturas conservan su PDF normal.
- **Volver a conectar Mercado Libre**, con el mismo inicio de sesión seguro que Google y Microsoft.
- **Nuestro almacén seguro de credenciales para tus llaves.** Los administradores del espacio podrán guardar en el almacén de credenciales de la plataforma las llaves de los proveedores de pago, comunicaciones, IA y búsqueda, y rotarlas o quitarlas allí.
- **Ejecuciones de agentes en segundo plano en Nucleus Web y Nucleus Desktop.** Un agente seguirá trabajando después de que cierres la página o la ventana, y podrás detenerlo o volver a él más tarde.

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
- **Búsqueda, configurada desde Studio.** Configura la búsqueda de tu espacio en Studio, mira su estado en palabras claras y elige qué automatización ejecuta. **Aún no disponible:** llega cuando el servicio de búsqueda esté incluido en una versión.
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
