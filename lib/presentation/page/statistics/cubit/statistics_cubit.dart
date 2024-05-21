import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/models/order_status.dart';
import 'package:just_ready/domain/orders/use_case/get_deleted_orders_stream_use_case.dart';
import 'package:just_ready/presentation/page/statistics/cubit/statistics_state.dart';
import 'package:just_ready/presentation/page/statistics/models/statistic.dart';

@injectable
class StatisticsCubit extends Cubit<StatisticsState> {
  final GetDeletedOrdersStreamUseCase _getDeletedOrdersStreamUseCase;

  List<Order> orders = [];
  List<Order> ordersToAnnounce = [];
  bool isAnnouncingOrder = false;

  StatisticsCubit(
    this._getDeletedOrdersStreamUseCase,
  ) : super(const StatisticsState.loading());

  Future<void> loadOrders() async {
    _emmitLoaded();
    final publicStream = _getDeletedOrdersStreamUseCase().asBroadcastStream();
    await for (final orders in publicStream) {
      emit(const StatisticsState.loading());
      ordersUpdated(orders);
    }
  }

  Future<void> ordersUpdated(List<Order> updatedOrders) async {
    orders = updatedOrders;
    orders.sort((a, b) => a.createdDate!.compareTo(b.createdDate!));
    _emmitLoaded();
  }

  void _emmitLoaded() {
    final Map<Meal, Statistic> map = {};
    for (var order in orders) {
      for (var orderMeal in order.orderMeals) {
        if (map[orderMeal.meal] == null) {
          map[orderMeal.meal] = Statistic(orderMeals: [orderMeal]);
        } else {
          map[orderMeal.meal]!.orderMeals.add(orderMeal);
        }
      }
    }
    emit(StatisticsState.loaded(map));
    ordersToAnnounce =
        orders.where((order) => order.status == OrderStatus.ready && !order.announcedReady).toList(growable: false);
  }
}
