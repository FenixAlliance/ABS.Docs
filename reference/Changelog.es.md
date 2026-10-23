# Registro de cambios

Aquí se registran los cambios importantes de Alliance Business Suite, en español, desde la versión 2.7.0.

El formato sigue [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/), y el proyecto usa [versionado semántico](https://semver.org/lang/es/).

> Las versiones anteriores a la 2.7.0 están en el [registro de cambios en inglés](Changelog.md).

## [2.7.1] - 2026-10-22

### Novedades

- **Un presupuesto mensual de IA en cada plan.** Cada plan incluye ahora un presupuesto mensual para la IA que paga Alliance Business Suite: Gratis USD 1, Starter USD 8, Growth USD 25, Professional USD 40 y Business USD 80. Es un solo cupo compartido por todo el espacio de trabajo, y quien no tenga un límite personal puede usar todo el cupo. Los planes anuales reciben la misma cifra mensual cada mes. La IA todavía no se detiene al llegar al presupuesto (ver Próximamente).
- **Tus propios límites de IA, en la página de uso.** Cada persona ve cuánto le queda de IA en la sesión, la semana y el mes, y cuánto queda del cupo del espacio.
- **Planes de demostración e internos.** Fenix Alliance puede darle a un espacio un plan Demo o un plan Interno sin una venta, y retirarlo. Un espacio con uno de esos planes no puede comprar paquetes de créditos de IA.
- **Acceso a módulos por un tiempo definido.** Cuando Fenix Alliance le da a tu espacio acceso a un módulo, el acceso tiene un plazo: una Demo dura los días fijados (30 por defecto, hasta 90), y un acceso Interno dura hasta que se retira.
- **Cursos de una colección, desde Studio.** La lista de colecciones de cursos tiene una acción Cursos para ver, agregar y quitar los cursos de una colección.
- **Un límite diario para la lectura web de los agentes que puedes cambiar.** La lectura de páginas web ahora se cuenta por espacio y por día, y puedes fijar el límite diario dentro del tope de la plataforma. Si el conteo no se puede leer, la lectura se detiene en lugar de seguir sin control.
- **Límites diarios por capacidad de los agentes.** En Nucleus Web, quien administra el espacio puede fijar cuántas llamadas al día puede hacer una capacidad de un agente, donde la plataforma las cuenta.
- **Llaves de pago en nuestro almacén seguro de credenciales.** Las llaves de Mercado Pago, Stripe y PayU se pueden pasar al almacén de credenciales de la plataforma, y la copia anterior se borra solo cuando se comprueba que la guardada funciona.
- **Ejecuciones de agentes en segundo plano en Nucleus Web y Nucleus Desktop.** Un agente sigue trabajando después de que cierras la página o la ventana, hasta por 60 minutos, y puedes detenerlo o volver a conectarte más tarde, incluso después de reiniciar. Hasta 5 en curso a la vez por persona y 25 por espacio. En Nucleus Web, una notificación te dice si la ejecución terminó, se interrumpió o falló.
- **El inicio de Contabilidad de un vistazo.** El inicio de Contabilidad muestra el periodo fiscal actual y cuántos asientos esperan atención, con un enlace a cada uno.
- **Descargar CSV en el explorador de Analítica.** Después de ejecutar una consulta, puedes descargar como archivo CSV las mismas filas que muestra la gráfica.
- **Firma electrónica secuencial que avanza sola.** Cuando un firmante termina su paso, los siguientes firmantes se invitan automáticamente, y una solicitud cancelada o un firmante que ya terminó nunca recibe una invitación nueva.
- **Los módulos que otorga Fenix Alliance quedan marcados.** Tu lista de módulos marca con "Otorgado por Fenix Alliance" un módulo que Fenix Alliance otorgó y muestra cuándo termina el acceso, y Fenix Alliance ahora también puede ocultar un módulo concreto.
- **Aprobaciones en Pocket.** La app móvil Pocket tiene una bandeja de aprobaciones donde puedes abrir y decidir aprobaciones, como en Nucleus Desktop.
- **Llaves de comunicaciones, IA y búsqueda en nuestro almacén seguro de credenciales.** Un administrador del espacio puede guardar, rotar o quitar las llaves de los proveedores de comunicaciones, IA y búsqueda en el almacén de credenciales de la plataforma.
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
