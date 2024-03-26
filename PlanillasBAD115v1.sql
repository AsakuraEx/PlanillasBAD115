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
