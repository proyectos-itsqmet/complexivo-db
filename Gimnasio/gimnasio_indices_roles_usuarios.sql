create index idx_inscripcion_estado on inscripcion(estado);
create index idx_membresia_estado on membresia(estado);

create role 'rol_admin_gym', 'rol_recepcion';
grant all privileges on gimnasio_db.* to 'rol_admin_gym';
grant select, insert, update on gimnasio_db.* to 'rol_recepcion';

create user 'admin_gym'@'localhost' identified by 'Admin';
create user 'recepcion_gym'@'localhost' identified by 'Recepion';

grant 'rol_admin_gym' to 'admin_gym'@'localhost';
grant 'rol_recepcion' to 'recepcion_gym'@'localhost';

set default role all to 'admin_gym'@'localhost', 'recepcion_gym'@'localhost';
