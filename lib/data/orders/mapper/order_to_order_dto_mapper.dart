import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/data/orders/models/order_dto.dart';
import 'package:just_ready/domain/orders/models/Order.dart';

@injectable
class OrderToOrderDtoMapper {
  OrderToOrderDtoMapper();

  OrderDto call(Order order) => OrderDto(
        id: order.id,
        note: order.note,
      );
}
