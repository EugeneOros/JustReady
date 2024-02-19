import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/models/order_status.dart';
import 'package:just_ready/domain/orders/use_case/delete_order_use_case.dart';
import 'package:just_ready/domain/orders/use_case/edit_order_use_case.dart';
import 'package:just_ready/domain/orders/use_case/get_orders_stream_use_case.dart';
import 'package:just_ready/presentation/page/orders/cubit/orders_state.dart';

@injectable
class OrdersCubit extends Cubit<OrdersState> {
  final GetOrdersStreamUseCase _getOrdersStreamUseCase;
  final EditOrderUseCase _editOrderUseCase;
  final DeleteOrderUseCase _deleteOrderUseCase;

  List<Order> orders = [];

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
    return await _editOrderUseCase(order.copyWith(status: status, announcedReady: false));
  }

  Future<void> deleteOrder(Order order) async => await _deleteOrderUseCase(order);

  Future<void> ordersUpdated(List<Order> updatedOrders) async {
    // emit(const OrdersState.loading());
    // await Future.delayed(Duration(seconds: 1));
    orders = updatedOrders;
    orders.sort((a, b) => a.createdDate!.compareTo(b.createdDate!));
    _emmitLoaded();
  }

  void _emmitLoaded() =>
      orders.isEmpty ? emit(const OrdersState.loadedEmpty()) : emit(OrdersState.loaded(List<Order>.from(orders)));
}
