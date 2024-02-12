import 'package:flutter/material.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/meal_number_item.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/selected_meals_botom_box.dart';
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
                      number: meals[index].number,
                      isSelected: selectedMealIndex == index,
                      onSelect: (select) {
                        changeSelectedIndex(select ? index : null);
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
        if (selectedMealIndex != null)
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: SelectedMealBottomBox(
              meal: meals[selectedMealIndex!],
              addMealToOrder: addMealToOrder,
              changeSelectedIndex: changeSelectedIndex,
            ),
          ),
      ],
    );
  }
}
