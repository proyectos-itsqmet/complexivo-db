create database gimnasio_db;

use gimnasio_db;

create table cliente(
id_cliente int primary key auto_increment,
cedula varchar(10) not null unique,
nombre varchar(80) not null,
email varchar(100) not null unique,
fecha_registro date not null default(current_date())
);

create table entrenador(
id_entrenador int primary key auto_increment,
nombre varchar(80) not null,
especialidad enum('CARDIO', 'FUERZA', 'YOGA', 'CROSSFIT') not null,
activo boolean not null default true
);

create table clase(
id_clase int primary key auto_increment,
nombre varchar(80) not null,
id_entrenador int not null,
cupo_maximo int not null check(cupo_maximo between 1 and 30),
foreign key(id_entrenador) references entrenador(id_entrenador) on delete restrict
);

create table inscripcion(
id_inscripcion int primary key auto_increment,
id_cliente int not null,
id_clase int not null,
fecha date not null default(current_date()),
estado enum('ACTIVA', 'CANCELADA') not null default 'ACTIVA',
unique (id_cliente, id_clase),
foreign key(id_cliente) references cliente(id_cliente) on delete cascade,
foreign key(id_clase) references clase(id_clase) on delete restrict
);

create table membresia(
id_membresia int primary key auto_increment,
id_cliente int not null,
tipo enum('MENSUAL', 'TRIMESTRAL', 'ANUAL') not null,
fecha_inicio date not null default(current_date()),
fecha_fin date,
precio decimal(8,2),
estado enum('ACTIVA', 'PENDIENTE', 'VENCIDA') not null,
foreign key(id_cliente) references cliente(id_cliente) on delete cascade
);

create table pago(
id_pago int primary key auto_increment,
id_membresia int not null,
monto decimal(8, 2) not null check(monto > 0),
metodo enum('EFECTIVO', 'TARJETA', 'TRANSFERENCIA') not null,
fecha datetime not null default current_timestamp(),
foreign key(id_membresia) references membresia(id_membresia) on delete restrict
);

create table auditoria_inscripcion(
id_auditoria int primary key auto_increment,
id_inscripcion int not null,
estado_anterior varchar(20),
estado_nuevo varchar(20),
usuario varchar(100),
fecha datetime not null default current_timestamp() 
);

