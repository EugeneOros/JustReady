import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/page/meals/widgets/add_meal_card.dart';
import 'package:just_ready/presentation/page/meals/widgets/meal_card/meal_card.dart';
import 'package:just_ready/styles/dimens.dart';

class MealsLoadedBody extends HookWidget {
  final List<Meal> meals;
  final Function(Meal, int) onCreateEditMeal;
  final Function(int)? onDeleteMeal;
  final int? Function() getFreeMealNumber;
  final bool showAddMeal;
  final Function(Meal, int) onMealAdded;
  final Function() hideAddMealCard;
  final void Function(int oldIndex, int newIndex) onReorder;

  const MealsLoadedBody({
    super.key,
    required this.meals,
    required this.onCreateEditMeal,
    required this.onDeleteMeal,
    required this.getFreeMealNumber,
    required this.showAddMeal,
    required this.onMealAdded,
    required this.hideAddMealCard,
    required this.onReorder,
  });

  @override
  Widget build(BuildContext context) {
    final selectedMealIndex = useState<int?>(null);

    return Column(
      children: [
        const SizedBox(height: Dimens.bannerHeight),
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
        Expanded(
          child: ReorderableListView.builder(
            itemCount: meals.length,
            onReorder: onReorder,
            buildDefaultDragHandles: false,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => Stack(
              key: ValueKey(meals[index].name),
              children: [
                MealCard(
                  meals: meals,
                  meal: meals[index],
                  onEdit: onCreateEditMeal,
                  onDelete: onDeleteMeal,
                  isEditing: selectedMealIndex.value == index,
                  setIsEditing: (value) {
                    selectedMealIndex.value = value == true ? index : null;
                    hideAddMealCard();
                  },
                ),
                if (selectedMealIndex.value != index)
                  Positioned.fill(
                    child: Align(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: Dimens.lWidth),
                        padding: const EdgeInsets.only(left: 2),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Listener(
                            onPointerDown: (_) {
                              selectedMealIndex.value = null;
                              hideAddMealCard();
                            },
                            child: ReorderableDragStartListener(
                              index: index,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                                child: Icon(
                                  Icons.drag_indicator,
                                  size: 18,
                                  color: context.colors.secondary.withValues(alpha: 0.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
