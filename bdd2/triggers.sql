DELIMITER $$
CREATE TRIGGER trg_ValidarCantidadActivo
BEFORE INSERT ON Activos
FOR EACH ROW
BEGIN
    IF NEW.cantidad <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cantidad de activos debe ser mayor a cero.';
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_ActualizarFechaContratacion1
BEFORE INSERT ON Empleados
FOR EACH ROW
BEGIN
    SET NEW.fechaDeContratacion = CURRENT_DATE();
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_ValidarFechaFinalizacion
BEFORE UPDATE ON Empleados
FOR EACH ROW
BEGIN
    IF NEW.fechaDeFinalizacion IS NOT NULL AND NEW.fechaDeFinalizacion < OLD.fechaDeContratacion THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de finalización no puede ser anterior a la fecha de contratación.';
    END IF;
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER trg_SetEstadoPendiente
BEFORE INSERT ON Solicitudes
FOR EACH ROW
BEGIN
    SET NEW.estadoSolicitudId = (SELECT idEstado FROM EstadoSolicitud WHERE nombreEstado = 'Pendiente');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_ActualizarFechaFinalizacion
BEFORE UPDATE ON Empleados
FOR EACH ROW
BEGIN
    IF NEW.contratoVigente = 0 THEN
        SET NEW.fechaDeFinalizacion = CURDATE();
    END IF;
END $$
DELIMITER ;