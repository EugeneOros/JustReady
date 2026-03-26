import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/models/order_status.dart';
import 'package:just_ready/domain/orders/use_case/edit_order_use_case.dart';
import 'package:just_ready/domain/orders/use_case/get_orders_stream_use_case.dart';
import 'package:just_ready/presentation/page/dashboard/cubit/dashboard_state.dart';

@injectable
class DashboardCubit extends Cubit<DashboardState> {
  final GetOrdersStreamUseCase _getOrdersStreamUseCase;
  final EditOrderUseCase _editOrderUseCase;

  StreamSubscription? _ordersSubscription;

  List<Order> orders = [];
  List<Order> ordersToAnnounce = [];
  bool isAnnouncingOrder = false;

  DashboardCubit(
    this._getOrdersStreamUseCase,
    this._editOrderUseCase,
  ) : super(const DashboardState.loading());

  Future<void> loadOrders() async {
    _emmitLoaded();
    await _ordersSubscription?.cancel();
    _ordersSubscription = _getOrdersStreamUseCase().listen((orders) {
      if (isClosed) return;
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

  Future<void> orderReadyAnnounced(Order order) async {
    await _editOrderUseCase(order.copyWith(announcedReady: true));
  }

  void _emmitLoaded() {
    emit(DashboardState.loaded(orders));
    ordersToAnnounce =
        orders.where((order) => order.status == OrderStatus.ready && !order.announcedReady).toList(growable: false);
    if (!isAnnouncingOrder) announceNext();
  }

  void announceNext() {
    emit(const DashboardState.idle());
    if (ordersToAnnounce.isEmpty) {
      isAnnouncingOrder = false;
      return;
    }
    isAnnouncingOrder = true;
    emit(DashboardState.announceReady(ordersToAnnounce[0]));
  }
}
