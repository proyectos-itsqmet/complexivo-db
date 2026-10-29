insert into socio(cedula, nombre, email) values
('1712345678', 'Ana Torres', 'ana@gmail.com'),
('1723456789', 'Luis Perez', 'luis@gmail.com'),
('1734567890', 'Maria Gomez', 'maria@gmail.com'),
('1745678901', 'Carlos Ruiz', 'carlos@gmail.com'),
('1756789012', 'Sofia Mena', 'sofia@gmail.com');

insert into autor(nombre, nacionalidad) values
('Gabriel Garcia Marquez', 'Colombia'),
('Jorfe Icaza', 'Ecuador'),
('Stephen Hawking', 'Reino Unido'),
('Isabel Allende', 'Chile'),
('Yuval Noah Harati', 'Israel');

insert into libro(titulo, isbn, anio, stock, genero) values
('Cien años de soledad', '9870307474728', 1967, 3, 'NOVELA'),
('Huasipungo', '9870307474721', 1934, 2, 'NOVELA'),
('Breve historia del tiempo', '9870307474722', 1988, 1, 'CIENCIA'),
('La casa de los espiritus', '9870307474723', 1982, 2, 'NOVELA'),
('Sapiens', '9870307474724', 2011, 4, 'HISTORIA');

insert into libro_autor(id_libro, id_autor) values
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

insert into prestamo(id_socio, id_libro, fecha_prestamo, fecha_devolucion, estado) values
(1, 1, '2026-10-01', '2026-10-10', 'DEVUELTO'),
(2, 3, '2026-10-05', null, 'ATRASADO'),
(3, 5, '2026-10-20', null, 'ACTIVO'),
(1, 2, '2026-09-15', '2026-10-02', 'DEVUELTO'),
(4, 4, '2026-10-01', null, 'ATRASADO');

insert into multa(id_prestamo, monto, pagada) values
(2, 2.50, false),
(5, 3.00, false),
(4, 1.50, true),
(2, 2.00, false),
(5, 0.75, true);

drop database if exists biblioteca_1;

