CREATE DATABASE directores;
CREATE TABLE despachos (
	numero int not null,
    capacidad int,
    primary key (numero)
);

CREATE TABLE director (
	dni varchar(9) not null,
    nomApels nvarchar(255),
    dniJefe varchar(9) not null,
    despacho int not null,
    primary key (dni),
    constraint despacho
		foreign key (despacho)
        references directores.despachos (numero)
        on update cascade
        on delete no action,
	constraint dniJ
		foreign key (dniJefe)
        references directores.director (dni)
        on update cascade
        on delete no action);