import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/page/meals/widgets/add_meal_card.dart';
import 'package:just_ready/presentation/page/meals/widgets/meal_card/meal_card.dart';
import 'package:just_ready/styles/dimens.dart';

class MealsLoadedBody extends HookWidget {
  final List<Meal> meals;
  final Function(Meal) onCreateEditMeal;
  final Function(String)? onDeleteMeal;
  final int? Function() getFreeMealNumber;
  final bool showAddMeal;
  final Function(Meal) onMealAdded;
  final Function() hideAddMealCard;

  const MealsLoadedBody({
    super.key,
    required this.meals,
    required this.onCreateEditMeal,
    required this.onDeleteMeal,
    required this.getFreeMealNumber,
    required this.showAddMeal,
    required this.onMealAdded,
    required this.hideAddMealCard,
  });

  @override
  Widget build(BuildContext context) {
    final selectedMealIndex = useState<int?>(null);

    return ListView(
      children: [
        const SizedBox(height: Dimens.m),
        Material(
          color: context.colors.transparent,
          child: Builder(builder: (context) {
            return AddMealCard(
              meals: meals,
              showAddMeals: showAddMeal,
              onAddMeals: onMealAdded,
              onCancel: hideAddMealCard,
              getFreeMealNumber: getFreeMealNumber,
            );
          }),
        ),
        ListView.builder(
          itemCount: meals.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return MealCard(
              meals: meals,
              meal: meals[index],
              onEdit: onCreateEditMeal,
              onDelete: onDeleteMeal,
              isEditing: selectedMealIndex.value == index,
              setIsEditing: (value) {
                selectedMealIndex.value = value == true ? index : null;
                hideAddMealCard();
              },
            );
          },
        ),
        const SizedBox(height: Dimens.xxxxc),
      ],
    );
  }
}
