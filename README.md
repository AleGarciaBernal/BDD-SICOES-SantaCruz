# Base de Datos de Inventario par el Gobierno Autonomo Municipal De Santa Cruz de la Sierra

## Descripción
Este proyecto contiene la definición y estructura de una base de datos de inventario, que permite gestionar activos, solicitudes y equipos de trabajo. La base de datos se ha diseñado utilizando el lenguaje SQL y cumple con los principios de normalización para asegurar la integridad de los datos.

## Estructura de la Base de Datos
La base de datos consta de las siguientes tablas:

- `cargoEmpleado`: Almacena los diferentes cargos o roles de los empleados.
- `Empleados`: Contiene información sobre los empleados, incluyendo su nombre, apellidos, cargo y fechas de contratación.
- `Ambientes`: Registra los diferentes ambientes o espacios, junto con su responsable.
- `EquiposTrabajo`: Guarda información sobre los equipos de trabajo, como su nombre y descripción.
- `EmpleadosEquipos`: Relación de muchos a muchos entre empleados y equipos de trabajo.
- `Departamentos`: Almacena los departamentos a los que pertenecen los proveedores.
- `Proveedores`: Contiene información sobre los proveedores, incluyendo su nombre, apellidos, teléfono y departamento.
- `Categorias`: Registra las categorías de los activos.
- `Activos`: Almacena información detallada sobre los activos, incluyendo su nombre, descripción, valor y cantidad disponible.
- `EstadoSolicitud`: Guarda los posibles estados de las solicitudes.
- `Solicitudes`: Registra las solicitudes realizadas por los empleados, incluyendo la fecha, estado, solicitante y equipo de trabajo asociado.
- `DetallesSolicitud`: Almacena los detalles de cada solicitud, incluyendo los activos solicitados y la cantidad.
## Diagrama ER
- Disponible en la carpeta bdd2
## Uso de la Base de Datos
- Puede realizar consultas y operaciones CRUD (crear, leer, actualizar, eliminar) en las tablas utilizando sentencias SQL adecuadas.

## Auditoria
- Se ha creado tablas de auditoria que permiten el control sobre las tablas en operaciones como insertar, actualizar y eliminar

## Indexacion
- Se han optimizado queries con la creacion de indices simples y compuestos

## Triggers
- Automatizacion para procesos recurrentes

## Stored Procedures
- Tareas recurrentes optimizadas mediante Stored Procedures

## Instalación y Uso

1. Clona o descarga este repositorio en tu máquina local.

2. Asegúrate de tener Docker Desktop en ejecución.

3. Abre una ventana de comandos o terminal en el directorio raíz del proyecto.

4. Ejecuta el siguiente comando para iniciar el contenedor:

docker-compose up -d

Esto creará y ejecutará el contenedor MySQL con la base de datos.

5. Una vez que el contenedor esté en ejecución, puedes conectarte a la base de datos utilizando una herramienta de administración de MySQL o ejecutando comandos SQL desde una ventana de comandos o terminal.

6. Para detener y eliminar el contenedor cuando hayas terminado, ejecuta el siguiente comando:

docker-compose down


## Estructura del Proyecto

El proyecto está organizado de la siguiente manera:

- `sql.yml`: Archivo de composición de Docker para crear y configurar el contenedor MySQL.
- `init.sql`: Archivo SQL con las instrucciones para crear las tablas.
- `initialData.sql` : Archivo SQL con datos iniciales
- `shadowtable.sql` : Archivo SQL con intrucciones para crear tablas de auditoria y sus respectivos triggers
- `triggers.sql` : Archivo SQl con las instrucciones para la creacion de 5 triggers
- `storeProcedures.sql`: Archivo SQL con instrucciones necesarias para la creacion de 5 Stored Procedures
