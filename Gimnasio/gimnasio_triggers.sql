delimiter //

create trigger trg_validar_cupo
before insert on inscripcion
for each row
begin
	declare v_cupo int;
    declare v_inscritos int;
    
    select cupo_maximo into v_cupo from clase where id_clase = new.id_clase;
    select count(*) into v_inscritos from inscripcion
    where id_clase = new.id_clase and estado = 'ACTIVA';
    
    if v_inscritos >= v_cupo then
		signal sqlstate '45000' set message_text = 'La clase no tiene cupos disponibles';
	end if;
end//

create trigger trg_calcular_membresia
before insert on membresia
for each row
begin 
	if new.tipo = 'MENSUAL' then
		set new.fecha_fin = date_add(new.fecha_inicio, interval 1 month);
        set new.precio = 30;
	elseif new.tipo = 'TRIMESTRAL' then
		set new.fecha_fin = date_add(new.fecha_inicio, interval 3 month);
        set new.precio = 80;
	else 
		set new.fecha_fin = date_add(new.fecha_inicio, interval 1 year);
        set new.precio = 300;
	end if;
end//

create trigger trg_activar_membresia
after insert on pago
for each row 
begin 
	update membresia set estado = 'ACTIVA' where id_membresia = new.id_membresia;
end//

create trigger trg_auditar_inscripcion
after update on inscripcion
for each row
begin 
	if old.estado <> new.estado then 
		insert into auditoria_inscripcion(id_incripcion, estado_anterior, estado_nuevo, usuario)
        values(new.id_inscripcion, old.estado, new.estado, current_user());
	end if;
end//

delimiter ;

drop trigger if exists trg_validar_cupo;
drop trigger if exists trg_calcular_membresia;
drop trigger if exists trg_activar_membresia;
drop trigger if exists trg_auditar_inscripcion;