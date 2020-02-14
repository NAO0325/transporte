/*
Created		11/02/2020
Modified		11/02/2020
Project		transporte
Model			
Company		
Author		Npoleon Avila
Version		1.0
Database		PostgreSQL 9.4
*/


/* Create Domains */


/* Create Tables */


Create table Pais
(
	idpais Serial NOT NULL,
	nombre Varchar NOT NULL,
 primary key (idpais)
) Without Oids;


Create table Departamento
(
	iddepartamento Serial NOT NULL,
	idpais Integer NOT NULL,
	nombre Varchar NOT NULL,
 primary key (iddepartamento)
) Without Oids;


Create table Ciudad
(
	idciudad Serial NOT NULL,
	iddepartamento Integer NOT NULL,
	nombre Varchar NOT NULL,
 primary key (idciudad)
) Without Oids;


Create table Persona
(
	idpersona BigSerial NOT NULL,
	idpais Integer NOT NULL,
	idciudad Integer NOT NULL,
	nombres Varchar NOT NULL,
	apellidos Varchar NOT NULL,
	tipodocumento Varchar Check (tipodocumento IN ('CEDULA','CED. EXTRANGERIA','PASAPORTE')),
	numdocumento Numeric(20,0) NOT NULL UNIQUE,
	num_telefono Numeric(15,0),
	direccion Text,
 primary key (idpersona)
) Without Oids;


Create table Empresa
(
	idempresa BigSerial NOT NULL,
	idciudad Integer NOT NULL,
	idpersona_representante Bigint NOT NULL,
	nombre Varchar NOT NULL,
	tipodocumento Varchar Check (tipodocumento IN ('NIT','RUT')),
	numdocumento_nit Varchar NOT NULL UNIQUE,
	direccion Text,
	telefono Numeric(13,0),
 primary key (idempresa)
) Without Oids;


Create table Conductor
(
	idconductor BigSerial NOT NULL,
	idpersona Bigint NOT NULL,
	num_licencia Varchar NOT NULL UNIQUE,
 primary key (idconductor)
) Without Oids;


Create table Vehiculo
(
	idvehiculo BigSerial NOT NULL,
	placa Varchar NOT NULL UNIQUE,
	motor Varchar NOT NULL,
	chasis Varchar NOT NULL,
	modelo Integer NOT NULL,
	marca Char(20) NOT NULL,
	cantidad_puertas Integer NOT NULL,
	fecha_matricula Date,
	num_pasa_sentados Integer,
	num_pasa_pie Integer,
	peso_seco Double precision,
	peso_bruto Double precision,
	linea Varchar,
 primary key (idvehiculo)
) Without Oids;


Create table Vehiculo_Has_Conductor
(
	idvc Varchar NOT NULL,
	idvehiculo Bigint NOT NULL,
	idconductor Bigint NOT NULL,
 primary key (idvc)
) Without Oids;


Create table Empresa_Has_Vehiculo
(
	idev Varchar NOT NULL,
	idempresa Bigint NOT NULL,
	idvehiculo Bigint NOT NULL,
 primary key (idev)
) Without Oids;


/* Create Tab 'Others' for Selected Tables */
--===========================================================================
-- PROCEDIMIENTO, CREA LLAVE PRIMARIA EN Vehiculo_Has_Conductor
---===========================================================================
CREATE OR REPLACE FUNCTION crea_primary_Vehiculo_Has_Conductor() RETURNS TRIGGER AS $$
BEGIN
	NEW.idvc:=NEW.idvehiculo||'_'||NEW.idconductor;--Concatenado
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;
--===========================================================================
-- TRIGGER PARA CREAR LLAVE PRIMARIA EN Vehiculo_Has_Conductor
--===========================================================================
CREATE TRIGGER tgr_crea_primary_Vehiculo_Has_Conductor BEFORE INSERT OR UPDATE
    ON Vehiculo_Has_Conductor FOR EACH ROW 
EXECUTE PROCEDURE crea_primary_Vehiculo_Has_Conductor();
--===========================================================================
-- PROCEDIMIENTO, CREA LLAVE PRIMARIA EN Empresa_Has_Vehiculo
---===========================================================================
CREATE OR REPLACE FUNCTION crea_primary_Empresa_Has_Vehiculo() RETURNS TRIGGER AS $$
BEGIN
	NEW.idev:=NEW.idempresa||'_'||NEW.idvehiculo;--Concatenado
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;
--===========================================================================
-- TRIGGER PARA CREAR LLAVE PRIMARIA EN Empresa_Has_Vehiculo
--===========================================================================
CREATE TRIGGER tgr_crea_primary_Empresa_Has_Vehiculo BEFORE INSERT OR UPDATE
    ON Empresa_Has_Vehiculo FOR EACH ROW 
EXECUTE PROCEDURE crea_primary_Empresa_Has_Vehiculo();

/* Create Indexes */


/* Create Foreign Keys */

Alter table Departamento add  foreign key (idpais) references Pais (idpais) on update restrict on delete restrict;

Alter table Persona add  foreign key (idpais) references Pais (idpais) on update restrict on delete restrict;

Alter table Ciudad add  foreign key (iddepartamento) references Departamento (iddepartamento) on update restrict on delete restrict;

Alter table Persona add  foreign key (idciudad) references Ciudad (idciudad) on update restrict on delete restrict;

Alter table Empresa add  foreign key (idciudad) references Ciudad (idciudad) on update restrict on delete restrict;

Alter table Empresa add  foreign key (idpersona_representante) references Persona (idpersona) on update restrict on delete restrict;

Alter table Conductor add  foreign key (idpersona) references Persona (idpersona) on update restrict on delete restrict;

Alter table Empresa_Has_Vehiculo add  foreign key (idempresa) references Empresa (idempresa) on update restrict on delete restrict;

Alter table Vehiculo_Has_Conductor add  foreign key (idconductor) references Conductor (idconductor) on update restrict on delete restrict;

Alter table Vehiculo_Has_Conductor add  foreign key (idvehiculo) references Vehiculo (idvehiculo) on update restrict on delete restrict;

Alter table Empresa_Has_Vehiculo add  foreign key (idvehiculo) references Vehiculo (idvehiculo) on update restrict on delete restrict;


/* Create Procedures */


/* Create Views */


/* Create Referential Integrity Triggers */


/* Create User-Defined Triggers */


