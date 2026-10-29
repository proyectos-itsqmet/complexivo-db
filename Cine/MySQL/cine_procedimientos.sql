use cine;

delimiter //

create procedure sp_vender_boleto(
    in p_id_cliente int,
    in p_id_funcion int,
    in p_cantidad int
)
begin
    declare v_fecha datetime;

    select fecha_hora into v_fecha
    from funcion
    where id = p_id_funcion;

    if v_fecha is null then
        signal sqlstate '45000'
        set message_text = 'La funcion no existe';
    elseif v_fecha < now() then
        signal sqlstate '45000'
        set message_text = 'No se puede vender boletos de una funcion pasada';
    end if;

    insert into boleto(cantidad, id_cliente, id_funcion)
    values (p_cantidad, p_id_cliente, p_id_funcion);

    select last_insert_id() as id_boleto_creado;
end //

create procedure sp_anular_boleto(
    in p_id_boleto int
)
begin
    declare v_estado varchar(20);

    select estado into v_estado
    from boleto
    where id = p_id_boleto;

    if v_estado is null then
        signal sqlstate '45000'
        set message_text = 'El boleto no existe';
    elseif v_estado = 'Anulado' then
        signal sqlstate '45000'
        set message_text = 'El boleto ya fue anulado';
    end if;

    update boleto
    set estado = 'Anulado'
    where id = p_id_boleto;
end //

create procedure sp_total_gastado_cliente(
    in p_id_cliente int,
    out p_total decimal(10, 2)
)
begin
    select coalesce(sum(total), 0) into p_total
    from boleto
    where id_cliente = p_id_cliente
      and estado = 'Vendido';
end //

create procedure sp_actualizar_precio_funcion(
    in p_id_funcion int,
    in p_precio decimal(10, 2)
)
begin
    if p_precio <= 0 then
        signal sqlstate '45000'
        set message_text = 'El precio debe ser mayor a cero';
    end if;

    update funcion
    set precio = p_precio
    where id = p_id_funcion;
end //

delimiter ;

call sp_vender_boleto(3, 5, 2);
call sp_vender_boleto(1, 1, 1);
select * from boleto;
select * from funcion where id = 5;

call sp_anular_boleto(7);
select * from boleto where id = 7;

call sp_total_gastado_cliente(2, @total);
select @total as total_gastado;

call sp_actualizar_precio_funcion(5, 5.50);
select * from funcion where id = 5;
