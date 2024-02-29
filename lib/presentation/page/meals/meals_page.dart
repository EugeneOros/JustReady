import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/home/home_page.dart';
import 'package:just_ready/presentation/page/meals/body/meals_loaded_body.dart';
import 'package:just_ready/presentation/page/meals/body/meals_loading_body.dart';
import 'package:just_ready/presentation/page/meals/cubit/meals_cubit.dart';
import 'package:just_ready/presentation/page/meals/cubit/meals_state.dart';
import 'package:just_ready/presentation/widgets/jr_app_bar.dart';
import 'package:just_ready/presentation/widgets/jr_imaged_body.dart';
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

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: JrAppBar(
        title: Strings.of(context).meals,
        endIcon: state is MealsStateLoaded ? IconsSvg.plus24 : null,
        skipStartIcon: false,
        startIcon: IconsSvg.menu24,
        onStartIconTap: (_) => homeKey.currentState!.openDrawer(),
        onEndIconTap: (_) {
          showAddMeal.value = true;
          selectedMealIndex.value = null;
        },
      ),
      body: JrImagedBody(
        child: state.maybeWhen(
          loaded: (meals) => MealsLoadedBody(
            meals: meals,
            onCreateEditMeal: cubit.createEditMeal,
            onDeleteMeal: cubit.deleteMeal,
            getFreeMealNumber: cubit.getFreeMealNumber,
            onMealAdded: (meal, number) {
              cubit.createEditMeal(meal, number);
              showAddMeal.value = false;
            },
            showAddMeal: showAddMeal.value,
            hideAddMealCard: () => showAddMeal.value = false,
          ),
          loading: () => const MealsLoadingBody(),
          orElse: SizedBox.shrink,
        ),
      ),
    );
  }

  bool _buildWhen(MealsState state) => state is MealsStateBuilder;
}
