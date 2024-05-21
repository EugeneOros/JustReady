import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:injectable/injectable.dart';
import 'package:just_ready/presentation/page/create_order/create_order_page.dart';
import 'package:just_ready/presentation/page/dashboard/dashboard_page.dart';
import 'package:just_ready/presentation/page/select_meals/select_meals_page.dart';
import 'package:just_ready/presentation/page/home/home_page.dart';
import 'package:just_ready/presentation/page/meals/meals_page.dart';
import 'package:just_ready/presentation/page/orders/orders_page.dart';
import 'package:just_ready/presentation/page/statistics/statistics_page.dart';
import 'package:just_ready/presentation/router/route_name.dart';

// @singleton
class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: JustReadyRoute.orders.path,
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
          child: const SelectMealsPage(),
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
            path: JustReadyRoute.createOrder.path,
            name: JustReadyRoute.createOrder.name,
            pageBuilder: (context, state) => _defaultTransition(
              state: state,
              child: const CreateOrderPage(),
            ),
            routes: [
              GoRoute(
                parentNavigatorKey: _rootNavigatorKey,
                path: JustReadyRoute.selectMeals.path,
                name: JustReadyRoute.selectMeals.name,
                // builder: (context, state) => const SelectMealsPage(),
                pageBuilder: (context, state) => _slideTransition(
                  state: state,
                  child: const SelectMealsPage(),
                ),
              ),
            ],
          ),
          GoRoute(
            path: JustReadyRoute.orders.path,
            name: JustReadyRoute.orders.name,
            pageBuilder: (context, state) => _defaultTransition(
              state: state,
              child: const OrdersPage(),
            ),
          ),
          GoRoute(
            path: JustReadyRoute.meals.path,
            name: JustReadyRoute.meals.name,
            pageBuilder: (context, state) => _defaultTransition(
              state: state,
              child: const MealsPage(),
            ),
          ),
          GoRoute(
            path: JustReadyRoute.dashboard.path,
            name: JustReadyRoute.dashboard.name,
            pageBuilder: (context, state) => _defaultTransition(
              state: state,
              child: const DashboardPage(),
            ),
          ),
          GoRoute(
            path: JustReadyRoute.statistics.path,
            name: JustReadyRoute.statistics.name,
            pageBuilder: (context, state) => _defaultTransition(
              state: state,
              child: const StatisticsPage(),
            ),
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

  // static GoRouter get router => _appRouter;
}

CustomTransitionPage _defaultTransition<T>({
  required GoRouterState state,
  required Widget child,
}) =>
    CustomTransitionPage(
      key: state.pageKey,
      transitionsBuilder: (_, animation, __, child) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: child,
    );

CustomTransitionPage _slideTransition<T>({
  required GoRouterState state,
  required Widget child,
}) =>
    CustomTransitionPage(
      key: state.pageKey,
      transitionsBuilder: (_, animation, __, child) => SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeInOut)),
        ),
        child: child,
      ),
      child: child,
    );
