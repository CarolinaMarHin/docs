create database vuelos; 
use vuelos; 
----------------------------------------------------------------------
create table aerolinea (
	id int auto_increment primary key, 
	nombre varchar(50) not null 
);
create table vuelo (
	noVuelo int auto_increment primary key, 
	duracion int not null, 
    fechaSalida datetime not null,
    fechaLlegada datetime not null,
    estado varchar(50) not null
);
create table avion (
	noAvion int auto_increment primary key, 
	capacidad int not null
);
create table pasajero (
	cedula int primary key, 
	nombre varchar(50) not null,
    apellidos varchar(50) not null,
    edad int not null,
    correo varchar(50)
);
create table listaPasajeros (
	idListaPasajeros int auto_increment primary key
);
create table pasaje (
	noPasaje int auto_increment primary key,
    noSilla varchar(5) not null,
    precio int not null,
    origen varchar(50) not null,
    destino varchar(50) not null
);
create table clasePasaje (
	id int auto_increment primary key,
    clase varchar(50) not null
);
alter table avion add constraint fk_aerolineaAvion foreign key (idAerolinea) references aerolinea (id) on delete cascade on update cascade;
alter table vuelo add constraint fk_aerolineaVuelo foreign key (idAerolinea) references vuelo (noVuelo) on delete cascade on update cascade;
alter table pasaje add constraint fk_pasajePasajeros foreign key (idPasajero) references pasajero (idPasajero) on delete cascade on update cascade;
alter table pasaje add constraint fk_clasePasaje foreign key (idClasePasaje) references pasaje (noPasaje) on delete cascade on update cascade;
alter table listaPasajeros add constraint fk_listaVuelos foreign key (idListaVuelos) references vuelo (noVuelo) on delete cascade on update cascade;
alter table listaPasajeros add constraint fk_listaPasajeros foreign key (idListaPasajeros) references pasajero (idPasajero) on delete cascade on update cascade;

ALTER TABLE `vuelos`.`vuelo` ;
ALTER TABLE `vuelos`.`vuelo` RENAME INDEX `fk_aerolineaVuelo` TO `fk_aerolineaVuelo_idx`;
ALTER TABLE `vuelos`.`vuelo` ALTER INDEX `fk_aerolineaVuelo_idx` VISIBLE;
ALTER TABLE `vuelos`.`pasaje` 
DROP FOREIGN KEY `fk_clasePasaje`;
ALTER TABLE `vuelos`.`pasaje` 
;
ALTER TABLE `vuelos`.`pasaje` RENAME INDEX `fk_clasePasaje` TO `fk_clasePasaje_idx`;
ALTER TABLE `vuelos`.`pasaje` ALTER INDEX `fk_clasePasaje_idx` VISIBLE;
ALTER TABLE `vuelos`.`pasaje` 
ADD CONSTRAINT `fk_clasePasaje`
  FOREIGN KEY (`idClasePasaje`)
  REFERENCES `vuelos`.`clasepasaje` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
ALTER TABLE `vuelos`.`vuelo` 
DROP FOREIGN KEY `fk_aerolineaVuelo`;
ALTER TABLE `vuelos`.`vuelo` 
ADD INDEX `fk_aerolineaVuelo_idx` (`idAerolinea` ASC) VISIBLE,
DROP INDEX `fk_aerolineaVuelo_idx` ;
;
ALTER TABLE `vuelos`.`vuelo` 
ADD CONSTRAINT `fk_aerolineaVuelo`
  FOREIGN KEY (`idAerolinea`)
  REFERENCES `vuelos`.`aerolinea` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
ALTER TABLE `vuelos`.`vuelo` 
ADD COLUMN `idAvion` INT(11) NOT NULL AFTER `idAerolinea`,
ADD INDEX `fk_avionVuelo_idx` (`idAvion` ASC) VISIBLE;
;
ALTER TABLE `vuelos`.`vuelo` 
ADD CONSTRAINT `fk_avionVuelo`
  FOREIGN KEY (`idAvion`)
  REFERENCES `vuelos`.`avion` (`noAvion`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;