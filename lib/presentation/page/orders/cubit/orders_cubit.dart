import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/models/order_status.dart';
import 'package:just_ready/domain/orders/use_case/delete_order_use_case.dart';
import 'package:just_ready/domain/orders/use_case/edit_order_use_case.dart';
import 'package:just_ready/domain/orders/use_case/get_orders_stream_use_case.dart';
import 'package:just_ready/presentation/page/orders/cubit/orders_state.dart';

const deletionContdownInitValue = 7;
const oneSec = Duration(seconds: 1);

@injectable
class OrdersCubit extends Cubit<OrdersState> {
  final GetOrdersStreamUseCase _getOrdersStreamUseCase;
  final EditOrderUseCase _editOrderUseCase;
  final DeleteOrderUseCase _deleteOrderUseCase;

  List<Order> _orders = [];

  Timer? _deletionTimer;
  Order? _orderToDelete;
  int _deletionCountdown = deletionContdownInitValue;

  OrdersCubit(
    this._getOrdersStreamUseCase,
    this._editOrderUseCase,
    this._deleteOrderUseCase,
  ) : super(const OrdersState.loading());

  Future<void> loadOrders() async {
    emit(const OrdersState.loading());
    _emmitLoaded();
    final publicStream = _getOrdersStreamUseCase().asBroadcastStream();
    await for (final updatedOrders in publicStream) {
      ordersUpdated(updatedOrders);
      if (!(await publicStream.isEmpty)) emit(const OrdersState.loading());
    }
  }

  Future<void> toggleOrderMealIsDone(Order order, int orderMealNumber) async {
    for (var orderMeal in order.orderMeals) {
      if (orderMeal.meal.number == orderMealNumber) {
        orderMeal.isDone = !orderMeal.isDone;
        //if order status was ordered change it to inProgres
        _editOrderUseCase(
          order.status == OrderStatus.ordered && orderMeal.isDone
              ? order.copyWith(status: OrderStatus.inProgress)
              : order,
        );
        return;
      }
    }
  }

  Future<void> updateOrderStatus(Order order, OrderStatus status) async {
    if (_orderToDelete != null) {
      await deleteOrder(_orderToDelete!);
      cancelDeletionCountdown();
      _emmitLoaded();
    }
    await _editOrderUseCase(order.copyWith(status: status, announcedReady: false));
    status == OrderStatus.deliverd ? startDeletionCountdown(order) : cancelDeletionCountdown();
  }

  Future<void> deleteOrder(Order order) async => await _deleteOrderUseCase(order);

  void startDeletionCountdown(Order order) {
    cancelDeletionCountdown();
    _orderToDelete = order;
    _emmitLoaded();
    _deletionTimer = Timer.periodic(oneSec, (timer) async {
      if (_deletionCountdown < 1) {
        await deleteOrder(order);
        cancelDeletionCountdown();
        _emmitLoaded();
      } else {
        _deletionCountdown--;
        _emmitLoaded();
      }
    });
  }

  void cancelDeletionCountdown() {
    if (_deletionTimer == null) return;
    _deletionTimer!.cancel();
    _deletionCountdown = deletionContdownInitValue;
    _orderToDelete = null;
    _emmitLoaded();
  }

  Future<void> ordersUpdated(List<Order> updatedOrders) async {
    _orders = updatedOrders;
    _orders.sort((a, b) => a.createdDate!.compareTo(b.createdDate!));
    _emmitLoaded();
  }

  void _emmitLoaded() => _orders.isEmpty
      ? emit(const OrdersState.loadedEmpty())
      : emit(
          OrdersState.loaded(
            List<Order>.from(_orders),
            _orderToDelete,
            _deletionCountdown,
          ),
        );
}
