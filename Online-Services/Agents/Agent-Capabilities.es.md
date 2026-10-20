# Capacidades y límites de los agentes

Desde la versión 2.7.0 cada espacio de trabajo decide qué capacidades integradas pueden usar sus agentes, como buscar en la web o leer una página web. Cada capacidad está apagada hasta que alguien que administra el espacio la enciende.

## Dónde encontrarlo

- **Nucleus Web:** **Espacio de trabajo > Configuración > Políticas** muestra cada capacidad con su interruptor y sus límites (llega con la próxima actualización de Nucleus Web).
- **Studio:** **Tenants > tu espacio > Configuración > Opciones de IA** reúne las opciones de IA del espacio que se describen abajo.

Cualquier persona del espacio puede ver la lista. Cambiar una capacidad o sus límites requiere el permiso para administrar la configuración del espacio.

## Las capacidades

| Capacidad | Límite por ejecución (predeterminado) |
|---|---|
| Búsqueda web | 10 |
| Lectura de páginas web | 10, editable de 1 a 100 |
| Búsqueda en redes sociales | 10 |
| Entorno de código | 5 |
| Almacén de archivos del proveedor | 10 |
| Control del computador | 50 |
| Sesión de voz | 1 |
| Generación de imágenes | 5 |
| Conexiones MCP (herramientas externas) | 20 |

Todas están apagadas por defecto.

### "Aún no disponible"

Algunas capacidades llevan la etiqueta **Aún no disponible**. Significa que la plataforma todavía no tiene una herramienta ni una ruta de proveedor para ella, así que un agente no la puede usar aunque la enciendas. En las conexiones MCP la etiqueta aparece mientras las conexiones MCP estén apagadas en la plataforma. Igual puedes mover el interruptor, y tu elección queda lista para cuando llegue la capacidad.

## Límites

- **Por ejecución:** cuántas veces puede usar un agente la capacidad en una ejecución. Hoy solo la **lectura de páginas web** tiene un límite por ejecución editable, y se aplica: cuando una ejecución lo alcanza, el agente recibe el aviso de que llegó a su límite de lectura web. Los demás valores por ejecución se muestran como información y aún no se pueden cambiar.
- **Por día:** la búsqueda web (500), la lectura de páginas web (500) y la búsqueda en redes sociales (200) muestran un valor diario. Esos valores diarios todavía no se aplican, así que no se pueden cambiar.
- Solo una persona que actúa como sí misma puede cambiar un límite. Los agentes y las automatizaciones no pueden.

## Opciones de IA del espacio (Studio)

- **Control del computador:** encendido o apagado. Cuando está encendido, cada acción de un agente en un computador sigue necesitando la aprobación de una persona.
- **Grabación de voz:** apagada (predeterminado), o conservar audio y transcripciones. Aplica cuando las sesiones de voz estén disponibles.
- **Retención de datos por los proveedores de IA:** no permitida (predeterminado), solo proveedores sin retención de datos, o permitida.

Los cambios en estas opciones aplican en cuanto los guardas.

## Próximamente

- **Ejecuciones programadas de agentes:** programa a un agente para que trabaje solo, dentro de los límites que fijes. Ya está construido y permanece apagado hasta que esté listo.
- **Agentes que actúan en tu nombre (intercambio de tokens):** un agente que trabaja para una persona con el acceso delegado de esa persona. Ya está construido y permanece apagado hasta que esté listo.

## Relacionado

- [Conecta Claude, ChatGPT o Grok por MCP](Connect-AI-Assistants-over-MCP.es.md)
- [Agent capabilities and limits (English)](Agent-Capabilities.md)
