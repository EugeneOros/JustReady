import 'package:flutter/material.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/meal_number_item.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/selected_meal_card.dart';
import 'package:just_ready/presentation/widgets/jr_animated_switcher.dart';
import 'package:just_ready/styles/dimens.dart';

class SelectMealsLoadedBody extends StatelessWidget {
  final List<Meal> meals;
  final int? selectedMealIndex;
  final Function(int?) changeSelectedIndex;
  final Function(int) addMealToOrder;

  const SelectMealsLoadedBody({
    super.key,
    required this.meals,
    required this.selectedMealIndex,
    required this.changeSelectedIndex,
    required this.addMealToOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: Dimens.l + Dimens.bannerHeight),
                Wrap(
                  alignment: WrapAlignment.start,
                  direction: Axis.horizontal,
                  children: List.generate(
                    meals.length,
                    (index) => MealNumberItem(
                      number: meals[index].mealNumber,
                      isSelected: selectedMealIndex == index,
                      onSelect: (select) {
                        changeSelectedIndex(select ? index : null);
                        // selectedMealIndex.value = select ? index : null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height:
                      Dimens.navBarHeight + (selectedMealIndex != null ? Dimens.selectedMealCardHeight : 0) + Dimens.l,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0, // Dimens.navBarHeight,
          right: 0,
          left: 0,
          child: JrAnimatedSwitcher(
            child: selectedMealIndex != null
                ? SelctedMealCard(
                    meal: meals[selectedMealIndex!],
                    onAddMealToOrder: (mealCount) {
                      addMealToOrder(mealCount);
                      changeSelectedIndex(null);
                    },
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
