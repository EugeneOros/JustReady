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

  List<Order> orders = [
    // Order(number: 1, orderMeals: [], note: 'note', status: OrderStatus.ready, announcedReady: true),
    // Order(number: 2, orderMeals: [], note: 'note', status: OrderStatus.ready, announcedReady: true),
    // Order(number: 3, orderMeals: [], note: 'note', status: OrderStatus.ready, announcedReady: true),
    // Order(number: 4, orderMeals: [], note: 'note', status: OrderStatus.ready, announcedReady: true),
    // Order(number: 5, orderMeals: [], note: 'note', status: OrderStatus.ready, announcedReady: true),
    // Order(number: 6, orderMeals: [], note: 'note', status: OrderStatus.ready, announcedReady: true),
    // Order(number: 7, orderMeals: [], note: 'note', status: OrderStatus.ready, announcedReady: true)
  ];
  List<Order> ordersToAnnounce = [];
  bool isAnnouncingOrder = false;

  DashboardCubit(
    this._getOrdersStreamUseCase,
    this._editOrderUseCase,
  ) : super(const DashboardState.loading());

  Future<void> loadOrders() async {
    // emit(const DashboardState.loading());
    _emmitLoaded();
    final publicStream = _getOrdersStreamUseCase().asBroadcastStream();
    await for (final orders in publicStream) {
      ordersUpdated(orders);
      if (!(await publicStream.isEmpty)) emit(const DashboardState.loading());
    }
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
