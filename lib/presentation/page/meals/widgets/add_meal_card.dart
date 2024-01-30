import 'package:flutter/material.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/presentation/page/meals/widgets/meal_card/meals_card.dart';
import 'package:just_ready/presentation/widgets/jr_animated_switcher.dart';
import 'package:just_ready/styles/images.dart';
import 'package:just_ready/utils/ignore_else_state.dart';

class AddMealCard extends StatelessWidget {
  final List<Meal> meals;
  final bool showAddMeals;
  final Function(Meal) onAddMeals;
  final Function onCancel;
  final int? Function() getFreeMealNumber;
  const AddMealCard({
    super.key,
    required this.meals,
    required this.showAddMeals,
    required this.onAddMeals,
    required this.onCancel,
    required this.getFreeMealNumber,
  });

  @override
  Widget build(BuildContext context) {
    int? number = getFreeMealNumber();
    if (number == null) return const SizedBox.shrink();
    return JrAnimatedSeitcher(
      child: showAddMeals
          ? MealCard(
            actionIcon: IconsSvg.createMeal24,
              setIsEditing: (_) => doNothing(),
              isEditing: showAddMeals,
              meals: meals,
              meal: Meal(
                name: '',
                id: '',
                mealNumber: number,
                price: 0.0,
              ),
              onCancel: onCancel,
              onEdit: onAddMeals,
            )
          : const SizedBox.shrink(),
    );
  }
}
