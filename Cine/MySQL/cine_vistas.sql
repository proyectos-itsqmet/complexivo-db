use cine;

create view vw_boletos_detalle as
select b.id as id_boleto, b.cantidad, b.total, b.estado, b.fecha, c.nombre as cliente, p.titulo as pelicula, f.fecha_hora, f.sala
from boleto b
inner join cliente c on b.id_cliente = c.id
inner join funcion f on b.id_funcion = f.id
inner join pelicula p on f.id_pelicula = p.id;

create view vw_funciones_detalle as
select f.id as id_funcion, f.fecha_hora, f.sala, f.tipo, f.precio, f.asientos_disponibles, p.titulo as pelicula, p.clasificacion
from funcion f
inner join pelicula p on f.id_pelicula = p.id;

create view vw_ranking_peliculas as
select p.id, p.titulo as pelicula, coalesce(sum(b.cantidad), 0) as boletos_vendidos
from pelicula p
left join funcion f on f.id_pelicula = p.id
left join boleto b on b.id_funcion = f.id and b.estado = 'Vendido'
group by p.id, p.titulo;

create view vw_funciones_con_asientos as
select id, fecha_hora, sala, precio, asientos_disponibles
from funcion
where asientos_disponibles > 0;

create view vw_boletos_anulados as
select id, cantidad, total, fecha, id_cliente, id_funcion
from boleto
where estado = 'Anulado';
