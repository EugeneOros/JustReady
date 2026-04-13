import 'package:flutter/material.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/domain/meals/models/meal_addon.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/select_meal_title.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/selected_meal_card/meal_card.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/selected_meals_botom_box.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:collection/collection.dart';

class SelectMealsLoadedBody extends StatelessWidget {
  final List<Meal> meals;
  final Function(int, Meal, List<MealAddon>) addMealToOrder;
  final Order? order;

  const SelectMealsLoadedBody({
    super.key,
    required this.meals,
    required this.addMealToOrder,
    this.order,
  });

  @override
  Widget build(BuildContext context) {
    final mainAxisExtent = meals.any((m) => m.addons.isNotEmpty) ? 285.0 : 230.0;
    return Stack(
      children: [
        GridView.builder(
          padding: const EdgeInsets.fromLTRB(Dimens.l, Dimens.xc, Dimens.l, Dimens.xxxc),
          cacheExtent: 500,
          addAutomaticKeepAlives: false,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 280,
            crossAxisSpacing: Dimens.xl,
            mainAxisSpacing: Dimens.xl,
            mainAxisExtent: mainAxisExtent,
          ),
          itemCount: meals.length,
          itemBuilder: (context, index) => MealCard(
            meal: meals[index],
            index: index,
            orderCount: order?.orderMeals
                    .firstWhereOrNull((orderMeal) => orderMeal.meal.number == meals[index].number)
                    ?.count ??
                0,
            onAddToOrder: (number, selectedAddons) {
              addMealToOrder(number, meals[index], selectedAddons);
            },
            onMealAddedToOrder: (meal) {},
          ),
        ),
        const Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: SelectMealTitle(),
        ),
        const Positioned(bottom: 0, right: 0, left: 0, child: SelectedMealBottomBox()),
      ],
    );
  }
}
