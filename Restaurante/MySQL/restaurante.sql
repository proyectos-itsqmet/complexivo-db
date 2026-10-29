create database restaurante;

use restaurante;

create table cliente(
	id int auto_increment primary key,
    nombre varchar(100) not null,
    email varchar(100) not null,
    telefono varchar(10) not null
);

create table plato(
	id int auto_increment primary key,
    nombre varchar(100) not null,
    categoria enum('Entrada', 'Plato fuerte', 'Postre', 'Bebida') not null,
    precio decimal(10, 2) not null check(precio > 0),
    porciones int not null check(porciones >= 0)
);

create table pedido(
	id int auto_increment primary key,
    cantidad int not null check(cantidad > 0),
    total decimal(10, 2) not null,
    mesa int not null,
    estado enum('Pendiente', 'Servido', 'Cancelado') not null default 'Pendiente',
    fecha datetime not null default current_timestamp,
    id_cliente int not null,
    id_plato int not null,
    foreign key(id_cliente) references cliente(id),
    foreign key(id_plato) references plato(id)
);

create table pago(
	id int auto_increment primary key,
    monto decimal(10, 2) not null check(monto > 0),
    metodo enum('Efectivo', 'Tarjeta', 'Transferencia') not null,
    estado enum('Pendiente', 'Pagado') not null default 'Pendiente',
    fecha datetime not null default current_timestamp,
    id_pedido int not null,
    foreign key(id_pedido) references pedido(id)
);
