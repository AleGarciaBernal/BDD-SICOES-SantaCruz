use bddInventario;
CREATE TABLE cargoEmpleado (
  idCargo INT PRIMARY KEY,
  nombreCargo VARCHAR(50)
);

CREATE TABLE Empleados (
  idEmpleado INT PRIMARY KEY AUTO_INCREMENT,
  nombreEmpleado VARCHAR(50),
  apellidop VARCHAR (30),
  apellidom VARCHAR (30),
  cargoEmpleadoId INT,
  fechaDeContratacion DATE,
  fechaDeFinalizacion DATE NULL,
  contratoVigente BOOLEAN,
  FOREIGN KEY (cargoEmpleadoId) REFERENCES cargoEmpleado(idCargo)
);

CREATE TABLE Ambientes (
  idAmbiente INT PRIMARY KEY AUTO_INCREMENT,
  nombreAmbiente VARCHAR(50),
  responsableAmbienteId INT,
  FOREIGN KEY (responsableAmbienteId) REFERENCES Empleados(idEmpleado)
);

CREATE TABLE EquiposTrabajo (
  idEquipo INT PRIMARY KEY AUTO_INCREMENT,
  nombreEquipo VARCHAR(50),
  descripcionEquipo VARCHAR(100)
);

CREATE TABLE EmpleadosEquipos (
  idEquipo INT AUTO_INCREMENT,
  idEmpleado INT,
  PRIMARY KEY (idEquipo, idEmpleado),
  FOREIGN KEY (idEquipo) REFERENCES EquiposTrabajo(idEquipo),
  FOREIGN KEY (idEmpleado) REFERENCES Empleados(idEmpleado)
);

CREATE TABLE Departamentos (
  idDepartamento INT PRIMARY KEY AUTO_INCREMENT,
  nombreDepartamento VARCHAR(50)
);

CREATE TABLE Proveedores (
  idProveedor INT PRIMARY KEY AUTO_INCREMENT,
  nombreProveedor VARCHAR(50),
  apellidop VARCHAR(30),
  apellidom VARCHAR(30),
  telefono INT(15),
  departamentoId INT,
  FOREIGN KEY (departamentoId) REFERENCES Departamentos(idDepartamento)
);

CREATE TABLE Categorias (
  idCategoria INT PRIMARY KEY AUTO_INCREMENT,
  nombreCategoria VARCHAR(50)
);

CREATE TABLE Activos (
  idActivo INT PRIMARY KEY AUTO_INCREMENT,
  nombreActivo VARCHAR(50),
  descripcionActivo VARCHAR(100),
  valorActivo DECIMAL(10,2),
  cantidad INT,
  proveedorId INT,
  idCategoria INT,
  FOREIGN KEY (proveedorId) REFERENCES Proveedores(idProveedor),
  FOREIGN KEY (idCategoria) REFERENCES Categorias(idCategoria)
);

CREATE TABLE EstadoSolicitud (
  idEstado INT PRIMARY KEY AUTO_INCREMENT,
  nombreEstado VARCHAR(50)
);

CREATE TABLE Solicitudes (
  idSolicitud INT PRIMARY KEY AUTO_INCREMENT,
  fechaSolicitud DATE,
  estadoSolicitudId INT,
  solicitante INT,
  idEquipoTrabajo INT,
  FOREIGN KEY (estadoSolicitudId) REFERENCES EstadoSolicitud(idEstado),
  FOREIGN KEY (solicitante) REFERENCES Empleados(idEmpleado),
  FOREIGN KEY (idEquipoTrabajo) REFERENCES EquiposTrabajo(idEquipo)
);

CREATE TABLE DetallesSolicitud (
  idDetalleSolicitud INT PRIMARY KEY AUTO_INCREMENT,
  idSolicitud INT,
  idActivo INT,
  cantidadSolicitada INT,
  FOREIGN KEY (idSolicitud) REFERENCES Solicitudes(idSolicitud),
  FOREIGN KEY (idActivo) REFERENCES Activos(idActivo)
);

CREATE INDEX idx_estadoSolicitud ON Solicitudes(estadoSolicitudId);
CREATE INDEX idx_estadoSolicitudSolicitante ON Solicitudes(estadoSolicitudId,solicitante);
CREATE INDEX idx_empleadoContratoVigente ON Empleados(contratoVigente);
CREATE INDEX idx_catgoriaActivoProveedor ON Activos(idCategoria, proveedorId);
CREATE INDEX idx_proveedorDepartamento ON Proveedores(departamentoId);

