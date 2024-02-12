import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/data/orders/mapper/order_meal_dto_to_order_meal_mapper.dart';
import 'package:just_ready/data/orders/models/order_dto.dart';
import 'package:just_ready/domain/orders/models/order.dart';

@injectable
class OrderDtoToOrderMapper {
  final OrderMealDtoToOrderMealMapper _orderMealDtoToOrderMealMapper;

  OrderDtoToOrderMapper(this._orderMealDtoToOrderMealMapper);

  Order call(OrderDto dto) => Order(
        orderNumber: dto.number,
        note: dto.note,
        createdDate: dto.createdDate.toDate().toUtc(),
        orderMeals: dto.orderMeals.map((mealDto) => _orderMealDtoToOrderMealMapper(mealDto)).toList(growable: false),
      );
}
