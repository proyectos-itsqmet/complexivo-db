// seed.js
use("restaurante");

db.clientes.insertMany([
  {
    _id: 1,
    nombre: "Carolina Espinoza",
    email: "carolina.espinoza@gmail.com",
    telefono: "0991111111",
  },
  {
    _id: 2,
    nombre: "Fernando Zambrano",
    email: "fernando.zambrano@hotmail.com",
    telefono: "0982222222",
  },
  {
    _id: 3,
    nombre: "Monica Velasco",
    email: "monica.velasco@gmail.com",
    telefono: "0973333333",
  },
  {
    _id: 4,
    nombre: "Ricardo Mena",
    email: "ricardo.mena@yahoo.com",
    telefono: "0964444444",
  },
  {
    _id: 5,
    nombre: "Tatiana Aguirre",
    email: "tatiana.aguirre@gmail.com",
    telefono: "0955555555",
  },
]);

db.platos.insertMany([
  {
    _id: 1,
    nombre: "Ceviche de camaron",
    categoria: "Entrada",
    precio: 6.5,
    porciones: 18,
  },
  {
    _id: 2,
    nombre: "Encebollado",
    categoria: "Plato fuerte",
    precio: 4.0,
    porciones: 12,
  },
  {
    _id: 3,
    nombre: "Seco de pollo",
    categoria: "Plato fuerte",
    precio: 5.5,
    porciones: 10,
  },
  {
    _id: 4,
    nombre: "Tres leches",
    categoria: "Postre",
    precio: 3.0,
    porciones: 6,
  },
  {
    _id: 5,
    nombre: "Jugo de naranjilla",
    categoria: "Bebida",
    precio: 1.5,
    porciones: 27,
  },
]);

db.pedidos.insertMany([
  {
    _id: 1,
    cantidad: 2,
    total: 13.0,
    mesa: 3,
    estado: "Servido",
    fecha: ISODate("2026-10-24T13:00:00Z"),
    id_cliente: 1,
    id_plato: 1,
  },
  {
    _id: 2,
    cantidad: 3,
    total: 12.0,
    mesa: 1,
    estado: "Servido",
    fecha: ISODate("2026-10-25T12:30:00Z"),
    id_cliente: 2,
    id_plato: 2,
  },
  {
    _id: 3,
    cantidad: 2,
    total: 11.0,
    mesa: 5,
    estado: "Servido",
    fecha: ISODate("2026-10-26T19:45:00Z"),
    id_cliente: 3,
    id_plato: 3,
  },
  {
    _id: 4,
    cantidad: 4,
    total: 12.0,
    mesa: 2,
    estado: "Servido",
    fecha: ISODate("2026-10-27T20:15:00Z"),
    id_cliente: 4,
    id_plato: 4,
  },
  {
    _id: 5,
    cantidad: 3,
    total: 4.5,
    mesa: 4,
    estado: "Pendiente",
    fecha: ISODate("2026-10-28T12:00:00Z"),
    id_cliente: 5,
    id_plato: 5,
  },
]);

db.pagos.insertMany([
  {
    _id: 1,
    monto: 13.0,
    metodo: "Efectivo",
    estado: "Pagado",
    fecha: ISODate("2026-10-24T14:00:00Z"),
    id_pedido: 1,
  },
  {
    _id: 2,
    monto: 12.0,
    metodo: "Tarjeta",
    estado: "Pagado",
    fecha: ISODate("2026-10-25T13:30:00Z"),
    id_pedido: 2,
  },
  {
    _id: 3,
    monto: 11.0,
    metodo: "Transferencia",
    estado: "Pagado",
    fecha: ISODate("2026-10-26T20:45:00Z"),
    id_pedido: 3,
  },
  {
    _id: 4,
    monto: 12.0,
    metodo: "Efectivo",
    estado: "Pendiente",
    fecha: ISODate("2026-10-27T21:15:00Z"),
    id_pedido: 4,
  },
  {
    _id: 5,
    monto: 4.5,
    metodo: "Tarjeta",
    estado: "Pendiente",
    fecha: ISODate("2026-10-28T12:30:00Z"),
    id_pedido: 5,
  },
]);
