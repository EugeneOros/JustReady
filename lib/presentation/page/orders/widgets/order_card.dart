import 'package:flutter/material.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/models/order_status.dart';
import 'package:just_ready/presentation/page/orders/widgets/order_meal_row.dart';
import 'package:just_ready/presentation/page/orders/widgets/order_status_dropdown.dart';
import 'package:just_ready/presentation/widgets/jr_container.dart';
import 'package:just_ready/presentation/widgets/jr_number_circle.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  final Function(Order, int) toggleOrderMealIsDone;
  final Function(Order, OrderStatus) updateOrderStatus;
  const OrderCard({
    super.key,
    required this.order,
    required this.toggleOrderMealIsDone,
    required this.updateOrderStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: JrContainer(
            showShadow: false,
            isAnimated: true,
            borderRadius: Dimens.ms,
            width: Dimens.orderCardWidth,
            // height: Dimens.sDialogWidth,
            margin: const EdgeInsets.all(Dimens.xm),
            padding: const EdgeInsets.all(Dimens.m),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: Dimens.l),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: order.orderMeals
                        .map(
                          (orderMeal) => OrderMealRow(
                            orderMeal: orderMeal,
                            toggleOrderMealIsDone: () => toggleOrderMealIsDone(order, orderMeal.meal.number),
                          ),
                        )
                        .toList(growable: false),
                  ),
                ),

                // JrText(order.orderMeals.toString()),
                JrText(order.note),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: JrNumberCircle(
            number: order.number!,
            size: NumberCircleSize.l,
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: Center(
              child: OrderStatusDropDown(
            currentStatus: order.status,
            onStatusChanged: (status) => updateOrderStatus(order, status),
          )),
        ),
      ],
    );
  }
}
