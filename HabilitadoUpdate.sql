alter table areaunidadorgani add habilitado char(1) default '1';
alter table depunidadorgani add habilitado char(1) default '1';
alter table descuento add habilitado char(1) default '1';
alter table documento add habilitado char(1) default '1';
alter table empleado add habilitado char(1) default '1';
alter table empresa add habilitado char(1) default '1';
alter table ingreso add habilitado char(1) default '1';
alter table profesion add habilitado char(1) default '1';
alter table puesto add habilitado char(1) default '1';
alter table seccionesunidadorgani add habilitado char(1) default '1';
alter table subseccionesunidadorgani add habilitado char(1) default '1';
alter table tipodescuento add habilitado char(1) default '1';
alter table tipodocumento add habilitado char(1) default '1';
alter table tipoingreso add habilitado char(1) default '1';
alter table unidadorganizativa add habilitado char(1) default '1';

alter table empleado drop column nit;
alter table empleado drop column numeroisss;
alter table empleado drop column nup;
alter table empleado drop column id_descuento;
alter table empleado drop column id_documento;

alter table empleado drop column nup;
alter table empleado add nup varchar2(17) not null;