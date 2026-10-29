delimiter //

create procedure sp_inscribir_cliente(in p_id_cliente int, in p_id_clase int)
begin 
	if not exists (select 1 from menbresia
					where id_cliente = p_id_cliente and estado = 'ACTIVA') then
		signal sqlstate '45000' set message_text = 'El cliente no tiene membresia activa';
	end if;
    
    insert into inscripcion (id_cliente, id_clase) values (p_id_cliente, p_id_clase);
end//

create procedure sp_cancelar_inscripcion(in p_id_inscripcion int)
begin 
	if not exists (select 1 from inscripcion where id_inscripcion = p_incsripcion) then
		signal sqlstate '45000' set message_text = 'La inscripcion no existe';
	end if;
    
    update inscripcion set estado = 'CANCELADA' where id_inscripcion = p_id_inscripcion;
end//

create procedure sp_registrar_pago(in p_id_membresia int, in p_monto decimal(8, 2),
									in p_metodo varchar(20))
begin 
	if not exists (select 1 from membresia where id_membresia = p_id_membresia) then
		signal sqlstate '45000' set message_text = 'La membresia no existe';
	end if;
    
    insert into pago(id_membresia, monto, metodo) values (p_id_membresia, p_monto, p_metodo);
end//

create procedure sp_reporte_ingresos(in p_desde date, in p_hasta date)
begin 
	select metodo, count(*) as pagos, sum(monto) as total
    from pago 
    where date(fecha) between p_desde and p_hasta
    group by metodo;
    end//
    
delimiter ;
    