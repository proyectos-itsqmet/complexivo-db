create database biblioteca_1;

use biblioteca_1;

create table socio(
id_socio int primary key auto_increment,
cedula char(10) not null unique,
nombre varchar(80) not null,
email varchar(100) not null unique,
fecha_registro date not null default(current_date())
);

create table autor(
id_autor int primary key auto_increment,
nombre varchar(80) not null,
nacionalidad varchar(80)
);

create table libro(
id_libro int primary key auto_increment,
titulo varchar(150) not null,
isbn varchar(13) not null unique,
anio int check (anio between 1500 and 2100),
stock int not null default 1 check (stock >= 0),
genero enum('NOVELA', 'CIENCIA', 'HISTORIA', 'INFANTIL') not null
);

create table libro_autor(
id_libro int not null,
id_autor int not null,
primary key (id_libro, id_autor),
foreign key(id_libro) references autor(id_autor) on delete cascade,
foreign key(id_libro) references libro(id_libro) on delete cascade
);

create table prestamo(
id_prestamo int auto_increment primary key,
id_socio int not null,
id_libro int not null,
fecha_prestamo date not null default(current_date()),
fecha_devolucion date,
estado enum('ACTIVO', 'DEVUELTO', 'ATRASADO') not null default 'ACTIVO',
check(fecha_devolucion is null or fecha_devolucion >= fecha_prestamo),
foreign key(id_socio) references socio(id_socio) on delete restrict,
foreign key(id_libro) references libro(id_libro) on delete restrict
);

create table multa(
id_multa int auto_increment primary key,
id_prestamo int not null,
monto decimal(6,2) not null check(monto > 0),
pagada boolean not null default false,
foreign key(id_prestamo) references prestamo(id_prestamo) on delete cascade
);

show tables
