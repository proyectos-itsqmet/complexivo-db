create view vw_inscripciones_detalle as
select i.id_inscripcion, c.nombre as cliente, cl.nombre as clase,
	e.nombre as entrenador, i.fecha, i.estado
from inscripcion i
join cliente c on c.id_cliente = i.id_cliente
join clase cl on cl.id_clase = i.id_clase
join entrenador e on e.id_entrenador = cl.id_entrenador;

create view vw_ocupacion_clases as
select cl.id_clase, cl.nombre as clase, cl.cupo_maximo,
	count(i.id_inscripcion) as incritos, 
    cl.cupo_maximo - count(i.id_inscripcion) as cupos_libres
from clase cl
left join inscripcion i on i.id_clase = cl.id_clase and i.estado = 'ACTIVA'
group by cl.id_clase, cl.nombre, cl.cupo_maximo;

create view vw_total_pagado_cliente as
select c.nombre as cliente, count(p.id_pago) as pagos, sum(p.monto) as total_pagado
from cliente c
join membresia m on m.id_cliente = c.id_cliente
join pago p on p.id_membresia = m.id_membresia
group by c.id_cliente, c.nombre;

create view vw_membresias_activas as 
select id_membresia, id_cliente, tipo, fecha_inicio, fecha_fin
from membresia
where estado = 'ACTIVA';

create view vw_entrenadores_activos as
select id_entrenador, nombre, especialidad
from entrenador 
where activo = true;

select * from vw_ocupacion_clases;