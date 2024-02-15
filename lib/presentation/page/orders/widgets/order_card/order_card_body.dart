import 'package:flutter/material.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/presentation/page/orders/widgets/order_meal_row.dart';
import 'package:just_ready/presentation/widgets/jr_divider.dart';
import 'package:just_ready/presentation/widgets/jr_fade_end_stack.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';

class OrderCardBody extends StatelessWidget {
  final Order order;
  final Function(Order, int) toggleOrderMealIsDone;

  const OrderCardBody({
    super.key,
    required this.order,
    required this.toggleOrderMealIsDone,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // const SizedBox(height: Dimens.xs),
          Expanded(
            child: JrFadeEndStack(
              fadeHeight: Dimens.xxxl,
              child: ListView(
                shrinkWrap: true,
                children: [
                  const SizedBox(height: Dimens.m),
                  ...order.orderMeals.map(
                    (orderMeal) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimens.m),
                      child: OrderMealRow(
                        orderMeal: orderMeal,
                        toggleOrderMealIsDone: () => toggleOrderMealIsDone(order, orderMeal.meal.number),
                      ),
                    ),
                  ),
                  const SizedBox(height: Dimens.xm),
                ],
              ),
            ),
          ),
          if (order.note.isNotEmpty) ...[
            const JrDivider(isVertical: false),
            Container(
              constraints: const BoxConstraints(maxHeight: Dimens.sHeight),
              child: JrFadeEndStack(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(Dimens.xm, Dimens.xm, Dimens.xm, Dimens.l),
                    child: JrText(
                      order.note,
                      maxLines: 30,
                    ),
                  ),
                ),
              ),
            ),
          ]
        ],
      );
}
