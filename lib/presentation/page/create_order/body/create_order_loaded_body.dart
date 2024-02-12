import 'package:flutter/material.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/models/order_meal.dart';
import 'package:just_ready/presentation/page/create_order/widgets/create_order_bottom_box.dart';
import 'package:just_ready/presentation/page/create_order/widgets/order_meal_card.dart';
import 'package:just_ready/styles/dimens.dart';

class CreateOrderLoadedBody extends StatelessWidget {
  final Order order;
  final Function(OrderMeal) onDeleteMeal;
  final Function(String) onAditionalInstructionChanged;
  final Function(OrderMeal, int) onEditMealCount;
  final Function() sendOrder;

  const CreateOrderLoadedBody({
    super.key,
    required this.order,
    required this.onDeleteMeal,
    required this.onEditMealCount,
    required this.onAditionalInstructionChanged,
    required this.sendOrder,
  });

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned.fill(
            child: ListView(
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: order.orderMeals.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return OrderMealCard(
                      orderMeal: order.orderMeals[index],
                      onEditCount: (count) => onEditMealCount(order.orderMeals[index], count),
                      onDelete: () => onDeleteMeal(order.orderMeals[index]),
                    );
                  },
                ),
                const SizedBox(height: Dimens.xxxxc + Dimens.xxxxc)
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: CreateOrderBottomBox(
              order: order,
              onAditionalInstructionChanged: onAditionalInstructionChanged,
              sendOrder: sendOrder,
            ),
          ),
        ],
      );
}
