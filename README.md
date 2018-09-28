# WS-GEE

Servicio Web en PHP para la aplicación Gee

## Rutas

Identificadores antecedidos por : son parámetros en la URL

* GET /ponentes - Lista de ponentes
* GET /ponentes/:ponenteId - Detalles de un ponente
* GET /trabajos - Lista de  trabajos
* GET /trabajos/:trabajoId - Detalles de un trabajo
* GET /asistentes - Lista de asistentes
* GET /asistentes/sesion/:correo - Buscar un asistente por correo
* GET /asistentes/:asistenteId - Detalles de un asistente
* GET /asistentes/:asistenteId/bitacora - Bitácora de asistencia de un asistente
* POST /asistentes/:asistenteId/registro - Registro de asistencia
* GET  /asistentes/:asistenteId/retroalimentacion - Calificaciones dadas por un asistente
* POST /asistentes/:asistenteId/retroalimentacion/:trabajoId - Calificación de un asistente a un trabajo
* DEL /asistentes/:asistenteId/retroalimentacion/:trabajoId - Quitar una calificación dada
