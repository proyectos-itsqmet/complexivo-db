use restaurante;

create view vw_pedidos_detalle as
select p.id as id_pedido, p.cantidad, p.total, p.mesa, p.estado, p.fecha, c.nombre as cliente, pl.nombre as plato
from pedido p
inner join cliente c on p.id_cliente = c.id
inner join plato pl on p.id_plato = pl.id;

create view vw_pagos_detalle as
select g.id as id_pago, g.monto, g.metodo, g.estado, g.fecha, c.nombre as cliente, pl.nombre as plato
from pago g
inner join pedido p on g.id_pedido = p.id
inner join cliente c on p.id_cliente = c.id
inner join plato pl on p.id_plato = pl.id;

create view vw_ranking_platos as
select pl.id, pl.nombre as plato, coalesce(sum(p.cantidad), 0) as porciones_vendidas
from plato pl
left join pedido p on p.id_plato = pl.id and p.estado <> 'Cancelado'
group by pl.id, pl.nombre;

create view vw_platos_disponibles as
select id, nombre, categoria, precio
from plato
where porciones > 0;

create view vw_pagos_pendientes as
select id, monto, metodo, fecha, id_pedido
from pago
where estado = 'Pendiente';
