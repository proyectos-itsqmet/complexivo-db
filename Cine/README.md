# Cine (version recortada)

Practica de bases de datos (Nucleo 2) reducida para un examen de 1h40: 4 tablas, manteniendo todos los conteos requeridos en el taller (5 registros por tabla, 2 roles y 2 usuarios, 5 vistas con 3 multitabla, 2 indices, 4 triggers, 4 procedimientos; MongoDB con 4 colecciones, 3 documentos o mas, 5 consultas simples y 3 con `$lookup`).

## Dominio

Un cine programa funciones de sus peliculas en distintas salas. Los clientes compran boletos para una funcion; cada boleto registra la cantidad, el total, su estado (Vendido, Anulado) y descuenta los asientos disponibles de la funcion.

## Modelo conceptual

| Entidad | Atributos | Relaciones |
|---|---|---|
| Cliente | nombre, email, telefono | 1 cliente compra N boletos |
| Pelicula | titulo, genero, duracion_min, clasificacion | 1 pelicula tiene N funciones |
| Funcion | fecha_hora, sala, tipo, precio, asientos_disponibles | N:1 con Pelicula; 1:N con Boleto |
| Boleto | cantidad, total, estado, fecha | N:1 con Cliente y Funcion |

## Modelo logico

| Tabla | PK | FK |
|---|---|---|
| cliente | id | - |
| pelicula | id | - |
| funcion | id | id_pelicula -> pelicula |
| boleto | id | id_cliente -> cliente, id_funcion -> funcion |

Normalizacion: 1FN (valores atomicos), 2FN (cada atributo depende de toda la clave; la relacion N:M cliente-funcion se resuelve con `boleto`) y 3FN (sin dependencias transitivas: datos de la pelicula solo en `pelicula`, datos de la funcion solo en `funcion`).

## Orden de ejecucion (MySQL)

Carpeta `MySQL/`:

1. `cine.sql` (base de datos y tablas)
2. `cine_data.sql` (datos)
3. `cine_indices.sql`
4. `cine_vistas.sql`
5. `cine_triggers.sql` (incluye pruebas al final; la ultima insercion devuelve error a proposito)
6. `cine_procedimientos.sql` (incluye llamadas de prueba; la llamada a una funcion pasada devuelve error a proposito)
7. `cine_roles_usuarios.sql`

Con solo 4 tablas no hay tabla de auditoria: los 4 triggers validan o calculan sobre las tablas existentes (validar asientos, calcular total, descontar asientos y devolver asientos al anular).

## MongoDB

Base `cine`, 4 colecciones: `clientes`, `peliculas`, `funciones`, `boletos`.

- `funciones` embebe la sala (`sala: { nombre, tipo }`).
- `funciones` referencia `id_pelicula`; `boletos` referencia `id_cliente` e `id_funcion`.

Importar con `seed.js` (mongosh):

```
mongosh --file seed.js
```

o con `mongoimport` desde la carpeta `MongoDB/`:

```
mongoimport --db cine --collection clientes --file cine.clientes.json --jsonArray
mongoimport --db cine --collection peliculas --file cine.peliculas.json --jsonArray
mongoimport --db cine --collection funciones --file cine.funciones.json --jsonArray
mongoimport --db cine --collection boletos --file cine.boletos.json --jsonArray
```

Las consultas estan en `MongoDB/cine_consultas.sql` (5 consultas simples y 3 con `$lookup`).
