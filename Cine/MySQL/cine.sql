create database cine;

use cine;

create table cliente(
	id int auto_increment primary key,
    nombre varchar(100) not null,
    email varchar(100) not null,
    telefono varchar(10) not null
);

create table pelicula(
	id int auto_increment primary key,
    titulo varchar(150) not null,
    genero enum('Accion', 'Comedia', 'Drama', 'Terror', 'Animacion') not null,
    duracion_min int not null check(duracion_min > 0),
    clasificacion enum('Todo publico', '12+', '15+', '18+') not null
);

create table funcion(
	id int auto_increment primary key,
    fecha_hora datetime not null,
    sala varchar(10) not null,
    tipo enum('2D', '3D') not null,
    precio decimal(10, 2) not null check(precio > 0),
    asientos_disponibles int not null check(asientos_disponibles >= 0),
    id_pelicula int not null,
    foreign key(id_pelicula) references pelicula(id)
);

create table boleto(
	id int auto_increment primary key,
    cantidad int not null check(cantidad > 0),
    total decimal(10, 2) not null,
    estado enum('Vendido', 'Anulado') not null default 'Vendido',
    fecha datetime not null default current_timestamp,
    id_cliente int not null,
    id_funcion int not null,
    foreign key(id_cliente) references cliente(id),
    foreign key(id_funcion) references funcion(id)
);
