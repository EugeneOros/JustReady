import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/select_meal_title.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/selected_meal_card/meal_card.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/selected_meals_botom_box.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:collection/collection.dart';

class SelectMealsLoadedBody extends HookWidget {
  final List<Meal> meals;
  final Function(int, Meal) addMealToOrder;
  final Order? order;

  const SelectMealsLoadedBody({
    super.key,
    required this.meals,
    required this.addMealToOrder,
    this.order,
  });

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );

    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: Dimens.xc),
                    Padding(
                      padding: const EdgeInsets.all(Dimens.s),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        direction: Axis.horizontal,
                        children: List.generate(
                          meals.length,
                          (index) => MealCard(
                            meal: meals[index],
                            orderCount: order?.orderMeals
                                    .firstWhereOrNull((orderMeal) => orderMeal.meal.number == meals[index].number)
                                    ?.count ??
                                0,
                            onAddToOrder: (number) {
                              addMealToOrder(number, meals[index]);
                            },
                            onMealAddedToOrder: (meal) {},
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: Dimens.xxc),
                  ],
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
        });
  }
}
