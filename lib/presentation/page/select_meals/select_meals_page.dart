import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/select_meals/body/select_meals_loaded_body.dart';
import 'package:just_ready/presentation/page/select_meals/body/select_meals_loading_body.dart';
import 'package:just_ready/presentation/page/select_meals/cubit/select_meals_cubit.dart';
import 'package:just_ready/presentation/widgets/jr_app_bar.dart';
import 'package:just_ready/utils/hooks/use_once.dart';

class SelectMealsPage extends HookWidget {
  const SelectMealsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<SelectMealsCubit>();
    final state = useBlocBuilder(cubit);
    useOnce(cubit.init);

    final selectedMealIndex = useState<int?>(null);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: JrAppBar(
        skipStartIcon: false,
        title: Strings.of(context).scelectMeal,
      ),
      body: state.maybeWhen(
        loaded: (meals) => SelectMealsLoadedBody(
          meals: meals,
          selectedMealIndex: selectedMealIndex.value,
          changeSelectedIndex: (newIndex) => selectedMealIndex.value = newIndex,
          addMealToOrder: (mealCount) => cubit.addMealsToOrder(meals[selectedMealIndex.value!], mealCount),
        ),
        loading: () => const SlectMealsLoadingBody(),
        orElse: SizedBox.shrink,
      ),
    );
  }
}
