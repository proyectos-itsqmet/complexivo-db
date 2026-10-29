# Restaurante (version recortada)

Practica de bases de datos (Nucleo 2) reducida para un examen de 1h40: 4 tablas, manteniendo todos los conteos requeridos en el taller (5 registros por tabla, 2 roles y 2 usuarios, 5 vistas con 3 multitabla, 2 indices, 4 triggers, 4 procedimientos; MongoDB con 4 colecciones, 3 documentos o mas, 5 consultas simples y 3 con `$lookup`).

## Dominio

Un restaurante vende platos a sus clientes. Cada pedido registra la cantidad, el total, la mesa y su estado (Pendiente, Servido, Cancelado) y descuenta las porciones del plato. Cada pedido se cobra con un pago que indica monto, metodo y estado.

## Modelo conceptual

| Entidad | Atributos | Relaciones |
|---|---|---|
| Cliente | nombre, email, telefono | 1 cliente realiza N pedidos |
| Plato | nombre, categoria, precio, porciones | 1 plato se pide en N pedidos |
| Pedido | cantidad, total, mesa, estado, fecha | N:1 con Cliente y Plato; 1:N con Pago |
| Pago | monto, metodo, estado, fecha | N:1 con Pedido |

Cliente y Plato se relacionan N:M a traves de Pedido.

## Modelo logico

| Tabla | PK | FK |
|---|---|---|
| cliente | id | - |
| plato | id | - |
| pedido | id | id_cliente -> cliente, id_plato -> plato |
| pago | id | id_pedido -> pedido |

Normalizacion: 1FN (valores atomicos), 2FN (cada atributo depende de toda la clave; la relacion N:M cliente-plato se resuelve con `pedido`) y 3FN (sin dependencias transitivas: datos del cliente y del plato solo en sus tablas).

## Orden de ejecucion (MySQL)

Carpeta `MySQL/`:

1. `restaurante.sql` (base de datos y tablas)
2. `restaurante_data.sql` (datos)
3. `restaurante_indices.sql`
4. `restaurante_vistas.sql`
5. `restaurante_triggers.sql` (incluye pruebas al final; la ultima insercion devuelve error a proposito)
6. `restaurante_procedimientos.sql` (incluye llamadas de prueba; la mesa 0 y el pago de un pedido cancelado devuelven error a proposito)
7. `restaurante_roles_usuarios.sql`

Con solo 4 tablas no hay tabla de auditoria: los 4 triggers validan o calculan sobre las tablas existentes (validar porciones, calcular total, descontar porciones y devolver porciones al cancelar).

## MongoDB

Base `restaurante`, 4 colecciones: `clientes`, `platos`, `pedidos`, `pagos`.

- `pedidos` referencia `id_cliente` e `id_plato`; `pagos` referencia `id_pedido`. Los pagos se mantienen como coleccion propia (no embebidos) para cumplir las 4 colecciones.

Importar con `seed.js` (mongosh):

```
mongosh --file seed.js
```

o con `mongoimport` desde la carpeta `MongoDB/`:

```
mongoimport --db restaurante --collection clientes --file restaurante.clientes.json --jsonArray
mongoimport --db restaurante --collection platos --file restaurante.platos.json --jsonArray
mongoimport --db restaurante --collection pedidos --file restaurante.pedidos.json --jsonArray
mongoimport --db restaurante --collection pagos --file restaurante.pagos.json --jsonArray
```

Las consultas estan en `MongoDB/restaurante_consultas.sql` (5 consultas simples y 3 con `$lookup`).
