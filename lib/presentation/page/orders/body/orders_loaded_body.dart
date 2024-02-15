import 'package:flutter/material.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/models/order_status.dart';
import 'package:just_ready/presentation/page/orders/widgets/order_card/order_card.dart';
import 'package:just_ready/styles/dimens.dart';

class OrdersLoadedBody extends StatelessWidget {
  final List<Order> orders;
  final Function(Order, int) toggleOrderMealIsDone;
  final Function(Order, OrderStatus) updateOrderStatus;
  final Function(Order) deleteOrdeer;

  const OrdersLoadedBody({
    super.key,
    required this.orders,
    required this.toggleOrderMealIsDone,
    required this.updateOrderStatus, 
    required this.deleteOrdeer,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: orders.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimens.m, horizontal: Dimens.s),
              child: OrderCard(
                order: orders[index],
                toggleOrderMealIsDone: toggleOrderMealIsDone,
                updateOrderStatus: updateOrderStatus,
                onDeleteOrder: () => deleteOrdeer(orders[index]),
              ),
            );
          },
        ),
      );
}
