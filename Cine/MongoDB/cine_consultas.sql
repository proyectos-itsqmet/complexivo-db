use("cine");

db.funciones
  .find(
    { precio: { $gt: 5 } },
    { _id: 0, fecha_hora: 1, precio: 1, "sala.nombre": 1 },
  )
  .sort({ precio: -1 });

db.peliculas.find(
  { genero: { $in: ["Drama", "Accion"] } },
  { _id: 0, titulo: 1, genero: 1, duracion_min: 1 },
);

db.boletos.find(
  {
    $and: [{ estado: { $eq: "Vendido" } }, { id_cliente: { $gte: 2 } }],
  },
  { _id: 1, cantidad: 1, total: 1, id_cliente: 1 },
);

db.clientes.find(
  { email: { $regex: /@gmail\.com$/i } },
  { _id: 0, nombre: 1, email: 1 },
);

db.peliculas.find(
  { $or: [{ genero: { $eq: "Terror" } }, { duracion_min: { $gte: 150 } }] },
  { _id: 1, titulo: 1, genero: 1, clasificacion: 1 },
);

db.boletos.aggregate([
  {
    $lookup: {
      from: "clientes",
      localField: "id_cliente",
      foreignField: "_id",
      as: "cliente",
    },
  },
  { $unwind: "$cliente" },
  {
    $lookup: {
      from: "funciones",
      localField: "id_funcion",
      foreignField: "_id",
      as: "funcion",
    },
  },
  { $unwind: "$funcion" },
  {
    $project: {
      _id: 0,
      boleto: "$_id",
      cantidad: 1,
      estado: 1,
      cliente: "$cliente.nombre",
      sala: "$funcion.sala.nombre",
    },
  },
  { $sort: { boleto: 1 } },
]);

db.funciones.aggregate([
  {
    $lookup: {
      from: "peliculas",
      localField: "id_pelicula",
      foreignField: "_id",
      as: "pelicula",
    },
  },
  { $unwind: "$pelicula" },
  {
    $lookup: {
      from: "boletos",
      localField: "_id",
      foreignField: "id_funcion",
      as: "boletos",
    },
  },
  {
    $project: {
      _id: 0,
      funcion: "$_id",
      pelicula: "$pelicula.titulo",
      precio: 1,
      total_boletos: { $size: "$boletos" },
    },
  },
  { $sort: { precio: -1 } },
]);

db.peliculas.aggregate([
  {
    $lookup: {
      from: "funciones",
      localField: "_id",
      foreignField: "id_pelicula",
      as: "funciones",
    },
  },
  {
    $project: {
      _id: 0,
      pelicula: "$titulo",
      total_funciones: { $size: "$funciones" },
      salas: "$funciones.sala.nombre",
    },
  },
  { $sort: { total_funciones: -1 } },
]);
