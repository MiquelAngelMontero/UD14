CREATE DATABASE gran_almacen;
USE gran_almacen;
CREATE TABLE productos (
	codigo int not null,
    nombre nvarchar(100),
    precio int,
    primary key (codigo)
);

CREATE TABLE cajeros (
	codigo int not null,
    nomApels nvarchar(255),
    primary key (codigo)
);

CREATE TABLE maquinas_registradoras (
	codigo int not null,
    piso int,
    primary key (codigo)
);

CREATE TABLE venta (
	cajero int not null,
    maquina int not null,
    producto int not null,
    primary key (cajero),
    constraint cajero
		foreign key (cajero)
        references gran_almacen.cajeros (codigo)
        on update cascade 
        on delete no action,
	constraint maquina
		foreign key (maquina)
        references gran_almacen.maquinas_registradoras (codigo)
        on update cascade
        on delete no action,
	constraint producto
		foreign key (producto)
        references gran_almacen.productos (codigo)
        on update cascade
        on delete no action
);