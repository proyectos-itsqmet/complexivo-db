use("restaurante");

db.platos
  .find({ porciones: { $gt: 10 } }, { _id: 0, nombre: 1, categoria: 1, porciones: 1 })
  .sort({ porciones: -1 });

db.platos.find(
  { categoria: { $in: ["Entrada", "Postre"] } },
  { _id: 0, nombre: 1, categoria: 1, precio: 1 },
);

db.pedidos.find(
  {
    $and: [{ estado: { $eq: "Servido" } }, { id_cliente: { $gte: 2 } }],
  },
  { _id: 1, cantidad: 1, total: 1, mesa: 1 },
);

db.clientes.find(
  { email: { $regex: /@gmail\.com$/i } },
  { _id: 0, nombre: 1, email: 1 },
);

db.pagos.find(
  { $or: [{ metodo: { $eq: "Efectivo" } }, { monto: { $gte: 12 } }] },
  { _id: 1, monto: 1, metodo: 1, estado: 1 },
);

db.pedidos.aggregate([
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
      from: "platos",
      localField: "id_plato",
      foreignField: "_id",
      as: "plato",
    },
  },
  { $unwind: "$plato" },
  {
    $project: {
      _id: 0,
      pedido: "$_id",
      fecha: 1,
      estado: 1,
      cliente: "$cliente.nombre",
      plato: "$plato.nombre",
    },
  },
  { $sort: { fecha: 1 } },
]);

db.pagos.aggregate([
  {
    $lookup: {
      from: "pedidos",
      localField: "id_pedido",
      foreignField: "_id",
      as: "pedido",
    },
  },
  { $unwind: "$pedido" },
  {
    $lookup: {
      from: "clientes",
      localField: "pedido.id_cliente",
      foreignField: "_id",
      as: "cliente",
    },
  },
  { $unwind: "$cliente" },
  {
    $project: {
      _id: 0,
      pago: "$_id",
      monto: 1,
      metodo: 1,
      estado: 1,
      cliente: "$cliente.nombre",
    },
  },
  { $sort: { monto: -1 } },
]);

db.platos.aggregate([
  {
    $lookup: {
      from: "pedidos",
      localField: "_id",
      foreignField: "id_plato",
      as: "pedidos",
    },
  },
  {
    $project: {
      _id: 0,
      plato: "$nombre",
      total_pedidos: { $size: "$pedidos" },
      estados: "$pedidos.estado",
    },
  },
  { $sort: { total_pedidos: -1 } },
]);
