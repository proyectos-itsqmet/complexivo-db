drop user if exists 'admin_biblio_1'@'localhost', 'consulta_biblio_1'@'localhost';
drop role if exists 'rol_admin', 'rol_consulta';

create role 'rol_admin', 'rol_consulta';
grant all privileges on bliblioteca_db_1.* to 'rol_admin';
grant select on bliblioteca_db_1.* to 'rol_consulta';

create user 'admin_biblio_1'@'localhost' identified by 'Admin';
create user 'consulta_biblio_1'@'localhost' identified by 'Consulta';

grant 'rol_admin' to 'admin_biblio_1'@'localhost';
grant 'rol_consulta' to 'consulta_biblio_1'@'localhost';

set default role all to 'admin_biblio_1'@'localhost', 'consulta_biblio_1'@'localhost';

show grants for 'consulta_biblio_1'@'localhost' using 'rol_consulta';