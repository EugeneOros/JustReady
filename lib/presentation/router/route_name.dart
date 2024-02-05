enum JustReadyRoute {
  root('root', '/'),
  orders('orders', '/orders'),
  createOrder('createOrder', '/create-order'),
  selectMeals('selectMeals', 'select_meals'),
  meals('meals', '/meals');

  final String name;
  final String path;

  const JustReadyRoute(this.name, this.path);
}
