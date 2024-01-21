import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:just_ready/presentation/page/home/cubit/home_state.dart';
import 'package:just_ready/presentation/router/route_name.dart';

enum NavTabs {
  addOrders,
  orders,
}

@injectable
class HomeCubit extends Cubit<HomeState> {
  int _selectedIndex = 0;

  HomeCubit() : super(const HomeState.idle());

  Future<void> init() async {
    emit(HomeState.selectedPage(
      index: 0,
      path: _getCurrentLocation(_selectedIndex),
    ));
  }

  void selectPage(
    NavTabs page,
  ) async {
    emit(const HomeState.idle());
    _selectedIndex = page.index;
    emit(HomeState.selectedPage(
      index: _selectedIndex,
      path: _getCurrentLocation(_selectedIndex),
    ));
  }

  String _getCurrentLocation(int index) {
    switch (index) {
      case 0:
        return JustReadyRoute.orders.path;
      case 1:
        return JustReadyRoute.addOrders.path;
      default:
        return JustReadyRoute.orders.path;
    }
  }
}
