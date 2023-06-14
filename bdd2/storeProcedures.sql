use bddInventario;
DELIMITER $$
CREATE PROCEDURE CrearSolicitud(
    IN p_fechaSolicitud DATE,
    IN p_solicitante INT,
    IN p_idEquipoTrabajo INT,
    IN p_nombreActivo VARCHAR(50),
    IN p_cantidadSolicitada INT
)
BEGIN
    DECLARE nuevaSolicitudId INT;
    DECLARE idActivos INT;
    
    INSERT INTO Solicitudes (fechaSolicitud, solicitante, idEquipoTrabajo)
    VALUES (p_fechaSolicitud, p_solicitante, p_idEquipoTrabajo);
    
    SET nuevaSolicitudId = LAST_INSERT_ID();
    
    SELECT idActivo INTO idActivos
    FROM Activos
    WHERE nombreActivo = p_nombreActivo
    LIMIT 1;
    
    INSERT INTO DetallesSolicitud (idSolicitud, idActivo, cantidadSolicitada)
    VALUES (nuevaSolicitudId, idActivos, p_cantidadSolicitada);
        SELECT *
    FROM Solicitudes
    WHERE idSolicitud = nuevaSolicitudId;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE ObtenerActivosPorCategoria(
    IN p_nombreCategoria VARCHAR(50)
)
BEGIN
    SELECT a.idActivo, a.nombreActivo, a.descripcionActivo, a.valorActivo, a.cantidad
    FROM Activos a
    INNER JOIN Categorias c ON a.idCategoria = c.idCategoria
    WHERE c.nombreCategoria = p_nombreCategoria;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE busquedaEmpleados(IN columna VARCHAR(50), IN valor VARCHAR(50))
BEGIN
    SET @consultasql = CONCAT('SELECT * FROM Empleados');

    IF valor IS NOT NULL THEN
        SET @consultasql = CONCAT(@consultasql, ' WHERE ', columna, ' = ''', valor, '''');
    END IF;

    PREPARE consulta FROM @consultasql;
    EXECUTE consulta;
    DEALLOCATE PREPARE consulta;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE MostrarMiembrosEquipo(
    IN p_nombreEquipo VARCHAR(50)
)
BEGIN
    SELECT e.idEmpleado, e.nombreEmpleado, e.apellidop, e.apellidom
    FROM Empleados e
    INNER JOIN EmpleadosEquipos ee ON e.idEmpleado = ee.idEmpleado
    INNER JOIN EquiposTrabajo et ON ee.idEquipo = et.idEquipo
    WHERE et.nombreEquipo = p_nombreEquipo;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE ConsultarSolicitudesPorEstado(
    IN p_estadoSolicitud VARCHAR(50)
)
BEGIN
    SET @sql = CONCAT('SELECT * FROM Solicitudes WHERE estadoSolicitudId = (SELECT idEstado FROM EstadoSolicitud WHERE nombreEstado = ''', p_estadoSolicitud, ''')');

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END $$
DELIMITER ;





