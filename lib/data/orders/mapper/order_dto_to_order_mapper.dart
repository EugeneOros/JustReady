import 'package:injectable/injectable.dart' hide Order;
import 'package:just_ready/data/orders/models/order_dto.dart';
import 'package:just_ready/domain/orders/models/Order.dart';

@injectable
class OrderDtoToOrderMapper {
  OrderDtoToOrderMapper();

  Order call(OrderDto dto) => Order(
        id: dto.id,
        orderNumber: 2,
        note: dto.note,
        mealNumbersMap: <int, int>{}
      );
}
