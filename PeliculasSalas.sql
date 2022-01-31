CREATE DATABASE `PeliculasSalas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
CREATE TABLE peliculas (
codigo int not null,
nombre nvarchar(100),
calificacionEdad int,
primary key (codigo));

CREATE TABLE salas (
codigo int not null,
nombre nvarchar(100),
pelicula int not null,
primary key (codigo),
constraint id_pel
foreign key (pelicula)
references PeliculasSalas.peliculas (codigo)
on delete no action
on update cascade);

