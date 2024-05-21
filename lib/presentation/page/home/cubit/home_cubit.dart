import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:just_ready/presentation/page/home/cubit/home_state.dart';
import 'package:just_ready/presentation/router/route_name.dart';

enum NavTabs {
  addOrders,
  orders,
  meals,
  dashboard,
  statistics,
}

@injectable
class HomeCubit extends Cubit<HomeState> {
  int _selectedIndex = 0;

  HomeCubit() : super(const HomeState.idle());

  Future<void> init() async {
    emit(HomeState.selectedPage(
      index: _selectedIndex,
      path: _getCurrentLocation(),
    ));
  }

  void selectPage(NavTabs page) async {
    emit(const HomeState.idle());
    _selectedIndex = page.index;
    emit(HomeState.selectedPage(
      index: _selectedIndex,
      path: _getCurrentLocation(),
    ));
  }

  String _getCurrentLocation() {
    switch (_selectedIndex) {
      case 0:
        return JustReadyRoute.createOrder.path;
      case 1:
        return JustReadyRoute.orders.path;
      case 2:
        return JustReadyRoute.meals.path;
      case 3:
        return JustReadyRoute.dashboard.path;
      case 4:
        return JustReadyRoute.statistics.path;
      default:
        return JustReadyRoute.createOrder.path;
    }
  }
}
