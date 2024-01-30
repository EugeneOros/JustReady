enum JustReadyRoute {
  root('root', '/'),
  orders('orders', '/orders'),
  addOrders('addOrder', '/add-orders'),
  meals('meals', '/meals');

  final String name;
  final String path;

  const JustReadyRoute(this.name, this.path);
}
