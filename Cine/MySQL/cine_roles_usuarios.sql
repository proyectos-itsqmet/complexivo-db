use cine;

create role 'rol_admin_cine', 'rol_taquillero';

grant all privileges on cine.* to 'rol_admin_cine';

grant select on cine.* to 'rol_taquillero';
grant insert, update on cine.cliente to 'rol_taquillero';
grant insert, update on cine.boleto to 'rol_taquillero';

create user 'admin_cine'@'localhost' identified by 'Admin123';
create user 'taquillero_cine'@'localhost' identified by 'Taquillero123';

grant 'rol_admin_cine' to 'admin_cine'@'localhost';
grant 'rol_taquillero' to 'taquillero_cine'@'localhost';
