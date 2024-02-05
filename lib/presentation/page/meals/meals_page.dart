import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/meals/cubit/meals_cubit.dart';
import 'package:just_ready/presentation/page/meals/cubit/meals_state.dart';
import 'package:just_ready/presentation/page/meals/widgets/add_meal_card.dart';
import 'package:just_ready/presentation/page/meals/widgets/meal_card/meal_card.dart';
import 'package:just_ready/presentation/widgets/jr_app_bar.dart';
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
      loaded: (meals) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: JrAppBar(
          title: Strings.of(context).meals,
          endIcon: IconsSvg.plus24,
          onEndIconTap: (_) {
            showAddMeal.value = true;
            selectedMealIndex.value = null;
          },
        ),
        body: ListView(
          children: [
            const SizedBox(height: Dimens.m),
            Material(
              color: context.colors.transparent,
              child: AddMealCard(
                meals: meals,
                showAddMeals: showAddMeal.value,
                onAddMeals: (meal) {
                  cubit.createEditMeal(meal);
                  showAddMeal.value = false;
                },
                onCancel: () => showAddMeal.value = false,
                getFreeMealNumber: cubit.getFreeMealNumber,
              ),
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
            const SizedBox(height: Dimens.xxxxc),
          ],
        ),
      ),
      orElse: SizedBox.shrink,
    );
  }

  bool _buildWhen(MealsState state) => state is MealsStateLoaded; // || state is MealsStateLoading;
}
