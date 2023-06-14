use bddInventario;
CREATE TABLE Shadow_Activos (
  idShadow INT PRIMARY KEY AUTO_INCREMENT,
  idActivoOriginal INT,
  nombreActivo VARCHAR(50),
  descripcionActivo VARCHAR(100),
  valorActivo DECIMAL(10,2),
  cantidad INT,
  proveedorId INT,
  idCategoria INT,
  fechaDeModificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  accion VARCHAR(10),
  FOREIGN KEY (proveedorId) REFERENCES Proveedores(idProveedor),
  FOREIGN KEY (idCategoria) REFERENCES Categorias(idCategoria)
);
CREATE TABLE Shadow_Empleados (
  idShadow INT PRIMARY KEY AUTO_INCREMENT,
  idEmpleadoOriginal INT,
  nombreEmpleado VARCHAR(50),
  apellidop VARCHAR(30),
  apellidom VARCHAR(30),
  cargoEmpleadoId INT,
  fechaDeContratacion DATE,
  fechaDeFinalizacion DATE NULL,
  contratoVigente BOOLEAN,
  fechaDeModificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  accion VARCHAR(10),
  FOREIGN KEY (cargoEmpleadoId) REFERENCES cargoEmpleado(idCargo)
);
CREATE TABLE Shadow_Solicitudes (
  idShadow INT PRIMARY KEY AUTO_INCREMENT,
  idSolicitudOriginal INT,
  fechaSolicitud DATE,
  estadoSolicitudId INT,
  solicitante INT,
  idEquipoTrabajo INT,
  fechaDeModificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  accion VARCHAR(10),
  FOREIGN KEY (estadoSolicitudId) REFERENCES EstadoSolicitud(idEstado),
  FOREIGN KEY (solicitante) REFERENCES Empleados(idEmpleado),
  FOREIGN KEY (idEquipoTrabajo) REFERENCES EquiposTrabajo(idEquipo)
);
CREATE TABLE Shadow_DetallesSolicitud (
  idShadow INT PRIMARY KEY AUTO_INCREMENT,
  idDetalleSolicitudOriginal INT,
  idSolicitud INT,
  idActivo INT,
  cantidadSolicitada INT,
  fechaDeModificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  accion VARCHAR(10),
  FOREIGN KEY (idSolicitud) REFERENCES Solicitudes(idSolicitud),
  FOREIGN KEY (idActivo) REFERENCES Activos(idActivo)
);

CREATE TABLE Shadow_Proveedores (
  idShadow INT PRIMARY KEY AUTO_INCREMENT,
  idProveedorOriginal INT,
  nombreProveedor VARCHAR(50),
  apellidop VARCHAR(30),
  apellidom VARCHAR (30),
  telefono INT(15),
  departamentoId INT,
  fechaDeModificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  accion VARCHAR(10),
  FOREIGN KEY (departamentoId) REFERENCES Departamentos(idDepartamento)
);

DELIMITER $$
CREATE TRIGGER ins_shadow_activos
AFTER INSERT ON Activos
FOR EACH ROW
BEGIN
    INSERT INTO Shadow_Activos (idActivoOriginal,nombreActivo,descripcionActivo,valorActivo,
        cantidad,proveedorId,idCategoria,accion)
        VALUES (NEW.idActivo,NEW.nombreActivo,NEW.descripcionActivo,NEW.valorActivo,
        NEW.cantidad,NEW.proveedorId,NEW.idCategoria,'INSERT');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER upd_shadow_activos
AFTER UPDATE ON Activos
FOR EACH ROW
BEGIN
    INSERT INTO Shadow_Activos (idActivoOriginal,nombreActivo,descripcionActivo,valorActivo,
        cantidad,proveedorId,idCategoria,accion)
    VALUES (NEW.idActivo,NEW.nombreActivo,NEW.descripcionActivo,NEW.valorActivo,
        NEW.cantidad,NEW.proveedorId,NEW.idCategoria,'UPDATE');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER del_shadow_activos
AFTER DELETE ON Activos
FOR EACH ROW
BEGIN
    INSERT INTO Shadow_Activos (idActivoOriginal,nombreActivo,descripcionActivo,
        valorActivo,cantidad,proveedorId,idCategoria,accion)
        VALUES (OLD.idActivo,OLD.nombreActivo,OLD.descripcionActivo,
        OLD.valorActivo,OLD.cantidad,OLD.proveedorId,OLD.idCategoria,'DELETE');
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER ins_shadow_empleados
AFTER INSERT ON Empleados
FOR EACH ROW
BEGIN
    INSERT INTO Shadow_Empleados (idEmpleadoOriginal,nombreEmpleado,apellidop,
        apellidom,cargoEmpleadoId,fechaDeContratacion,fechaDeFinalizacion,
        contratoVigente,fechaDeModificacion,accion) 
        VALUES (NEW.idEmpleado,NEW.nombreEmpleado,NEW.apellidop,NEW.apellidom,
        NEW.cargoEmpleadoId,NEW.fechaDeContratacion,NEW.fechaDeFinalizacion,
        NEW.contratoVigente,CURRENT_TIMESTAMP,'INSERT');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER upd_shadow_empleados
AFTER UPDATE ON Empleados
FOR EACH ROW
BEGIN
    INSERT INTO Shadow_Empleados (idEmpleadoOriginal,nombreEmpleado,apellidop,apellidom,
        cargoEmpleadoId,fechaDeContratacion,fechaDeFinalizacion,contratoVigente,
        fechaDeModificacion,accion)
        VALUES (NEW.idEmpleado,NEW.nombreEmpleado,NEW.apellidop,NEW.apellidom,NEW.cargoEmpleadoId,
        NEW.fechaDeContratacion,NEW.fechaDeFinalizacion,NEW.contratoVigente,CURRENT_TIMESTAMP,
        'UPDATE');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER del_shadow_empleados
AFTER DELETE ON Empleados
FOR EACH ROW
BEGIN
    INSERT INTO Shadow_Empleados (idEmpleadoOriginal,nombreEmpleado,apellidop,apellidom,
        cargoEmpleadoId,fechaDeContratacion,fechaDeFinalizacion,contratoVigente,
        fechaDeModificacion,accion)
        VALUES (OLD.idEmpleado,OLD.nombreEmpleado,OLD.apellidop,OLD.apellidom,OLD.cargoEmpleadoId,
        OLD.fechaDeContratacion,OLD.fechaDeFinalizacion,OLD.contratoVigente,CURRENT_TIMESTAMP,'DELETE');
END $$
DELIMITER ;



DELIMITER $$
CREATE TRIGGER ins_solicitudes
AFTER INSERT ON Solicitudes
FOR EACH ROW
BEGIN
    INSERT INTO Shadow_Solicitudes (idSolicitudOriginal, fechaSolicitud, estadoSolicitudId, solicitante, idEquipoTrabajo, accion)
    VALUES (NEW.idSolicitud, NEW.fechaSolicitud, NEW.estadoSolicitudId, NEW.solicitante, NEW.idEquipoTrabajo, 'INSERT');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER upd_solicitudes
AFTER UPDATE ON Solicitudes
FOR EACH ROW
BEGIN
    INSERT INTO Shadow_Solicitudes (idSolicitudOriginal, fechaSolicitud, estadoSolicitudId, solicitante, idEquipoTrabajo, accion)
    VALUES (NEW.idSolicitud, NEW.fechaSolicitud, NEW.estadoSolicitudId, NEW.solicitante, NEW.idEquipoTrabajo, 'UPDATE');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER del_solicitudes
AFTER DELETE ON Solicitudes
FOR EACH ROW
BEGIN
    INSERT INTO Shadow_Solicitudes (idSolicitudOriginal, fechaSolicitud, estadoSolicitudId, solicitante, idEquipoTrabajo, accion)
    VALUES (OLD.idSolicitud, OLD.fechaSolicitud, OLD.estadoSolicitudId, OLD.solicitante, OLD.idEquipoTrabajo, 'DELETE');
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER trigger_detalles_solicitud_insert
AFTER INSERT ON DetallesSolicitud
FOR EACH ROW
BEGIN
  INSERT INTO Shadow_DetallesSolicitud (idDetalleSolicitudOriginal, idSolicitud, idActivo, cantidadSolicitada, accion)
  VALUES (NEW.idDetalleSolicitud, NEW.idSolicitud, NEW.idActivo, NEW.cantidadSolicitada, 'INSERT');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trigger_detalles_solicitud_update
AFTER UPDATE ON DetallesSolicitud
FOR EACH ROW
BEGIN
  INSERT INTO Shadow_DetallesSolicitud (idDetalleSolicitudOriginal, idSolicitud, idActivo, cantidadSolicitada, accion)
  VALUES (NEW.idDetalleSolicitud, NEW.idSolicitud, NEW.idActivo, NEW.cantidadSolicitada, 'UPDATE');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trigger_detalles_solicitud_delete
AFTER DELETE ON DetallesSolicitud
FOR EACH ROW
BEGIN
  INSERT INTO Shadow_DetallesSolicitud (idDetalleSolicitudOriginal, idSolicitud, idActivo, cantidadSolicitada, accion)
  VALUES (OLD.idDetalleSolicitud, OLD.idSolicitud, OLD.idActivo, OLD.cantidadSolicitada, 'DELETE');
END $$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER trigger_proveedores_insert
AFTER INSERT ON Proveedores
FOR EACH ROW
BEGIN
  INSERT INTO Shadow_Proveedores (idProveedorOriginal, nombreProveedor,apellidop,apellidom, telefono, departamentoId, accion)
  VALUES (NEW.idProveedor, NEW.nombreProveedor,NEW.apellidop, NEW.apellidom, NEW.telefono, NEW.departamentoId, 'INSERT');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trigger_proveedores_update
AFTER UPDATE ON Proveedores
FOR EACH ROW
BEGIN
  INSERT INTO Shadow_Proveedores (idProveedorOriginal, nombreProveedor,apellidop,apellidom, telefono, departamentoId, accion)
  VALUES (NEW.idProveedor, NEW.nombreProveedor,NEW.apellidop,NEW.apellidom, NEW.telefono, NEW.departamentoId, 'UPDATE');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trigger_proveedores_delete
AFTER DELETE ON Proveedores
FOR EACH ROW
BEGIN
  INSERT INTO Shadow_Proveedores (idProveedorOriginal, nombreProveedor,apellidop,apellidom, telefono, departamentoId, accion)
  VALUES (OLD.idProveedor, OLD.nombreProveedor, OLD.telefono, OLD.departamentoId, 'DELETE');
END $$
DELIMITER ;



