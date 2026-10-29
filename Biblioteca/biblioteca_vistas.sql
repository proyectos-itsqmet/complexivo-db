create view vw_prestamos_detalle as 
select p.id_prestamo, s.nombre as socio, l.titulo as libro,
	p.fecha_prestamo, p.fecha_devolucion, p.estado
from prestamo p
join socio s on s.id_socio = p.id_socio
join libro l on l.id_libro = p.id_libro;

create view vs_libros_autores as
select l.titulo, l.genero, a.nombre as autor, a.nacionalidad
from libro l
join libro_autor la on la.id_libro = l.id_libro
join autor a on a.id_autor = la.id_autor;

create view vw_multas_pendientes as 
select s.nombre as socio, count(m.id_multa) as cantidad, sum(m.monto) as total
from socio s
join prestamo p on p.id_socio = s.id_socio
join multa m on m.id_prestamo = p.id_prestamo
where m.pagada = false
group by s.id_socio, s.nombre;