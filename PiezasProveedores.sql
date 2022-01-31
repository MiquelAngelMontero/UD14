CREATE DATABASE piezasProv;
CREATE TABLE piezas (
	codigo int not null,
    nombre nvarchar(100),
    primary key (codigo)
);
    
CREATE TABLE proveedores (
	id char(4) not null,
    nombre nvarchar(100),
    primary key (id)
);

CREATE TABLE suministra (
	codigoPieza int not null,
    idProveedor char(4) not null primary key,
    precio int,
    constraint codP
		foreign key (codigoPieza)
        references piezasProv.piezas (codigo)
        on update cascade 
        on delete no action,
	constraint idProv
		foreign key (idProveedor)
        references piezasProv.proveedores (id)
        on update cascade
        on delete no action
);