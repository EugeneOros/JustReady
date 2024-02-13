import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/data/orders/mapper/order_meal_to_order_meal_dto_mapper.dart';
import 'package:just_ready/data/orders/models/order_dto.dart';
import 'package:just_ready/domain/orders/models/order.dart';

@injectable
class OrderToOrderDtoMapper {
  final OrderMealToOrderMealDtoMapper _orderMealToOrderMealDtoMapper;

  OrderToOrderDtoMapper(
    this._orderMealToOrderMealDtoMapper,
  );

  OrderDto call(Order order, {int? orderNumber}) => OrderDto(
        note: order.note,
        number: orderNumber ?? order.number,
        createdDate:
            order.createdDate != null ? Timestamp.fromDate(order.createdDate!) : Timestamp.fromDate(DateTime.now()),
        orderMeals:
            order.orderMeals.map((orderMeal) => _orderMealToOrderMealDtoMapper(orderMeal)).toList(growable: false),
        status: order.status.name,
      );
}
