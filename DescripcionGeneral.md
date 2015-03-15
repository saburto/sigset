# Gestión de servicio técnico electrónico #

# Descripción general. #
# Perspectiva del producto. #

El proyecto es un sistema para el control de flujos de procesos de un servicio técnico electrónico. Para este proceso el sistema deberá permitir registrar los artículos que ingresan al servicio y administrar de manera eficiente la carga de trabajo para los técnicos.

En el registro de artículos que ingresan al servicio técnico deberá ser un mantenedor de órdenes de trabajo, además debe contar con un flujo de trabajo manejado por estados, los cuales indicarán la situación actual dentro del servicio.

Para la administración en la carga de trabajo de los técnicos, el sistema deberá permitir realizar una asignación de trabajo a los técnicos dependiendo de su especialidad y disponibilidad de tiempo al momento de realizar la carga. El sistema será capaz de balancear los técnicos disponibles con el trabajo disponible según especialidad, y los técnicos deberán evaluar la dificultad del trabajo indicando el tiempo estimado a reparar el articulo, se debe especificar que este tiene un tope preestablecido para el cliente dueño del articulo, pero internamente se manejaran tiempos para una mayor optimización en el uso de recursos y tiempo.

# Capacidades generales. #

Para el registro de órdenes de trabajo el sistema debe permitir registrar todos los datos necesarios para identificar el artículo, además debe permitir realizar el flujo de trabajo de manera ordenada, y dependiente de los diferentes perfiles de usuarios con las autorizaciones correspondientes. Para el cambio de estados será responsabilidad de cada actor dentro del flujo de trabajo cumplir la labor de actualizar el estado correspondiente del artículo. Se restringirán los accesos definiendo los perfiles correspondientes que serán usados en el sistema y los estados también se  regirán por el mismo modelo se asociaran  a los perfiles. Para lograr el ajuste de cada perfil, el sistema debe permitir la configuración de perfiles con los permisos correspondientes.
El sistema debe permitir agregar y modificar los estados actuales.

Para la asignación de carga de trabajo para los técnicos el sistema permitirá asignar diferentes especialidades y dependiendo de sus habilidades se diferenciaran en niveles para la asignación de trabajo. El sistema debe permitir










