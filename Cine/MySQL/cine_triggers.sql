use cine;

delimiter //

create trigger trg_validar_asientos_boleto
before insert on boleto
for each row
begin
    declare v_asientos int;

    select asientos_disponibles into v_asientos
    from funcion
    where id = new.id_funcion;

    if v_asientos < new.cantidad then
        signal sqlstate '45000'
        set message_text = 'La funcion no tiene asientos suficientes';
    end if;
end //

create trigger trg_calcular_total_boleto
before insert on boleto
for each row
begin
    set new.total = new.cantidad * (select precio from funcion where id = new.id_funcion);
end //

create trigger trg_descontar_asientos_boleto
after insert on boleto
for each row
begin
    update funcion
    set asientos_disponibles = asientos_disponibles - new.cantidad
    where id = new.id_funcion;
end //

create trigger trg_devolver_asientos_boleto
after update on boleto
for each row
begin
    if new.estado = 'Anulado' and old.estado <> 'Anulado' then
        update funcion
        set asientos_disponibles = asientos_disponibles + new.cantidad
        where id = new.id_funcion;
    end if;
end //

delimiter ;

insert into boleto(cantidad, id_cliente, id_funcion)
values (2, 1, 5);
select * from boleto;
select * from funcion where id = 5;

update boleto set estado = 'Anulado' where id = 6;
select * from funcion where id = 5;

insert into boleto(cantidad, id_cliente, id_funcion)
values (50, 1, 5);
