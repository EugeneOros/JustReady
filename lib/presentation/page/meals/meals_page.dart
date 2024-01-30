import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/page/meals/cubit/meals_cubit.dart';
import 'package:just_ready/presentation/page/meals/cubit/meals_state.dart';
import 'package:just_ready/presentation/page/meals/widgets/add_meal_card.dart';
import 'package:just_ready/presentation/page/meals/widgets/header_row.dart';
import 'package:just_ready/presentation/page/meals/widgets/meal_card/meals_card.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';
import 'package:just_ready/utils/hooks/use_once.dart';

class MealsPage extends HookWidget {
  const MealsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<MealsCubit>();
    final state = useBlocBuilder(cubit, buildWhen: _buildWhen);
    final showAddMeal = useState<bool>(false);
    final selectedMealIndex = useState<int?>(null);

    useOnce(cubit.init);

    return state.maybeWhen(
      loaded: (meals) => Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Container(
                  color: context.colors.primary,
                  height: 200,
                  width: double.infinity,
                  child: Image.asset(
                    Illustrations.banner,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: context.colors.primary,
                  height: Dimens.l,
                )
              ],
            ),
          ),
          ListView(
            children: [
              MealHeaderRow(onAddMeal: () {
                showAddMeal.value = true;
                selectedMealIndex.value = null;
              }),
              const SizedBox(height: Dimens.c),
              AddMealCard(
                meals: meals,
                showAddMeals: showAddMeal.value,
                onAddMeals: (meal) {
                  cubit.createEditMeal(meal);
                  showAddMeal.value = false;
                },
                onCancel: () => showAddMeal.value = false,
                getFreeMealNumber: cubit.getFreeMealNumber,
              ),
              ListView.builder(
                itemCount: meals.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return MealCard(
                    meals: meals,
                    meal: meals[index],
                    onEdit: (meal) => cubit.createEditMeal(meal),
                    onDelete: (mealId) => cubit.deleteMeal(mealId),
                    isEditing: selectedMealIndex.value == index,
                    setIsEditing: (value) {
                      selectedMealIndex.value = value == true ? index : null;
                      showAddMeal.value = false;
                    },
                  );
                },
              ),
              // ...meals.map(
              //   (meal) => MealCard(
              //     meals: meals,
              //     meal: meal,
              //     onEdit: (meal) => cubit.createEditMeal(meal),
              //     onDelete: (mealId) => cubit.deleteMeal(mealId),
              //   ),
              // ),
              const SizedBox(height: Dimens.xxxxc),
            ],
          ),
        ],
      ),
      orElse: SizedBox.shrink,
    );
  }

  bool _buildWhen(MealsState state) => state is MealsStateLoaded; // || state is MealsStateLoading;
}
