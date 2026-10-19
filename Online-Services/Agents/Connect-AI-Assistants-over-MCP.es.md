# Conecta Claude, ChatGPT o Grok por MCP

> **Próximamente.** La conexión de un asistente de IA con Alliance Business Suite por el Model Context Protocol (MCP) ya está construida y permanece apagada en la 2.7.0. Esta página explica cómo funciona para que puedas planearlo. Avisaremos cuando esté encendida.

## Cómo va a funcionar

Tu asistente de IA se conecta a un único endpoint de Alliance Business Suite, `/mcp` en tu dirección de Alliance Business Suite. El asistente nunca ve tu contraseña: tú inicias sesión en Alliance Business Suite y apruebas la conexión.

1. En Claude o ChatGPT, agrega un conector personalizado e ingresa la dirección MCP de Alliance Business Suite.
2. El asistente te lleva a la página de inicio de sesión de Alliance Business Suite. Inicia sesión con tu propia cuenta.
3. Una página de consentimiento muestra que la *aplicación* quiere acceder a tu cuenta de Alliance y el acceso que pide. Selecciona **Permitir** o **Denegar**.
4. Cuando lo permites, el asistente queda conectado. No se te vuelve a preguntar en los siguientes inicios de sesión.

El inicio de sesión usa OAuth con PKCE, así que solo el asistente que empezó el inicio de sesión puede terminarlo. Los tokens de acceso duran 60 minutos, y el asistente los renueva hasta por 14 días.

## Qué puede hacer el asistente

- Las primeras herramientas son de **solo lectura** y solo sobre ti: tu perfil, tus espacios de trabajo y membresías, a quién sigues, tu carrito y tu billetera.
- El asistente nunca recibe más de lo que tú tienes. Su acceso es el de tus propios permisos, reducido a lo que aprobaste, así que nunca puede hacer algo que tú no puedas.
- Un token emitido para MCP solo funciona en el endpoint MCP, no en las APIs REST ni GraphQL.
- Un asistente conectado por MCP nunca puede actuar en tu nombre mediante intercambio de tokens.

## Asistentes compatibles

| Asistente | Estado |
|---|---|
| Claude | Listo cuando se encienda MCP |
| ChatGPT | Listo cuando se encienda MCP |
| Grok | Más adelante |

## Relacionado

- [Capacidades y límites de los agentes](Agent-Capabilities.es.md)
- [Connect Claude, ChatGPT or Grok over MCP (English)](Connect-AI-Assistants-over-MCP.md)
