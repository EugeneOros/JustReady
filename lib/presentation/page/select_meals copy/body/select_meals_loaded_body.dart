import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/domain/meals/models/meal.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/select_meals%20copy/widgets/meal_number_item.dart';
import 'package:just_ready/presentation/page/select_meals%20copy/widgets/selected_meal_card/selected_meal_card.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';

class SelectMealsLoadedBody extends HookWidget {
  final List<Meal> meals;
  final Function(int, Meal) addMealToOrder;

  const SelectMealsLoadedBody({
    super.key,
    required this.meals,
    required this.addMealToOrder,
  });

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );
    final showMealAddingProgress = useState(false);
    final selectedMealIndex = useState<int?>(null);

    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          final animation = Tween<Offset>(
            begin: const Offset(0, -1),
            end: const Offset(0, 0),
          ).animate(
            CurvedAnimation(
              parent: animationController,
              curve: Curves.easeOutCirc,
            ),
          );
          return Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: Dimens.m),
                      JrText(
                        Strings.of(context).selectMealNumber,
                        style: context.typography.header2,
                      ),
                      const SizedBox(height: Dimens.m),
                      Padding(
                        padding: const EdgeInsets.all(Dimens.s),
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          direction: Axis.horizontal,
                          children: List.generate(
                            meals.length,
                            (index) => MealNumberItem(
                              number: meals[index].number,
                              isSelected: selectedMealIndex.value == index,
                              onSelect: (select) async {
                                if (select) {
                                  if (selectedMealIndex.value != null) {
                                    await animationController.reverse();
                                  }
                                  showMealAddingProgress.value = false;
                                  selectedMealIndex.value = index;
                                  await animationController.forward();
                                } else {
                                  if (selectedMealIndex.value != null) {
                                    await animationController.reverse();
                                    selectedMealIndex.value = null;
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: (selectedMealIndex.value != null ? Dimens.selectedMealCardHeight : 0) + Dimens.l,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: animation.value.dy * 200,
                child: selectedMealIndex.value == null
                    ? const SizedBox.shrink()
                    : SelectedMealCard(
                        meal: meals[selectedMealIndex.value!],
                        showMealAddingProgress: showMealAddingProgress.value,
                        onAddToOrder: (number) {
                          if (selectedMealIndex.value != null) {
                            showMealAddingProgress.value = true;
                            addMealToOrder(number, meals[selectedMealIndex.value!]);
                          }
                        },
                        onMealAddedToOrder: (meal) async {
                          if (meals[selectedMealIndex.value!] == meal) {
                            await animationController.reverse();
                            selectedMealIndex.value = null;
                          }
                        },
                      ),
              ),
            ],
          );
        });
  }
}
