CREATE DATABASE cientificos;
USE cientificos;
CREATE TABLE cientifico (
	dni varchar(9) not null,
    nomApels nvarchar(255),
    primary key (dni)
);

CREATE TABLE proyecto (
	id char(4) not null,
    nombre nvarchar(255),
    horas int,
    primary key (id)
);

CREATE TABLE asignado_a (
	cientifico varchar(9) not null,
    proyecto char(4) not null,
    primary key (cientifico),
    constraint cient
		foreign key (cientifico)
        references cientificos.cientifico (dni)
        on update cascade
        on delete no action,
	constraint proy
		foreign key (proyecto)
		references cientificos.proyecto (id)
        on update cascade
        on delete no action
);
