use restaurante;

create role 'rol_admin_restaurante', 'rol_mesero';

grant all privileges on restaurante.* to 'rol_admin_restaurante';

grant select on restaurante.* to 'rol_mesero';
grant insert, update on restaurante.cliente to 'rol_mesero';
grant insert, update on restaurante.pedido to 'rol_mesero';
grant insert, update on restaurante.pago to 'rol_mesero';

create user 'admin_restaurante'@'localhost' identified by 'Admin123';
create user 'mesero_restaurante'@'localhost' identified by 'Mesero123';

grant 'rol_admin_restaurante' to 'admin_restaurante'@'localhost';
grant 'rol_mesero' to 'mesero_restaurante'@'localhost';
