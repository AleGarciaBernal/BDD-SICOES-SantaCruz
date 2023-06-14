use bddInventario;

INSERT INTO cargoEmpleado (idCargo, nombreCargo)
VALUES (1, 'Gerente'),
       (2, 'Supervisor'),
       (3, 'Analista'),
       (4, 'Técnico');

INSERT INTO Departamentos (nombreDepartamento)
VALUES ('La Paz'),
       ('Santa Cruz'),
       ('Cochabamba'),
       ('Potosí'),
       ('Oruro'),
       ('Tarija'),
       ('Chuquisaca'),
       ('Beni'),
       ('Pando');

INSERT INTO Empleados (nombreEmpleado, apellidop, apellidom, cargoEmpleadoId, fechaDeContratacion, contratoVigente)
VALUES ('Juan', 'González', 'Vargas', 1, '2022-01-01', 1),
       ('María', 'Flores', 'Martínez', 2, '2021-05-15', 1),
       ('Carlos', 'Pérez', 'García', 3, '2023-03-10', 1),
       ('Luisa', 'López', 'Hernández', 2, '2022-09-20', 1),
       ('Pedro', 'Gómez', 'Vargas', 4, '2021-11-30', 1),
       ('Ana', 'Mendoza', 'Ramírez', 3, '2023-02-05', 1),
       ('Jorge', 'Flores', 'Chávez', 1, '2022-07-12', 1),
       ('Laura', 'Reyes', 'Jiménez', 2, '2023-01-25', 1),
       ('Sergio', 'Torres', 'Gutiérrez', 3, '2021-08-18', 1),
       ('Mónica', 'Ríos', 'Vega', 4, '2022-06-09', 1),
       ('Ricardo', 'Castro', 'Luna', 1, '2022-04-03', 1),
       ('Patricia', 'Herrera', 'Morales', 3, '2021-09-28', 1),
       ('Roberto', 'Núñez', 'Soto', 2, '2022-11-14', 1),
       ('Fernanda', 'Guerrero', 'Lara', 4, '2023-05-02', 1),
       ('Gustavo', 'Reyes', 'Soto', 1, '2021-12-17', 1);

INSERT INTO Ambientes (nombreAmbiente, responsableAmbienteId)
VALUES ('Oficina 1', 1),
       ('Oficina 2', 2),
       ('Sala de Reuniones', 3),
       ('Laboratorio', 4),
       ('Área de Producción', 6),
       ('Almacén', 6),
       ('Cocina',2),
       ('Baños', 6),
       ('Sala de Espera', 9),
       ('Sala de Capacitación', 10),
       ('Sala de Descanso', 1),
       ('Área de Servidores', 1),
       ('Terraza', 3),
       ('Estacionamiento', 4),
       ('Recepción', 5);

INSERT INTO EquiposTrabajo (nombreEquipo, descripcionEquipo)
VALUES ('Equipo 1', 'Equipo de Desarrollo'),
       ('Equipo 2', 'Equipo de Ventas'),
       ('Equipo 3', 'Equipo de Soporte Técnico'),
       ('Equipo 4', 'Equipo de Marketing'),
       ('Equipo 5', 'Equipo de Recursos Humanos'),
       ('Equipo 6', 'Equipo de Contabilidad'),
       ('Equipo 7', 'Equipo de Calidad'),
       ('Equipo 8', 'Equipo de Logística'),
       ('Equipo 9', 'Equipo de Producción'),
       ('Equipo 10', 'Equipo de Investigación'),
       ('Equipo 11', 'Equipo de Diseño'),
       ('Equipo 12', 'Equipo de Auditoría'),
       ('Equipo 13', 'Equipo de Compras'),
       ('Equipo 14', 'Equipo de Mantenimiento'),
       ('Equipo 15', 'Equipo de Gerencia');

INSERT INTO Proveedores (nombreProveedor, apellidop, apellidom, telefono, departamentoId)
VALUES ('Ryan', 'Gómez', 'López', 123456789, 1),
       ('Diego', 'Rodríguez', 'Martínez', 987654321, 2),
       ('Ellijah', 'Pérez', 'Garcia', 456789123, 3),
       ('Sam', 'López', 'Hernández', 321654987, 4),
       ('Kim', 'Gómez', 'Vargas', 654789321, 5),
       ('Lucy', 'Mendoza', 'Ramírez', 987321654, 6),
       ('Adrian', 'Flores', 'Chávez', 369258147, 7),
       ('Steve', 'Garcia', 'Jiménez', 741852963, 8),
       ('Candance', 'Torres', 'Gutiérrez', 258147369, 9),
       ('Phinneas', 'Ríos', 'Vega', 852963741, 1),
       ('Ferb', 'Castro', 'Vargas', 147369258, 2),
       ('Esteban', 'Herrera', 'Morales', 963741852, 3),
       ('Cristal', 'Reyes', 'Soto', 369852147, 4),
       ('Riley', 'Guerrero', 'Lara', 741369852, 5),
       ('Daniel', 'Reyes', 'Soto', 258741369, 6);

INSERT INTO Categorias (nombreCategoria)
VALUES ('Electrónica'),
       ('Informática'),
       ('Muebles'),
       ('Herramientas'),
       ('Vehículos'),
       ('Suministros'),
       ('Alimentos'),
       ('Ropa'),
       ('Libros');

INSERT INTO Activos (nombreActivo, descripcionActivo, valorActivo, cantidad, proveedorId, idCategoria)
VALUES ('Activo 1', 'Descripción del Activo 1', 100.50, 10, 1, 1),
       ('Activo 2', 'Descripción del Activo 2', 250.75, 5, 2, 2),
       ('Activo 3', 'Descripción del Activo 3', 50.00, 8, 3, 3),
       ('Activo 4', 'Descripción del Activo 4', 75.20, 15, 4, 4),
       ('Activo 5', 'Descripción del Activo 5', 180.90, 20, 5, 5),
       ('Activo 6', 'Descripción del Activo 6', 300.00, 12, 6, 6),
       ('Activo 7', 'Descripción del Activo 7', 150.25, 7, 7, 7),
       ('Activo 8', 'Descripción del Activo 8', 80.50, 3, 8, 8),
       ('Activo 9', 'Descripción del Activo 9', 50.75, 18, 9, 9),
       ('Activo 10', 'Descripción del Activo 10', 200.00, 6, 10, 1),
       ('Activo 11', 'Descripción del Activo 11', 120.90, 9, 11, 2),
       ('Activo 12', 'Descripción del Activo 12', 90.25, 14, 12, 3),
       ('Activo 13', 'Descripción del Activo 13', 70.00, 11, 13, 4),
       ('Activo 14', 'Descripción del Activo 14', 150.50, 2, 14, 5),
       ('Activo 15', 'Descripción del Activo 15', 50.75, 5, 15, 6);

INSERT INTO EstadoSolicitud (nombreEstado)
VALUES ('Pendiente'),
       ('En Proceso'),
       ('Aprobada'),
       ('Rechazada');
       
INSERT INTO Solicitudes (fechaSolicitud, estadoSolicitudId, solicitante, idEquipoTrabajo)
VALUES ('2022-01-01', 1, 4, 1),
       ('2022-02-01', 1, 6, 2),
       ('2022-03-01', 1, 3, 3),
       ('2022-04-01', 1, 5, 4),
       ('2022-05-01', 1, 5, 5),
       ('2022-06-01', 1, 3, 6),
       ('2022-07-01', 1, 2, 7),
       ('2022-08-01', 1, 8, 8),
       ('2022-09-01', 1, 9, 9),
       ('2022-10-01', 1, 1, 10),
       ('2022-11-01', 1, 2, 11),
       ('2022-12-01', 1, 1, 12);

INSERT INTO DetallesSolicitud (idSolicitud, idActivo, cantidadSolicitada)
VALUES (1, 1, 5),
       (2, 2, 10),
       (3, 3, 3),
       (4, 4, 8),
       (5, 5, 2),
       (6, 6, 7),
       (7, 7, 4),
       (8, 8, 9),
       (9, 9, 6),
       (10, 10, 1),
       (11, 11, 5),
       (12, 12, 10);

INSERT INTO EmpleadosEquipos (idEquipo, idEmpleado)
VALUES
    (1, 1), 
    (1, 2), 
    (2, 3), 
    (2, 4), -- Asignar empleado con idEmpleado 4 al equipo con idEquipo 2
    (3,4),
    (4,4),
    (5,5),
    (5,6);
