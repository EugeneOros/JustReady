import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/main_stream/usecase/subscribe_main_stream_use_case.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/models/order_meal.dart';
import 'package:just_ready/domain/orders/repository/orders_event.dart';
import 'package:just_ready/domain/orders/use_case/add_note_to_current_order_use_case.dart';
import 'package:just_ready/domain/orders/use_case/add_order_use_case.dart';
import 'package:just_ready/domain/orders/use_case/clear_current_order.dart';
import 'package:just_ready/domain/orders/use_case/delete_current_order_meal_use_case.dart';
import 'package:just_ready/domain/orders/use_case/edit_current_order_meal_count_use_case.dart';
import 'package:just_ready/domain/orders/use_case/get_current_order_use_case.dart';
import 'package:just_ready/presentation/page/create_order/cubit/create_order_state.dart';

@injectable
class CreateOrderCubit extends Cubit<CreateOrderState> {
  final GetCurrentOrderUseCase _getCurrentOrderUseCase;
  final AddNoteToCurrentOrderUseCase _addNoteToCurrentOrderUseCase;
  final SubscribeMainStreamUseCase _subscribeMainStreamUseCase;
  final DeleteCurrentOrderMealUseCase _deleteCurrentOrderMealUseCase;
  final EditCurrentOrderMealCountUseCase _editCurrentOrderMealCountUseCase;
  final AddOrderUseCase _addOrderUseCase;
  final ClearCurrentOrderUseCase _clearCurrentOrderUseCase;

  StreamSubscription? _streamSubscription;

  Order? order;
  CreateOrderCubit(
    this._getCurrentOrderUseCase,
    this._addNoteToCurrentOrderUseCase,
    this._subscribeMainStreamUseCase,
    this._deleteCurrentOrderMealUseCase,
    this._editCurrentOrderMealCountUseCase,
    this._addOrderUseCase,
    this._clearCurrentOrderUseCase,
  ) : super(const CreateOrderState.loading()) {
    _listenToMainStream();
  }

  Future<void> init() async {
    emit(const CreateOrderState.idle());
    //Todo if you will have more time check why on add selected meal again main stream is not updating view if i dont wait
    await Future.delayed(const Duration(microseconds: 200));
    _emmitLoaded();
  }

  Future<void> sendCurrentOrder() async {
    emit(const CreateOrderState.loading());
    if (order == null) return;
    int orderNumber = await _addOrderUseCase(order!);
    emit(CreateOrderState.showOrderSuccesfullyAddedDialog(orderNumber));
    _clearCurrentOrderUseCase();
    _emmitLoaded();
  }

  void addNoteToOrder(String note) => _addNoteToCurrentOrderUseCase(note);

  void onDeleteOrderMeal(OrderMeal orderMeal) {
    emit(const CreateOrderState.idle());
    _deleteCurrentOrderMealUseCase(orderMeal);
    _emmitLoaded();
  }

  void onEditOrderMealCount(OrderMeal orderMeal, int count) {
    emit(const CreateOrderState.idle());
    _editCurrentOrderMealCountUseCase(orderMeal, count);
    _emmitLoaded();
  }

  Future<void> _listenToMainStream() async {
    await _streamSubscription?.cancel();
    _streamSubscription = _subscribeMainStreamUseCase().listen((event) async {
      if (event is MealsAddToCurrentOrder) await init();
    });
  }

  Future<void> _emmitLoaded() async {
    order = _getCurrentOrderUseCase();
    order == null || order!.orderMeals.isEmpty
        ? emit(const CreateOrderState.loadedEmpty())
        : emit(CreateOrderState.loaded(order!));
  }
}
