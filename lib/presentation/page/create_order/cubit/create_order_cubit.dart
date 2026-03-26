import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/domain/meals/use_case/get_meals_use_case.dart';
import 'package:just_ready/domain/main_stream/usecase/subscribe_main_stream_use_case.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/models/order_meal.dart';
import 'package:just_ready/domain/orders/repository/orders_event.dart';
import 'package:just_ready/domain/orders/use_case/add_maal_to_current_order_use_case.dart';
import 'package:just_ready/domain/orders/use_case/add_note_to_current_order_use_case.dart';
import 'package:just_ready/domain/orders/use_case/add_order_use_case.dart';
import 'package:just_ready/domain/orders/use_case/clear_current_order.dart';
import 'package:just_ready/domain/orders/use_case/delete_current_order_meal_use_case.dart';
import 'package:just_ready/domain/orders/use_case/delete_order_use_case.dart';
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
  final DeleteOrderUseCase _deleteOrderUseCase;
  final GetMealsUseCase _getMealsUseCase;
  final AddMealToCurrentOrderUseCase _addMealToCurrentOrderUseCase;

  StreamSubscription? _streamSubscription;

  Order? order;
  Order? _lastSentOrder;
  List<Meal> _meals = [];

  CreateOrderCubit(
    this._getCurrentOrderUseCase,
    this._addNoteToCurrentOrderUseCase,
    this._subscribeMainStreamUseCase,
    this._deleteCurrentOrderMealUseCase,
    this._editCurrentOrderMealCountUseCase,
    this._addOrderUseCase,
    this._clearCurrentOrderUseCase,
    this._deleteOrderUseCase,
    this._getMealsUseCase,
    this._addMealToCurrentOrderUseCase,
  ) : super(const CreateOrderState.loading()) {
    _listenToMainStream();
  }

  Future<void> init() async {
    emit(const CreateOrderState.loading());
    _meals = await _getMealsUseCase();
    order = _getCurrentOrderUseCase();
    emit(CreateOrderState.selectMeals(_meals, order));
  }

  Future<void> addMealsToOrder(Meal meal, int count) async {
    emit(const CreateOrderState.idle());
    await _addMealToCurrentOrderUseCase(meal, count);
    order = _getCurrentOrderUseCase();
    emit(CreateOrderState.selectMeals(_meals, order));
  }

  void goToSummary() {
    order = _getCurrentOrderUseCase();
    if (order != null && order!.orderMeals.isNotEmpty) {
      emit(CreateOrderState.loaded(order!));
    }
  }

  void goBackToSelectMeals() {
    order = _getCurrentOrderUseCase();
    emit(CreateOrderState.selectMeals(_meals, order));
  }

  Future<void> sendCurrentOrder() async {
    emit(const CreateOrderState.loading());
    if (order == null) return;
    int orderNumber = await _addOrderUseCase(order!);
    _lastSentOrder = order!.copyWith(number: orderNumber);
    emit(CreateOrderState.showOrderSuccesfullyAddedDialog(orderNumber, _lastSentOrder!.getSumPrice()));
    _clearCurrentOrderUseCase();
    order = null;
    emit(const CreateOrderState.idle());
    await Future.delayed(const Duration(microseconds: 200));
    if (isClosed) return;
    order = _getCurrentOrderUseCase();
    emit(CreateOrderState.selectMeals(_meals, order));
  }

  Future<void> deliverLastOrder() async {
    if (_lastSentOrder == null) return;
    await _deleteOrderUseCase(_lastSentOrder!);
    _lastSentOrder = null;
  }

  void addNoteToOrder(String note) => _addNoteToCurrentOrderUseCase(note);

  void onDeleteOrderMeal(OrderMeal orderMeal) {
    emit(const CreateOrderState.idle());
    _deleteCurrentOrderMealUseCase(orderMeal);
    order = _getCurrentOrderUseCase();
    if (order == null || order!.orderMeals.isEmpty) {
      emit(CreateOrderState.selectMeals(_meals, order));
    } else {
      emit(CreateOrderState.loaded(order!));
    }
  }

  void onEditOrderMealCount(OrderMeal orderMeal, int count) {
    emit(const CreateOrderState.idle());
    _editCurrentOrderMealCountUseCase(orderMeal, count);
    order = _getCurrentOrderUseCase();
    emit(CreateOrderState.loaded(order!));
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    return super.close();
  }

  Future<void> _listenToMainStream() async {
    await _streamSubscription?.cancel();
    _streamSubscription = _subscribeMainStreamUseCase().listen((event) async {
      if (isClosed) return;
      if (event is MealsAddToCurrentOrder) {
        order = _getCurrentOrderUseCase();
        if (state is Loaded) {
          emit(const CreateOrderState.idle());
          emit(CreateOrderState.loaded(order!));
        } else {
          emit(const CreateOrderState.idle());
          emit(CreateOrderState.selectMeals(_meals, order));
        }
      }
    });
  }
}
