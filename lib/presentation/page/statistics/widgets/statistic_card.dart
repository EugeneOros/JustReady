import 'package:flutter/material.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/page/statistics/models/statistic.dart';
import 'package:just_ready/presentation/widgets/jr_container.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';

class StatisticCard extends StatelessWidget {
  final Meal meal;
  final Statistic statistic;
  const StatisticCard({
    super.key,
    required this.meal,
    required this.statistic,
  });

  @override
  Widget build(BuildContext context) => JrContainer(
      padding: const EdgeInsets.all(Dimens.m),
      margin: const EdgeInsets.all(Dimens.m),
      height: Dimens.xsHeight,
      width: Dimens.mWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          JrText(
            meal.name,
            style: context.typography.header3,
          ),
          const SizedBox(height: Dimens.m),
          JrText(
            'liczba: ${statistic.orderMeals.length}',
            style: context.typography.body1,
          ),
          const SizedBox(height: Dimens.m),
          JrText(
            'cena: ${statistic.price} zł',
            style: context.typography.body1,
          ),
        ],
      ));
}
