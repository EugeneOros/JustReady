import 'package:flutter/material.dart';
import 'package:just_ready/domain/orders/models/order_meal.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/widgets/jr_chek_box.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';

class OrderMealRow extends StatelessWidget {
  final OrderMeal orderMeal;

  final Function toggleOrderMealIsDone;
  const OrderMealRow({
    super.key,
    required this.orderMeal,
    required this.toggleOrderMealIsDone,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = orderMeal.isDone ? context.colors.disabled : orderMeal.meal.getColor();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.m),
      child: JrCheckBox(
        onCheckedChanged: (_) => toggleOrderMealIsDone(),
        isChecked: orderMeal.isDone,
        color: color,
        child: Row(
          children: [
            Expanded(
              child: JrText(
                orderMeal.meal.name,
                style: context.typography.body1,
                maxLines: 5,
                color: color,
                lineThrough: orderMeal.isDone,
              ),
            ),
            const SizedBox(width: Dimens.s),
            // Container(
            //   width: Dimens.xl,
            //   padding: const EdgeInsets.all(Dimens.s),
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: context.colors.transparent,
            //     border: Border.all(color: color, width: Dimens.xxxs),
            //   ),
            //   child: Center(
            //     child: JrText(
            //       '${orderMeal.count}x',
            //       color: color,
            //       style: context.typography.body3,
            //     ),
            //   ),
            // ),
            JrText(
              '${orderMeal.count}x',
              style: context.typography.body1,
              color: color,
            )
          ],
        ),
      ),
    );
  }
}
