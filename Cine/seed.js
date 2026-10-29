// seed.js
use("cine");

db.clientes.insertMany([
  {
    _id: 1,
    nombre: "Daniela Paredes",
    email: "daniela.paredes@gmail.com",
    telefono: "0991111111",
  },
  {
    _id: 2,
    nombre: "Sebastian Ortiz",
    email: "sebastian.ortiz@hotmail.com",
    telefono: "0982222222",
  },
  {
    _id: 3,
    nombre: "Gabriela Naranjo",
    email: "gabriela.naranjo@gmail.com",
    telefono: "0973333333",
  },
  {
    _id: 4,
    nombre: "Javier Cedeno",
    email: "javier.cedeno@yahoo.com",
    telefono: "0964444444",
  },
  {
    _id: 5,
    nombre: "Paola Villacis",
    email: "paola.villacis@gmail.com",
    telefono: "0955555555",
  },
]);

db.peliculas.insertMany([
  {
    _id: 1,
    titulo: "Oppenheimer",
    genero: "Drama",
    duracion_min: 180,
    clasificacion: "12+",
  },
  {
    _id: 2,
    titulo: "Intensamente 2",
    genero: "Animacion",
    duracion_min: 96,
    clasificacion: "Todo publico",
  },
  {
    _id: 3,
    titulo: "Deadpool y Wolverine",
    genero: "Accion",
    duracion_min: 128,
    clasificacion: "15+",
  },
  {
    _id: 4,
    titulo: "Mi Villano Favorito 4",
    genero: "Comedia",
    duracion_min: 94,
    clasificacion: "Todo publico",
  },
  {
    _id: 5,
    titulo: "Terrifier 3",
    genero: "Terror",
    duracion_min: 125,
    clasificacion: "18+",
  },
]);

db.funciones.insertMany([
  {
    _id: 1,
    fecha_hora: ISODate("2026-10-20T19:00:00Z"),
    sala: { nombre: "Sala 1", tipo: "2D" },
    precio: 4.5,
    asientos_disponibles: 38,
    id_pelicula: 1,
  },
  {
    _id: 2,
    fecha_hora: ISODate("2026-10-22T16:00:00Z"),
    sala: { nombre: "Sala 2", tipo: "3D" },
    precio: 6.0,
    asientos_disponibles: 27,
    id_pelicula: 2,
  },
  {
    _id: 3,
    fecha_hora: ISODate("2026-10-25T20:30:00Z"),
    sala: { nombre: "Sala 1", tipo: "2D" },
    precio: 4.5,
    asientos_disponibles: 38,
    id_pelicula: 3,
  },
  {
    _id: 4,
    fecha_hora: ISODate("2026-11-05T18:00:00Z"),
    sala: { nombre: "Sala 3", tipo: "3D" },
    precio: 6.5,
    asientos_disponibles: 21,
    id_pelicula: 4,
  },
  {
    _id: 5,
    fecha_hora: ISODate("2026-11-07T21:00:00Z"),
    sala: { nombre: "Sala 3", tipo: "2D" },
    precio: 5.0,
    asientos_disponibles: 20,
    id_pelicula: 5,
  },
]);

db.boletos.insertMany([
  {
    _id: 1,
    cantidad: 2,
    total: 9.0,
    estado: "Vendido",
    fecha: ISODate("2026-10-19T10:00:00Z"),
    id_cliente: 1,
    id_funcion: 1,
  },
  {
    _id: 2,
    cantidad: 3,
    total: 18.0,
    estado: "Vendido",
    fecha: ISODate("2026-10-21T12:30:00Z"),
    id_cliente: 2,
    id_funcion: 2,
  },
  {
    _id: 3,
    cantidad: 2,
    total: 9.0,
    estado: "Vendido",
    fecha: ISODate("2026-10-24T15:00:00Z"),
    id_cliente: 3,
    id_funcion: 3,
  },
  {
    _id: 4,
    cantidad: 4,
    total: 26.0,
    estado: "Vendido",
    fecha: ISODate("2026-10-27T09:15:00Z"),
    id_cliente: 4,
    id_funcion: 4,
  },
  {
    _id: 5,
    cantidad: 1,
    total: 5.0,
    estado: "Anulado",
    fecha: ISODate("2026-10-28T08:00:00Z"),
    id_cliente: 5,
    id_funcion: 5,
  },
]);
