use restaurante;

delimiter //

create trigger trg_validar_porciones_pedido
before insert on pedido
for each row
begin
    declare v_porciones int;

    select porciones into v_porciones
    from plato
    where id = new.id_plato;

    if v_porciones < new.cantidad then
        signal sqlstate '45000'
        set message_text = 'El plato no tiene porciones suficientes';
    end if;
end //

create trigger trg_calcular_total_pedido
before insert on pedido
for each row
begin
    set new.total = new.cantidad * (select precio from plato where id = new.id_plato);
end //

create trigger trg_descontar_porciones_pedido
after insert on pedido
for each row
begin
    update plato
    set porciones = porciones - new.cantidad
    where id = new.id_plato;
end //

create trigger trg_devolver_porciones_pedido
after update on pedido
for each row
begin
    if new.estado = 'Cancelado' and old.estado <> 'Cancelado' then
        update plato
        set porciones = porciones + new.cantidad
        where id = new.id_plato;
    end if;
end //

delimiter ;

insert into pedido(cantidad, mesa, id_cliente, id_plato)
values (2, 6, 1, 5);
select * from pedido;
select * from plato where id = 5;

update pedido set estado = 'Cancelado' where id = 6;
select * from plato where id = 5;

insert into pedido(cantidad, mesa, id_cliente, id_plato)
values (50, 6, 1, 5);
