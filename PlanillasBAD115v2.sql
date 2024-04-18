/********************************************************************************
        TABLA: SEXO
********************************************************************************/
CREATE TABLE Sexo (
    id_sexo int not null constraint sexo_pk primary key,
    nombreSexo varchar2(10) not null unique
);

/********************************************************************************
        TABLA: PROFESION
********************************************************************************/
CREATE TABLE Profesion (
    id_profesion int not null constraint profesion_pk primary key,
    nombreProfesion varchar2(30) not null
);

/********************************************************************************
        TABLA: EMPRESA
********************************************************************************/
CREATE TABLE Empresa (
    id_empresa      int not null constraint empresa_pk primary key,
    correoEmpresa   varchar2(50),
    nombreEmpresa   varchar2(100) not null,
    direccion       varchar2(120),
    nic             varchar2(20),
    nit             varchar2(20),
    telefono        varchar2(13),
    paginaWeb       varchar2(99)
);

/********************************************************************************
        TABLA: UNIDAD ORGANIZATIVA
********************************************************************************/
CREATE TABLE UnidadOrganizativa (
    id_unidadOrg int not null constraint unidadOrg_pk primary key,
    nombreUnidadOrg varchar2(30) not null,
    id_empresa int not null
);
ALTER TABLE UnidadOrganizativa ADD CONSTRAINT id_empresa_fk FOREIGN KEY (id_empresa) REFERENCES Empresa (id_empresa);

/********************************************************************************
        TABLA: PUESTO
********************************************************************************/
CREATE TABLE Puesto (
    id_puesto       int not null constraint puesto_pk primary key,
    nombrePuesto    varchar2(30) not null,
    salarioMinimo   float,
    salarioMaximo   float,
    id_unidadOrg    int not null
);
ALTER TABLE Puesto ADD CONSTRAINT id_unidadOrg_fk FOREIGN KEY (id_unidadOrg) REFERENCES UnidadOrganizativa (id_unidadOrg);

/********************************************************************************
        TABLA: ESTADO CIVIL
********************************************************************************/
CREATE TABLE EstadoCivil (
    id_estadoCivil int not null constraint estadoCivil_pk primary key,
    nombreEstadoCivil varchar2(20) not null unique
);

/********************************************************************************
        TABLA: TIPO DOCUMENTO
********************************************************************************/
CREATE TABLE TipoDocumento (
    id_tipoDocumento int not null constraint tipoDocumento_pk primary key,
    nombreTipoDocumento varchar2(10) not null unique
);

/********************************************************************************
        TABLA: DOCUMENTO
********************************************************************************/
CREATE TABLE Documento (
    id_documento int not null constraint documento_pk primary key,
    numeroDocumento varchar2(20) not null unique,
    id_tipoDocumento int not null
);
ALTER TABLE Documento ADD CONSTRAINT id_tipoDocumento_fk FOREIGN KEY (id_tipoDocumento) REFERENCES TipoDocumento (id_tipoDocumento);

/********************************************************************************
        TABLA: DEPARTAMENTO
********************************************************************************/
CREATE TABLE Departamento (
    id_departamento int not null constraint departamento_pk primary key,
    nombreDepartamento varchar2(15) not null
);

/********************************************************************************
        TABLA: MUNICIPIO
********************************************************************************/
CREATE TABLE Municipio (
    id_municipio int not null constraint municipio_pk primary key,
    nombreMunicipio varchar2(30) not null,
    id_departamento int not null
);
ALTER TABLE Municipio ADD CONSTRAINT id_departamento_fk FOREIGN KEY (id_departamento) REFERENCES Departamento (id_departamento);

/********************************************************************************
        TABLA: EMPLEADO
********************************************************************************/
CREATE TABLE Empleado (
    id_empleado             int not null constraint empleado_pk primary key,
    primerNombre            varchar2(25) not null,
    segundoNombre           varchar2(25),
    primerApellido          varchar2(25) not null,
    segundoApellido         varchar2(25),
    apellidoCasada          varchar2(25),
    fechaNacimiento         date not null,
    fechaIngresoSistema     date not null,
    nit                     varchar2(17) not null,
    numeroISSS              varchar2(9) not null,
    nup                     varchar2(12) not null,
    salario                 float,
    correoPersonal          varchar2(99),
    correoInstitucional     varchar2(99) not null,
    id_sexo                 int not null,
    id_estadoCivil          int not null,
    id_documento            int not null,
    id_profesion            int not null,
    id_puesto               int not null,
    id_municipio            int not null,
    id_descuento            int not null
);
ALTER TABLE Empleado ADD CONSTRAINT id_sexo_fk FOREIGN KEY (id_sexo) REFERENCES Sexo(id_sexo);
ALTER TABLE Empleado ADD CONSTRAINT id_estadoCivil_fk FOREIGN KEY (id_estadoCivil) REFERENCES EstadoCivil(id_estadoCivil);
ALTER TABLE Empleado ADD CONSTRAINT id_documento_fk FOREIGN KEY (id_documento) REFERENCES Documento(id_documento);
ALTER TABLE Empleado ADD CONSTRAINT id_profesion_fk FOREIGN KEY (id_profesion) REFERENCES Profesion(id_profesion);
ALTER TABLE Empleado ADD CONSTRAINT id_puesto_fk FOREIGN KEY (id_puesto) REFERENCES Puesto(id_puesto);
ALTER TABLE Empleado ADD CONSTRAINT id_municipio_fk FOREIGN KEY (id_municipio) REFERENCES Municipio(id_municipio);

/********************************************************************************
        TABLA: TIPO DESCUENTO
********************************************************************************/
CREATE TABLE TipoDescuento (
    id_tipoDescuento int not null constraint tipoDescuento_pk primary key,
    nombreTipoDesc varchar2(25) not null
);

/********************************************************************************
        TABLA: DESCUENTO
********************************************************************************/
CREATE TABLE Descuento (
    id_descuento    int not null constraint descuento_pk primary key,
    fechaDescuento  date not null,
    descuento       float not null,
    id_tipoDescuento     int not null,
    id_empleado     int not null
);
ALTER TABLE Descuento ADD CONSTRAINT id_tipoDescuento_fk FOREIGN KEY (id_tipoDescuento) REFERENCES TipoDescuento (id_tipoDescuento);
ALTER TABLE Descuento ADD CONSTRAINT id_empleado_fk FOREIGN KEY (id_empleado) REFERENCES Empleado (id_empleado);

/********************************************************************************
        TABLA: TIPO INGRESO
********************************************************************************/
CREATE TABLE TipoIngreso (
    id_tipoIngreso      int not null constraint tipoIngreso_pk primary key,
    nombreTipoIngreso   varchar2(25) not null
);

/********************************************************************************
        TABLA: INGRESO
********************************************************************************/
CREATE TABLE Ingreso (
    id_ingreso    int not null constraint ingreso_pk primary key,
    fechaIngreso    date not null,
    ingreso         float not null,
    id_tipoIngreso  int not null,
    id_empleado     int not null
);
ALTER TABLE Ingreso ADD CONSTRAINT id_tipoIngreso_fk FOREIGN KEY (id_tipoIngreso) REFERENCES TipoIngreso (id_tipoIngreso);
ALTER TABLE Ingreso ADD CONSTRAINT id_empleado2_fk FOREIGN KEY (id_empleado) REFERENCES Empleado (id_empleado);

/********************************************************************************
        TABLA: DEPARTAMENTO UNIDAD ORGANIZATIVA
********************************************************************************/
CREATE TABLE DepUnidadOrgani (
    id_depOrg       int not null constraint depOrg_pk primary key,
    nombreDepOrg    varchar2(30) not null,
    id_unidadOrg    int not null
);
ALTER TABLE DepUnidadOrgani ADD CONSTRAINT id_unidadOrg2_fk FOREIGN KEY (id_unidadOrg) REFERENCES UnidadOrganizativa (id_unidadOrg);

/********************************************************************************
        TABLA: AREA UNIDAD ORGANIZATIVA
********************************************************************************/
CREATE TABLE AreaUnidadOrgani (
    id_areaUnidadOrg       int not null constraint areaUnidadOrg_pk primary key,
    nombreAreaUnidadOrg    varchar2(30) not null,
    id_depOrg    int not null
);
ALTER TABLE AreaUnidadOrgani ADD CONSTRAINT id_depOrg_fk FOREIGN KEY (id_depOrg) REFERENCES DepUnidadOrgani (id_depOrg);

/********************************************************************************
        TABLA: SECCIONES UNIDAD ORGANIZATIVA
********************************************************************************/
CREATE TABLE SeccionesUnidadOrgani (
    id_seccionUniOrg       int not null constraint seccionUniOrg_pk primary key,
    nombreSeccionUniOrg    varchar2(30) not null,
    id_areaUnidadOrg        int not null
);
ALTER TABLE SeccionesUnidadOrgani ADD CONSTRAINT id_areaUnidadOrg_fk FOREIGN KEY (id_areaUnidadOrg) REFERENCES AreaUnidadOrgani (id_areaUnidadOrg);

/********************************************************************************
        TABLA: SUBSECCIONES UNIDAD ORGANIZATIVA
********************************************************************************/
CREATE TABLE SubseccionesUnidadOrgani (
    id_subSecUniOrg         int not null constraint subSecUniOrg_pk primary key,
    nombreSubSecUniOrg      varchar2(30) not null,
    id_seccionUniOrg        int not null
);
ALTER TABLE SubseccionesUnidadOrgani ADD CONSTRAINT id_seccionUniOrg_fk FOREIGN KEY (id_seccionUniOrg) REFERENCES SeccionesUnidadOrgani (id_seccionUniOrg);

/********************************************************************************
        SECUENCIA: AUTOINCREMENTAL
********************************************************************************/
CREATE SEQUENCE autoincremental MINVALUE 1 START WITH 1 CACHE 10;


/********************************************************************************
        INSERT DE TABLA SEXO
********************************************************************************/
INSERT INTO SEXO (id_sexo, nombreSexo) VALUES (1, 'Masculino');
INSERT INTO SEXO (id_sexo, nombreSexo) VALUES (2, 'Femenino');

/********************************************************************************
        INSERT DE TABLA ESTADOCIVIL
********************************************************************************/
INSERT INTO EstadoCivil (id_estadoCivil, nombreEstadoCivil) VALUES (1, 'Soltero(a)');
INSERT INTO EstadoCivil (id_estadoCivil, nombreEstadoCivil) VALUES (2, 'Casado(a)');
INSERT INTO EstadoCivil (id_estadoCivil, nombreEstadoCivil) VALUES (3, 'Divorciado(a)');
INSERT INTO EstadoCivil (id_estadoCivil, nombreEstadoCivil) VALUES (4, 'Viudo(a)');
INSERT INTO EstadoCivil (id_estadoCivil, nombreEstadoCivil) VALUES (5, 'Acompañado(a)');
INSERT INTO EstadoCivil (id_estadoCivil, nombreEstadoCivil) VALUES (6, 'Unión Estable(a)');
INSERT INTO EstadoCivil (id_estadoCivil, nombreEstadoCivil) VALUES (7, 'No aplica');


/********************************************************************************
        INSERT DE TABLA TIPODOCUMENTO
********************************************************************************/
INSERT INTO TipoDocumento(id_tipoDocumento, nombreTipoDocumento) VALUES(1, 'Documento Único Identidad');
INSERT INTO TipoDocumento(id_tipoDocumento, nombreTipoDocumento) VALUES(2, 'Pasaporte');
INSERT INTO TipoDocumento(id_tipoDocumento, nombreTipoDocumento) VALUES(3, 'Carné Trabajo');
INSERT INTO TipoDocumento(id_tipoDocumento, nombreTipoDocumento) VALUES(6, 'Otros');
INSERT INTO TipoDocumento(id_tipoDocumento, nombreTipoDocumento) VALUES(4, 'Carné de Residencia');
INSERT INTO TipoDocumento(id_tipoDocumento, nombreTipoDocumento) VALUES(7, 'Ninguno', 'NA');
INSERT INTO TipoDocumento(id_tipoDocumento, nombreTipoDocumento) VALUES(5, 'Número de Identificación Tributaria');

/********************************************************************************
        INSERT DE TABLA DEPARTAMENTO
********************************************************************************/
INSERT INTO Departamento(id_departamento, nombreDepartamento) VALUES(1, 'Ahuachapán');
INSERT INTO Departamento(id_departamento, nombreDepartamento) VALUES(2, 'Santa Ana');
INSERT INTO Departamento(id_departamento, nombreDepartamento) VALUES(3, 'Sonsonate');
INSERT INTO Departamento(id_departamento, nombreDepartamento) VALUES(5, 'La Libertad');
INSERT INTO Departamento(id_departamento, nombreDepartamento) VALUES(4, 'Chalatenango');
INSERT INTO Departamento(id_departamento, nombreDepartamento) VALUES(6, 'San Salvador');
INSERT INTO Departamento(id_departamento, nombreDepartamento) VALUES(7, 'Cuscatlan');
INSERT INTO Departamento(id_departamento, nombreDepartamento) VALUES(9, 'Cabañas');
INSERT INTO Departamento(id_departamento, nombreDepartamento) VALUES(8, 'La Paz');
INSERT INTO Departamento(id_departamento, nombreDepartamento) VALUES(11, 'Usulután');
INSERT INTO Departamento(id_departamento, nombreDepartamento) VALUES(10, 'San Vicente');
INSERT INTO Departamento(id_departamento, nombreDepartamento) VALUES(12, 'San Miguel');
INSERT INTO Departamento(id_departamento, nombreDepartamento) VALUES(13, 'Morazan');
INSERT INTO Departamento(id_departamento, nombreDepartamento) VALUES(14, 'La Unión');

/********************************************************************************
        INSERT DE TABLA MUNICIPIO
********************************************************************************/
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(2, 'Apaneca', 1);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(1, 'Ahuachapán', 1);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(3, 'Atiquizaya', 1);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(4, 'Concepción de Ataco', 1);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(5, 'El Refugio', 1);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(6, 'Guaymango', 1);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(7, 'Jujutla', 1);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(8, 'San Francisco Menéndez', 1);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(9, 'San Lorenzo', 1);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(10, 'San Pedro Puxtla', 1);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(11, 'Tacuba', 1);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(12, 'Turin', 1);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(13, 'Candelaria de La Frontera', 2);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(14, 'Coatepeque', 2);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(15, 'Chalchuapa', 2);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(16, 'El Congo', 2);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(17, 'El Porvenir', 2);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(18, 'Masahuat', 2);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(19, 'Metapán', 2);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(20, 'San Antonio Pajonal', 2);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(21, 'San Sebastiánlitrillo', 2);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(22, 'Santa Ana', 2);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(23, 'Santa Rosa Guachipilin', 2);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(24, 'Santiago de La Frontera', 2);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(25, 'Texistepeque', 2);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(26, 'Acajutla', 3);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(27, 'Armenia', 3);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(28, 'Caluco', 3);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(29, 'Cuisnahuat', 3);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(30, 'Santa Isabel Ishuatán', 3);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(31, 'Izalco', 3);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(32, 'Juayua', 3);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(33, 'Nahuizalco', 3);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(34, 'Nahuilingo', 3);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(35, 'Salcoatitán', 3);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(36, 'San Antonio del Monte', 3);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(37, 'San Julián', 3);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(38, 'Santa Catarina Masahuat', 3);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(39, 'Santo Domingo de Guzmán', 3);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(40, 'Sonsonate', 3);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(41, 'Sonzacate', 3);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(42, 'Agua Caliente', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(43, 'Arcatao', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(44, 'Azacualpa', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(45, 'Citalá', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(46, 'Comalapa', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(47, 'Concepción Quezaltepeque', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(48, 'Chalatenango', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(49, 'Dulce Nombre de María', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(50, 'El Carrizal', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(51, 'El Paraiso', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(52, 'La Laguna', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(53, 'La Palma', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(54, 'La Reina', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(55, 'Las Vueltas', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(56, 'Nombre de Jesús', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(57, 'Nueva Concepción', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(58, 'Nueva Trinidad', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(59, 'Ojos de Agua', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(60, 'Potonico', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(61, 'San Antonio de La Cruz', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(62, 'San Antonio Los Ranchos', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(63, 'San Fernando', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(64, 'San Francisco Lempa', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(65, 'San Francisco Morazán', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(66, 'San Ignacio', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(67, 'San Isidro Labrador', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(68, 'Cancasque', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(69, 'Las Flores', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(70, 'San Luis del Carmen', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(71, 'San Miguel de Mercedes', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(72, 'San Rafael', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(73, 'Santa Rita', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(74, 'Tejutla', 4);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(75, 'Antiguo Cuscatlán', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(76, 'Ciudad Arce', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(77, 'Colón', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(78, 'Comasagua', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(79, 'Chiltiupán', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(80, 'Huizúcar', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(81, 'Jayaque', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(82, 'Jicalapa', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(83, 'Labertad', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(84, 'Nuevo Cuscatlán', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(85, 'Santa Tecla', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(86, 'Quezaltepeque', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(87, 'Sacacoyo', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(88, 'San José Villanueva', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(89, 'San Juan Opico', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(90, 'San Matías', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(91, 'San Pablo Tacachico', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(92, 'Tamanique', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(93, 'Talnique', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(94, 'Teotepeque', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(95, 'Tepecoyo', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(96, 'Zaragoza', 5);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(97, 'Aguilares', 6);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(98, 'Apopa', 6);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(99, 'Ayutuxtepeque', 6);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(100, 'Cuscatancingo', 6);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(101, 'El Paisnal', 6);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(102, 'Guazapa', 6);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(103, 'Ilopango', 6);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(104, 'Mejicanos', 6);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(105, 'Nejapa', 6);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(106, 'Panchimalco', 6);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(107, 'Rosario de Mora', 6);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(108, 'San Marcos', 6);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(109, 'San Martín', 6);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(110, 'San Salvador', 6);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(111, 'Santiago Texacuangos', 6);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(112, 'Santo Tomás', 6);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(113, 'Soyapango', 6);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(114, 'Tonacatepeque', 6);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(115, 'Delgado', 6);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(116, 'Candelaria', 7);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(117, 'Cojutepeque', 7);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(118, 'El Carmen', 7);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(119, 'El Rosario', 7);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(120, 'Monte San Juan', 7);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(121, 'Oratorio de Concepción', 7);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(122, 'San Bartolome Perulapía', 7);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(123, 'San Cristóbal', 7);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(124, 'San José Guayabal', 7);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(125, 'San Pedro Perulapán', 7);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(126, 'San Rafael Cedros', 7);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(127, 'San Ramón', 7);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(128, 'Santa Cruz Analquito', 7);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(253, 'Lislique', 14);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(129, 'Santa Cruz Michapa', 7);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(130, 'Suchitoto', 7);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(131, 'Tenancíngo', 7);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(132, 'Cuyultitán', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(133, 'El Rosario', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(134, 'Jerusalén', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(135, 'Mercedes de La Ceiba', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(136, 'Olocuilta', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(137, 'Paraíso de Osorio', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(138, 'San Antonio Masahuat', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(139, 'San Emigdio', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(140, 'San Francisco Chinaméca', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(141, 'San Juan Nonualco', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(142, 'San Juan Talpa', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(143, 'San Juan Tepezontes', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(144, 'San Luis Talpa', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(145, 'San Miguel Tepezontes', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(146, 'San Pedro Masahuat', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(147, 'San Pedro Nonualco', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(148, 'San Rafael Obrajuelo', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(149, 'Santa María Ostuma', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(150, 'Santiago Nonualco', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(151, 'Tapalhuaca', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(152, 'Zacatecolúca', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(153, 'San Luis de La Herradura', 8);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(154, 'Cinquera', 9);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(155, 'Guacotecti', 9);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(156, 'Ilobásco', 9);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(157, 'Jutiapa', 9);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(158, 'San Isidro', 9);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(159, 'Sensuntepeque', 9);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(160, 'Tejutepeque', 9);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(161, 'Victoria', 9);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(162, 'Dolores', 9);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(163, 'Apastepeque', 10);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(164, 'Guadalupe', 10);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(165, 'San Cayetano Istepeque', 10);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(166, 'Santa Clara', 10);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(167, 'Santo Domingo', 10);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(168, 'San Esteban Catarina', 10);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(169, 'San Ildefonso', 10);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(170, 'San Lorenzo', 10);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(171, 'San Sebastián', 10);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(172, 'San Vicente', 10);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(173, 'Tecoluca', 10);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(174, 'Tepetitán', 10);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(175, 'Verapaz', 10);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(176, 'Alegría', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(177, 'Berlín', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(178, 'California', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(179, 'Concepción Batres', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(180, 'El Triunfo', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(181, 'Ereguayquín', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(182, 'Estanzuelas', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(183, 'Jiquilisco', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(184, 'Jucuapa', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(185, 'Jucuarán', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(186, 'Mercedes Umana', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(187, 'Nueva Granada', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(188, 'Ozatlán', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(189, 'Puerto El Triunfo', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(190, 'San Agustín', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(191, 'San Buenaventura', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(192, 'San Dionisio', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(193, 'Santa Elena', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(194, 'San Francisco Javier', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(195, 'Santa María', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(196, 'Santiago de María', 11);
INSERT INTO Municipio (id_municipio, nombreMunicipio, id_departamento) VALUES(197, 'Tecapán', 11);

/********************************************************************************
        INSERT DE TABLA TIPODESCUENTO
********************************************************************************/
INSERT INTO TipoDescuento (id_tipoDescuento, nombreTipoDesc), VALUES(1, 'AFP');
INSERT INTO TipoDescuento (id_tipoDescuento, nombreTipoDesc), VALUES(2, 'ISSS');
INSERT INTO TipoDescuento (id_tipoDescuento, nombreTipoDesc), VALUES(3, 'Renta');
INSERT INTO TipoDescuento (id_tipoDescuento, nombreTipoDesc), VALUES(4, 'Prestamo');
INSERT INTO TipoDescuento (id_tipoDescuento, nombreTipoDesc), VALUES(5, 'Llegada Tardía');
INSERT INTO TipoDescuento (id_tipoDescuento, nombreTipoDesc), VALUES(6, 'Inasistencia');