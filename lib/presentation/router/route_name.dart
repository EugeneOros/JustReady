enum JustReadyRoute {
  root('root', '/'),
  createOrder('createOrder', '/create-order'),
  selectMeals('selectMeals', 'select_meals'),
  orders('orders', '/orders'),
  meals('meals', '/meals'),
  dashboard('dashboard', '/dashboard');

  final String name;
  final String path;

  const JustReadyRoute(this.name, this.path);
}
