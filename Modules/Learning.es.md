# Aprendizaje

El módulo de Aprendizaje te permite crear cursos, impartirlos a tus estudiantes y venderlos como parte de tu catálogo.

## Para quién es

- Equipos de formación, academias y escuelas que enseñan en línea.
- Empresas que venden cursos junto con sus otros productos y servicios.
- Instructores que preparan el contenido de los cursos y acompañan a sus estudiantes.

## Disponibilidad

El módulo aparece en Studio como **Learning Manager** entre los módulos de tu espacio de trabajo. Abre tu espacio en Studio, ve a **Módulos** y abre el módulo de Aprendizaje. Su menú tiene tres grupos:

- **Cursos**: **Todos los cursos**.
- **Personas**: **Estudiantes** e **Instructores**.
- **Catálogo**: **Colecciones** y **Categorías**.

Para ver cursos necesitas permiso para leer cursos. Para agregarlos, editarlos o eliminarlos necesitas los permisos de cursos correspondientes. El administrador de tu espacio los concede mediante roles de seguridad. La disponibilidad del módulo puede depender de tu plan.

## Qué puedes hacer

### Crear cursos

Un curso tiene título, código, descripción, calendario y una estimación de esfuerzo. Organizas su contenido en secciones y unidades, y agregas páginas, wikis y artículos, bibliotecas, materiales y archivos. Cada curso tiene su propia navegación en Studio, así que todo lo que le pertenece está en un solo lugar.

Consulta [Crear y publicar un curso](Learning/Courses.es.md).

### Organizar tu catálogo

- Las **categorías** agrupan cursos por tema.
- Las **colecciones** agrupan cursos relacionados bajo un nombre, por ejemplo una ruta de aprendizaje. Creas las colecciones en Studio, en **Catálogo** > **Colecciones**. Para agregar o quitar los cursos de una colección, selecciona **Cursos** en las acciones de la colección: el cuadro de diálogo lista sus cursos, te deja agregar uno con el selector **Curso** y quita uno con su botón de quitar. Cambiar los cursos de una colección requiere permiso para actualizar cursos. También puedes hacerlo con el servicio Learning de la API REST (`/api/v2/LearningService/CourseCollections/{collectionId}/Courses`).

### Gestionar instructores y estudiantes

Cada instructor y cada estudiante tiene un perfil vinculado a un contacto de tu espacio. Asignas instructores al equipo de un curso, inscribes estudiantes en un curso y organizas a los inscritos en cohortes.

Consulta [Estudiantes, instructores e inscripciones](Learning/Students-and-instructors.es.md).

### Vender cursos

Un curso forma parte de tu catálogo, así que puedes venderlo como cualquier otro artículo. Fijas su precio y su moneda en Studio. Cuando el comprador paga, queda inscrito en el curso. Un reembolso total termina la inscripción. Para dar un curso sin costo, inscribe tú mismo al estudiante.

Consulta [Vender cursos](Learning/Selling-courses.es.md).

### Reconocer la finalización

Puedes diseñar plantillas de certificado para un curso y emitir certificados de finalización a tus estudiantes. Los certificados los emite el personal; cada estudiante ve en Studio solo sus propios certificados.

### Mantener informados a los estudiantes

Cada curso tiene **Novedades** para anuncios y **Foros** para que la comunidad del curso converse.

## Estado de la inscripción

Cada inscripción tiene uno de tres estados:

| Estado | Qué significa |
|---|---|
| Activa | El estudiante tiene acceso al curso. |
| Completada | Próximamente. Hoy ninguna inscripción llega a este estado: las inscripciones están activas o revocadas. |
| Revocada | Se retiró el acceso, por ejemplo después de un reembolso total. |

Una inscripción revocada es definitiva. Si el estudiante vuelve al curso, por ejemplo comprándolo de nuevo, recibe una inscripción nueva.

## Próximamente

- Calificaciones y cuestionarios para los cursos.
- Progreso del estudiante, horas de aprendizaje y tareas pendientes (hoy el panel del estudiante muestra **Aún no disponible** para estos datos).
- Finalización de cursos, y certificados emitidos automáticamente al completar un curso.
- Un curso gratuito que inscribe al estudiante desde el proceso de pago.

Consulta la [hoja de ruta](../get-started/Roadmap.md).

- [Learning (English)](Learning.md)
