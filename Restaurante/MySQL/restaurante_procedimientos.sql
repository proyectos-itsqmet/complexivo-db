use restaurante;

delimiter //

create procedure sp_registrar_pedido(
    in p_id_cliente int,
    in p_id_plato int,
    in p_cantidad int,
    in p_mesa int
)
begin
    if p_mesa <= 0 then
        signal sqlstate '45000'
        set message_text = 'El numero de mesa no es valido';
    end if;

    insert into pedido(cantidad, mesa, id_cliente, id_plato)
    values (p_cantidad, p_mesa, p_id_cliente, p_id_plato);

    select last_insert_id() as id_pedido_creado;
end //

create procedure sp_cancelar_pedido(
    in p_id_pedido int
)
begin
    declare v_estado varchar(20);

    select estado into v_estado
    from pedido
    where id = p_id_pedido;

    if v_estado is null then
        signal sqlstate '45000'
        set message_text = 'El pedido no existe';
    elseif v_estado = 'Cancelado' then
        signal sqlstate '45000'
        set message_text = 'El pedido ya fue cancelado';
    end if;

    update pedido
    set estado = 'Cancelado'
    where id = p_id_pedido;
end //

create procedure sp_total_consumo_cliente(
    in p_id_cliente int,
    out p_total decimal(10, 2)
)
begin
    select coalesce(sum(total), 0) into p_total
    from pedido
    where id_cliente = p_id_cliente
      and estado <> 'Cancelado';
end //

create procedure sp_registrar_pago(
    in p_id_pedido int,
    in p_metodo varchar(20)
)
begin
    declare v_estado varchar(20);
    declare v_total decimal(10, 2);

    select estado, total into v_estado, v_total
    from pedido
    where id = p_id_pedido;

    if v_estado is null then
        signal sqlstate '45000'
        set message_text = 'El pedido no existe';
    elseif v_estado = 'Cancelado' then
        signal sqlstate '45000'
        set message_text = 'No se puede pagar un pedido cancelado';
    end if;

    insert into pago(monto, metodo, estado, id_pedido)
    values (v_total, p_metodo, 'Pagado', p_id_pedido);
end //

delimiter ;

call sp_registrar_pedido(2, 3, 1, 7);
call sp_registrar_pedido(2, 3, 1, 0);
select * from pedido;
select * from plato where id = 3;

call sp_registrar_pago(7, 'Efectivo');
select * from pago;

call sp_registrar_pedido(2, 3, 1, 8);
call sp_cancelar_pedido(8);
select * from pedido where id = 8;
call sp_registrar_pago(8, 'Tarjeta');

call sp_total_consumo_cliente(2, @total);
select @total as total_consumo;
