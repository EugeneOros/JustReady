enum JustReadyRoute {
  root('/'),
  createOrder('/create-order'),
  selectMeals('select_meals'),
  orders('/orders'),
  meals('/meals'),
  dashboard('/dashboard'),
  statistics('/statistics');

  final String path;

  const JustReadyRoute(this.path);
}
