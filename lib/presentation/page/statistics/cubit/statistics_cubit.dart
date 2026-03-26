import 'dart:async';

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

  StreamSubscription? _ordersSubscription;

  List<Order> orders = [];
  List<Order> ordersToAnnounce = [];
  bool isAnnouncingOrder = false;
  DateTime? selectedDate;

  StatisticsCubit(
    this._getDeletedOrdersStreamUseCase,
  ) : super(const StatisticsState.loading());

  Future<void> loadOrders() async {
    _emmitLoaded();
    await _ordersSubscription?.cancel();
    _ordersSubscription = _getDeletedOrdersStreamUseCase().listen((orders) {
      if (isClosed) return;
      emit(const StatisticsState.loading());
      ordersUpdated(orders);
    });
  }

  @override
  Future<void> close() async {
    await _ordersSubscription?.cancel();
    return super.close();
  }

  Future<void> ordersUpdated(List<Order> updatedOrders) async {
    orders = updatedOrders;
    orders.sort((a, b) => a.createdDate!.compareTo(b.createdDate!));
    _emmitLoaded();
  }

  void selectDate(DateTime? date) {
    selectedDate = date;
    _emmitLoaded();
  }

  void _emmitLoaded() {
    final availableDates = _extractAvailableDates();

    final filteredOrders = selectedDate != null
        ? orders
            .where((order) =>
                order.createdDate != null &&
                order.createdDate!.year == selectedDate!.year &&
                order.createdDate!.month == selectedDate!.month &&
                order.createdDate!.day == selectedDate!.day)
            .toList()
        : orders;

    final Map<Meal, Statistic> map = {};
    double totalPrice = 0;
    for (var order in filteredOrders) {
      totalPrice += order.getSumPrice();
      for (var orderMeal in order.orderMeals) {
        if (map[orderMeal.meal] == null) {
          map[orderMeal.meal] = Statistic(orderMeals: [orderMeal]);
        } else {
          map[orderMeal.meal]!.orderMeals.add(orderMeal);
        }
      }
    }
    emit(StatisticsState.loaded(
      orderMealsMap: map,
      totalPrice: totalPrice,
      availableDates: availableDates,
      selectedDate: selectedDate,
    ));
    ordersToAnnounce =
        orders.where((order) => order.status == OrderStatus.ready && !order.announcedReady).toList(growable: false);
  }

  List<DateTime> _extractAvailableDates() {
    final Set<String> seen = {};
    final List<DateTime> dates = [];
    for (var order in orders) {
      if (order.createdDate != null) {
        final key = '${order.createdDate!.year}-${order.createdDate!.month}-${order.createdDate!.day}';
        if (seen.add(key)) {
          dates.add(DateTime(order.createdDate!.year, order.createdDate!.month, order.createdDate!.day));
        }
      }
    }
    dates.sort((a, b) => b.compareTo(a));
    return dates;
  }
}
