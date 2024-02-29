import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/select_meals/body/select_meals_loaded_body.dart';
import 'package:just_ready/presentation/page/select_meals/body/select_meals_loading_body.dart';
import 'package:just_ready/presentation/page/select_meals/cubit/select_meals_cubit.dart';
import 'package:just_ready/presentation/page/select_meals/cubit/select_meals_state.dart';
import 'package:just_ready/utils/hooks/use_once.dart';
import 'package:just_ready/utils/ignore_else_state.dart';

class SelectMealsPage extends HookWidget {
  const SelectMealsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<SelectMealsCubit>();
    final state = useBlocBuilder(cubit, buildWhen: _buildWhen);
    useBlocListener(cubit, _listener, listenWhen: _listenWhen);
    useOnce(cubit.init);

    return Scaffold(
      backgroundColor: context.colors.transparent,
      extendBodyBehindAppBar: true,
      body: state.maybeWhen(
        loaded: (meals, currentOrder) => SelectMealsLoadedBody(
          meals: meals,
          addMealToOrder: (mealCount, meal) => cubit.addMealsToOrder(meal, mealCount),
          order: currentOrder,
        ),
        loading: () => const SlectMealsLoadingBody(),
        orElse: SizedBox.shrink,
      ),
    );
  }

  bool _buildWhen(SelectMealsState state) => state is SelectMealsStateBuilder;
  bool _listenWhen(SelectMealsState state) => state is SelectMealsStateListener;

  void _listener(SelectMealsCubit bloc, SelectMealsState state, BuildContext context) => state.maybeWhen(
        showMealAddedSnackBar: () => context.showSteelSnackBar(message: Strings.current.scelectedMealAddedToOrder),
        showErrorSnackBar: context.showSteelSnackBar,
        orElse: doNothing,
      );
}
