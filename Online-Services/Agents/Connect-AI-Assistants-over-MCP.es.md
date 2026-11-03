# Conecta Claude, ChatGPT o cualquier cliente MCP

> **Desde la 2.8.0.** La conexión de un asistente de IA por el Model Context Protocol (MCP) llega con la 2.8.0 y se enciende poco después de que la versión esté en línea. Avisaremos cuando esté encendida. Hasta entonces, la dirección de abajo no responde.

Un asistente de IA que habla MCP puede trabajar con tu cuenta de Alliance Business Suite: lee registros y, donde tu espacio de trabajo lo permite, los crea por ti. Tú mantienes el control. Inicias sesión tú mismo, apruebas la conexión y el asistente nunca ve tu contraseña.

## La dirección

Todos los asistentes se conectan a una sola dirección:

```
https://absuite.net/mcp
```

El asistente encuentra lo demás por su cuenta (la página de inicio de sesión, el endpoint de tokens y lo que puede pedir) en los documentos de descubrimiento estándar de `https://absuite.net/.well-known/oauth-protected-resource/mcp` y `https://absuite.net/.well-known/oauth-authorization-server`. Nunca los escribes.

## Conecta Claude

1. En Claude, abre **Configuración** > **Conectores** y agrega un conector personalizado.
2. Escribe `https://absuite.net/mcp` como URL del conector y guarda.
3. Claude abre la página de inicio de sesión de Alliance Business Suite. Inicia sesión con tu propia cuenta y elige el espacio de trabajo si se te pide.
4. Una página de consentimiento muestra "*Claude* quiere acceder a tu cuenta de Alliance" y el acceso que pide. Selecciona **Permitir** (Allow).
5. Claude queda conectado. No se te vuelve a preguntar cuando renueva su acceso.

## Conecta ChatGPT

1. En ChatGPT, agrega un conector personalizado (en **Configuración**, en **Conectores** o **Apps**, según tu plan).
2. Escribe `https://absuite.net/mcp` como URL del servidor MCP y elige el inicio de sesión OAuth.
3. Inicia sesión en Alliance Business Suite con tu propia cuenta, elige el espacio de trabajo si se te pide y selecciona **Permitir** (Allow) en la página de consentimiento.

Claude y ChatGPT están registrados con Alliance Business Suite, así que su página de consentimiento muestra sus nombres registrados.

## Conecta cualquier otro cliente MCP

Cuando esto se encienda (lo anunciaremos), cualquier cliente MCP que siga el estándar de autorización de MCP podrá conectarse, por ejemplo Cursor o VS Code. Dale la dirección `https://absuite.net/mcp`. El cliente se registra solo con Alliance Business Suite mediante el registro dinámico de clientes de OAuth (o un documento de metadatos del ID de cliente), y luego te envía a iniciar sesión y aprobarlo, igual que arriba.

Un cliente que se registró solo no está registrado por nosotros, así que su página de consentimiento lo marca como **No verificado**. La página también muestra la dirección web a la que te devolverá. Un cliente cuyo nombre imita una app conocida aparece solo como "App no verificada". Revisa esa dirección antes de seleccionar **Permitir**. Si no reconoces el cliente o la dirección, selecciona **Denegar**.

## Lo que puede hacer el asistente

- **Solo lo que tú puedes hacer.** El acceso del asistente son tus propios permisos, reducidos a lo que aprobaste. Nunca puede hacer algo que tú no puedas.
- **Un espacio de trabajo a la vez.** Cada solicitud nombra el espacio de trabajo en el que actúa. El asistente nunca pasa a otro espacio de trabajo.
- **Solo lo que el espacio de trabajo permite a la IA.** Cada espacio de trabajo decide qué tipos de acción de IA se permiten. Un espacio de trabajo nuevo permite leer y crear registros, y los demás tipos de acción están apagados hasta que un administrador del espacio de trabajo los enciende. Un espacio de trabajo que ya existía antes de la 2.8.0 sigue funcionando como antes: la IA puede leer, crear y cambiar registros hasta que un administrador del espacio de trabajo apaga los cambios. Exportar y publicar están apagados en todos los espacios de trabajo hasta que un administrador los enciende. Algunas acciones, como los pagos, también necesitan la aprobación de una persona.
- **Los tokens de MCP solo sirven en MCP.** Un token emitido a un asistente solo funciona en `https://absuite.net/mcp`, no en las API REST ni GraphQL, y un asistente nunca puede canjearlo para actuar como tú en otro lugar.

## Inicio de sesión y tokens

El inicio de sesión usa OAuth 2.1 con PKCE, así que solo el asistente que empezó un inicio de sesión puede terminarlo.

Los tokens de acceso duran 15 minutos. El asistente los renueva sin volver a preguntarte, siempre que los use al menos una vez cada 14 días. Claude y ChatGPT pueden seguir renovándolos hasta por 60 días, y un cliente que se registró solo hasta por 14 días. Después, inicias sesión de nuevo.

## Desconecta un asistente

Elimina el conector en el propio asistente. Eso detiene al asistente, pero nuestro lado de la concesión sigue vigente hasta que pasan 14 días sin uso, y entonces caduca. Si se borra un espacio de trabajo, el acceso de todos los asistentes a ese espacio termina de inmediato.

Para terminar nuestro lado de inmediato, abre el menú de tu cuenta (bajo tu nombre e imagen) > **Aplicaciones conectadas**. Cada conexión aparece por espacio de trabajo. Selecciona **Desconectar** junto al asistente y confirma. Pierde el acceso de inmediato.

## Asistentes compatibles

| Asistente | Estado en la 2.8.0 |
|---|---|
| Claude | Compatible, registrado con Alliance Business Suite |
| ChatGPT | Compatible, registrado con Alliance Business Suite |
| Otros clientes MCP (Cursor, VS Code y otros) | Apagado al lanzamiento; compatible mediante autorregistro cuando se encienda |
| Grok | Todavía no |

## Relacionado

- [Capacidades y límites de los agentes](Agent-Capabilities.es.md)
- [Registro de cambios 2.8.0](../../reference/Changelog.es.md)
- [Connect Claude, ChatGPT or any MCP client (English)](Connect-AI-Assistants-over-MCP.md)
