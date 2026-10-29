insert into cliente(cedula, nombre, email) values
('1711111111', 'Andrea Vega', 'andrea@mail.com'),
('1711111112', 'Bruno Castro', 'bruno@mail.com'),
('1711111113', 'Camila Ortiz', 'camila@mail.com'),
('1711111114', 'Diego Paredes', 'diego@mail.com'),
('1711111115', 'Elena Rios', 'elena@mail.com');

insert into entrenador(nombre, especialidad) values
('Marco Silva', 'CARDIO'),
('Paola Leon', 'FUERZA'),
('Rosa Andrade', 'YOGA'),
('Ivan Mora', 'CROSSFIT'),
('Tomas Vera', 'FUERZA');

insert into clase(nombre, id_entrenador, cupo_maximo) values
('Spinning', 1, 20),
('Pesas', 2, 15),
('Yoga matutino', 3, 10),
('Crossfit', 4, 2),
('Funcional', 5, 25);

insert into inscripcion(id_cliente, id_clase) values
(1, 1), (2, 1), (3, 3), (4, 4), (5, 4);

insert into membresia(id_cliente, tipo, fecha_inicio, fecha_fin, precio, estado) values
(1, 'MENSUAL', '2026-10-01', '2026-11-01', 30, 'ACTIVA'),
(2, 'TRIMESTRAL', '2026-09-01', '2026-12-01', 80, 'ACTIVA'),
(3, 'ANUAL', '2026-01-15', '2027-11-15', 300, 'ACTIVA'),
(4, 'MENSUAL', '2026-08-01', '2026-09-01', 30, 'VENCIDA'),
(5, 'MENSUAL', '2026-10-20', '2026-11-20', 30, 'PENDIENTE');

insert into pago(id_membresia, monto, metodo) values
(1, 30, 'EFECTIVO'),
(2, 80, 'TARJETA'),
(3, 150, 'TRANSFERENCIA'),
(3, 150, 'TRANSFERENCIA'),
(4, 30, 'EFECTIVO');

drop database if exists gimnasio_db;