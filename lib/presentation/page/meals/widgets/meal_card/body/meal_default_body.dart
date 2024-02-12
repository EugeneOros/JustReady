import 'package:flutter/material.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/widgets/jr_divider.dart';
import 'package:just_ready/presentation/widgets/jr_price.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';

class MealDefaultBody extends StatelessWidget {
  final Meal meal;

  const MealDefaultBody({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            // alignment: Alignment.center,
            padding: const EdgeInsets.only(left: Dimens.xl, right: Dimens.m),
            child: JrText(
              meal.name,
              overflow: TextOverflow.ellipsis,
              color: context.colors.dark,
            ),
          ),
        ),
        const JrDivider(),
        SizedBox(
          width: Dimens.xxxc,
          child: JrPrice(
            price: meal.price,
          ),
        ),
      ],
    );
  }
}
