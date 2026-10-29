use restaurante;

insert into cliente(nombre, email, telefono) values
('Carolina Espinoza', 'cespinoza@yopmail.com', '0991111111'),
('Fernando Zambrano', 'fzambrano@yopmail.com', '0982222222'),
('Monica Velasco', 'mvelasco@yopmail.com', '0973333333'),
('Ricardo Mena', 'rmena@yopmail.com', '0964444444'),
('Tatiana Aguirre', 'taguirre@yopmail.com', '0955555555');

insert into plato(nombre, categoria, precio, porciones) values
('Ceviche de camaron', 'Entrada', 6.50, 18),
('Encebollado', 'Plato fuerte', 4.00, 12),
('Seco de pollo', 'Plato fuerte', 5.50, 10),
('Tres leches', 'Postre', 3.00, 6),
('Jugo de naranjilla', 'Bebida', 1.50, 27);

insert into pedido(cantidad, total, mesa, estado, fecha, id_cliente, id_plato) values
(2, 13.00, 3, 'Servido', '2026-10-24 13:00:00', 1, 1),
(3, 12.00, 1, 'Servido', '2026-10-25 12:30:00', 2, 2),
(2, 11.00, 5, 'Servido', '2026-10-26 19:45:00', 3, 3),
(4, 12.00, 2, 'Servido', '2026-10-27 20:15:00', 4, 4),
(3, 4.50, 4, 'Pendiente', '2026-10-28 12:00:00', 5, 5);

insert into pago(monto, metodo, estado, fecha, id_pedido) values
(13.00, 'Efectivo', 'Pagado', '2026-10-24 14:00:00', 1),
(12.00, 'Tarjeta', 'Pagado', '2026-10-25 13:30:00', 2),
(11.00, 'Transferencia', 'Pagado', '2026-10-26 20:45:00', 3),
(12.00, 'Efectivo', 'Pendiente', '2026-10-27 21:15:00', 4),
(4.50, 'Tarjeta', 'Pendiente', '2026-10-28 12:30:00', 5);
