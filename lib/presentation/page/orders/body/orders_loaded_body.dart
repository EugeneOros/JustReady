import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/models/order_status.dart';
import 'package:just_ready/presentation/page/orders/widgets/order_card/order_card.dart';
import 'package:just_ready/styles/dimens.dart';

class OrdersLoadedBody extends HookWidget {
  final List<Order> orders;
  final Function(Order, int) toggleOrderMealIsDone;
  final Function(Order, OrderStatus) updateOrderStatus;
  final Function(Order) deleteOrder;

  const OrdersLoadedBody({
    super.key,
    required this.orders,
    required this.toggleOrderMealIsDone,
    required this.updateOrderStatus,
    required this.deleteOrder,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: ImplicitlyAnimatedList<Order>(
          // itemCount: orders.length,
          items: orders,
          areItemsTheSame: (a, b) => a.number == b.number,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,

          itemBuilder: (context, animation, item, index) => SizeFadeTransition(
            curve: Curves.easeInOut,
            axis: Axis.horizontal,
            animation: animation,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimens.m, horizontal: Dimens.s),
              child: OrderCard(
                order: item,
                toggleOrderMealIsDone: toggleOrderMealIsDone,
                updateOrderStatus: updateOrderStatus,
                onDeleteOrder: deleteOrder,
              ),
            ),
          ),
        ),
      );
}
