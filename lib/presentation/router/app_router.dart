import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:just_ready/presentation/page/add_orders/add_orders_page.dart';
import 'package:just_ready/presentation/page/home/home_page.dart';
import 'package:just_ready/presentation/page/meals/meals_page.dart';
import 'package:just_ready/presentation/page/orders/orders_page.dart';
import 'package:just_ready/presentation/router/route_name.dart';

@singleton
class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _appRouter = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: JustReadyRoute.meals.path,
    errorPageBuilder: (context, state) => _pageBuilder(
      state,
      child: Container(),
    ),
    routes: [
      GoRoute(
        path: JustReadyRoute.root.path,
        name: JustReadyRoute.root.name,
        pageBuilder: (context, state) => _pageBuilder(
          state,
          child: const AddOrdersPage(),
        ),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return HomePage(
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: JustReadyRoute.addOrders.path,
            name: JustReadyRoute.addOrders.name,
            builder: (context, state) => const AddOrdersPage(),
          ),
          GoRoute(
            path: JustReadyRoute.meals.path,
            name: JustReadyRoute.meals.name,
            builder: (context, state) => const MealsPage(),
          ),
          GoRoute(
            path: JustReadyRoute.orders.path,
            name: JustReadyRoute.orders.name,
            builder: (context, state) => const OrdersPage(),
          ),
        ],
      ),
    ],
  );

  static Page<dynamic> _pageBuilder(GoRouterState state, {required Widget child}) => CustomTransitionPage(
        key: state.pageKey,
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        child: child,
      );

  static GoRouter get router => _appRouter;
}
