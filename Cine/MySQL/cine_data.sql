use cine;

insert into cliente(nombre, email, telefono) values
('Daniela Paredes', 'dparedes@yopmail.com', '0991111111'),
('Sebastian Ortiz', 'sortiz@yopmail.com', '0982222222'),
('Gabriela Naranjo', 'gnaranjo@yopmail.com', '0973333333'),
('Javier Cedeno', 'jcedeno@yopmail.com', '0964444444'),
('Paola Villacis', 'pvillacis@yopmail.com', '0955555555');

insert into pelicula(titulo, genero, duracion_min, clasificacion) values
('Oppenheimer', 'Drama', 180, '12+'),
('Intensamente 2', 'Animacion', 96, 'Todo publico'),
('Deadpool y Wolverine', 'Accion', 128, '15+'),
('Mi Villano Favorito 4', 'Comedia', 94, 'Todo publico'),
('Terrifier 3', 'Terror', 125, '18+');

insert into funcion(fecha_hora, sala, tipo, precio, asientos_disponibles, id_pelicula) values
('2026-10-20 19:00:00', 'Sala 1', '2D', 4.50, 38, 1),
('2026-10-22 16:00:00', 'Sala 2', '3D', 6.00, 27, 2),
('2026-10-25 20:30:00', 'Sala 1', '2D', 4.50, 38, 3),
('2026-11-05 18:00:00', 'Sala 3', '3D', 6.50, 21, 4),
('2026-11-07 21:00:00', 'Sala 3', '2D', 5.00, 20, 5);

insert into boleto(cantidad, total, estado, fecha, id_cliente, id_funcion) values
(2, 9.00, 'Vendido', '2026-10-19 10:00:00', 1, 1),
(3, 18.00, 'Vendido', '2026-10-21 12:30:00', 2, 2),
(2, 9.00, 'Vendido', '2026-10-24 15:00:00', 3, 3),
(4, 26.00, 'Vendido', '2026-10-27 09:15:00', 4, 4),
(1, 5.00, 'Anulado', '2026-10-28 08:00:00', 5, 5);
