# Vender cursos

Vende un curso como cualquier otro artículo de tu catálogo, y deja que la compra inscriba al comprador por ti.

## Para quién es

Empresas que cobran por sus cursos.

## Disponibilidad

Necesitas el módulo de Aprendizaje para publicar cursos, y los permisos de facturación de tu espacio de trabajo para facturarlos y emitir notas crédito. La disponibilidad puede depender de tu plan.

## Cómo una venta inscribe al comprador

Un curso es un artículo de tu catálogo. Puede ir en una factura como un producto o un servicio.

1. El comprador compra el curso, o tú se lo facturas.
2. Cuando la factura queda pagada por completo, el comprador queda inscrito en cada curso de esa factura.
3. La inscripción empieza **activa**. El curso aparece en **Mis cursos** cuando el comprador inicia sesión con la cuenta vinculada a su contacto.

No necesitas inscribir al comprador tú mismo. Si el comprador aún no tiene perfil de estudiante en tu espacio, se le crea uno.

Cada curso de la factura crea una inscripción. Si el comprador ya tiene acceso al curso, por una inscripción activa o completada, no se crea una segunda.

## Cursos gratuitos

Para dar un curso sin costo, inscribe tú mismo al estudiante. Consulta [Estudiantes, instructores e inscripciones](Students-and-instructors.es.md).

Próximamente: un curso gratuito que inscribe al estudiante desde el proceso de pago, sin factura que pagar.

## Precios

Fija el **Precio** y la **Moneda** de un curso en Studio, en el formulario de creación o de edición del curso (consulta [Crear y publicar un curso](Courses.es.md)). También puedes fijarlos con el servicio Learning de la API REST (`/api/v2/LearningService/Courses`). El precio no puede ser negativo, y la moneda debe ser una de las que la plataforma conoce; si no, el curso no se guarda. Un curso sin precio es gratuito.

## Reembolsos

Un reembolso total termina la inscripción.

Una nota crédito sobre la factura con el motivo **Anulación** cuenta como reembolso total. Una anulación acredita todo el valor que aún se puede acreditar en la factura. La nota crédito ajusta la factura; devolver el dinero al comprador es un paso aparte. En Studio, ve a **Contabilidad** > **Facturación** > **Notas crédito**, crea la nota y selecciona **Emitir nota crédito**.

Cuando se emite la nota crédito:

- Cada inscripción que creó la factura pasa a **revocada**, y el curso sale de **Mis cursos** del estudiante.
- Las inscripciones que no vinieron de esa factura, como una que creaste tú, no se afectan.
- Un certificado de finalización que el estudiante ya tiene sigue siendo válido.

Una nota crédito con cualquier otro motivo, como una devolución o un descuento, no termina la inscripción.

Una inscripción revocada es definitiva. Si el estudiante vuelve a comprar el curso, recibe una inscripción nueva.

## Relacionado

- [Aprendizaje](../Learning.es.md)
- [Crear y publicar un curso](Courses.es.md)
- [Estudiantes, instructores e inscripciones](Students-and-instructors.es.md)
- [Facturas (English)](../Accounting/Billing/Billing-Records/Invoices.md)
- [Sell courses (English)](Selling-courses.md)
