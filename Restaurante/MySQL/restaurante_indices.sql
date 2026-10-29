use restaurante;

create index idx_plato_categoria on plato(categoria);
show index from plato;

create index idx_pedido_fecha on pedido(fecha);
show index from pedido;
