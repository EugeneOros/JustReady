// import 'package:animated_list_plus/animated_list_plus.dart';
// import 'package:animated_list_plus/transitions.dart';
import 'package:auto_animated/auto_animated.dart';
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
        LiveList.options(
          itemCount: meals.length,
          physics: const NeverScrollableScrollPhysics(),
          options: const LiveOptions(
            // delay: Duration(seconds: 1),
            showItemInterval: Duration(milliseconds: 10),

            // Animation duration (default 250)
            showItemDuration: Duration(milliseconds: 200),

            // Animations starts at 0.05 visible
            // item fraction in sight (default 0.025)
            visibleFraction: 0.05,

            // Repeat the animation of the appearance
            // when scrolling in the opposite direction (default false)
            // To get the effect as in a showcase for ListView, set true
            reAnimateOnVisibility: false,
          ),
          // areItemsTheSame: (a, b) => a.number == b.number,
          shrinkWrap: true,
          itemBuilder: (context, index, animation) => FadeTransition(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, -0.1),
                end: Offset.zero,
              ).animate(animation),
              child: MealCard(
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
            ),
          ),
        ),
        // ImplicitlyAnimatedList<Meal>(
        //   items: meals,
        //   physics: const NeverScrollableScrollPhysics(),
        //   areItemsTheSame: (a, b) => a.number == b.number,
        //   shrinkWrap: true,
        //   itemBuilder: (context, animation, item, index) => SizeFadeTransition(
        //     curve: Curves.easeInOut,
        //     animation: animation,
        //     child: MealCard(
        //       meals: meals,
        //       meal: item,
        //       onEdit: onCreateEditMeal,
        //       onDelete: onDeleteMeal,
        //       isEditing: selectedMealIndex.value == index,
        //       setIsEditing: (value) {
        //         selectedMealIndex.value = value == true ? index : null;
        //         hideAddMealCard();
        //       },
        //     ),
        //   ),
        // ),
        const SizedBox(height: Dimens.xxxxc),
      ],
    );
  }
}
