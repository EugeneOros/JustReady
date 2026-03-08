import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/create_order/body/create_order_loaded_body.dart';
import 'package:just_ready/presentation/page/create_order/body/create_order_loading_body.dart';
import 'package:just_ready/presentation/page/create_order/body/create_order_select_meals_body.dart';
import 'package:just_ready/presentation/page/create_order/cubit/create_order_cubit.dart';
import 'package:just_ready/presentation/page/create_order/cubit/create_order_state.dart';
import 'package:just_ready/presentation/page/create_order/widgets/create_order_step_indicator.dart';
import 'package:just_ready/presentation/page/home/home_page.dart';
import 'package:just_ready/presentation/widgets/dialogs/jr_number_dialog.dart';
import 'package:just_ready/presentation/widgets/jr_app_bar.dart';
import 'package:just_ready/presentation/widgets/jr_imaged_body.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';
import 'package:just_ready/utils/hooks/use_once.dart';
import 'package:just_ready/utils/ignore_else_state.dart';

class CreateOrderPage extends HookWidget {
  const CreateOrderPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<CreateOrderCubit>();
    final state = useBlocBuilder(cubit, buildWhen: _buildWhen);
    useBlocListener(cubit, _listener, listenWhen: _listenWhen);
    useOnce(cubit.init);

    final currentStep = state is SelectMeals ? 1 : state is Loaded ? 2 : 0;

    return Scaffold(
      appBar: JrAppBar(
        skipStartIcon: false,
        startIcon: IconsSvg.menu24,
        height: Dimens.xxc,
        onStartIconTap: (_) {
          homeKey.currentState!.openDrawer();
        },
        title: Strings.of(context).yourOrder,
      ),
      body: JrImagedBody(
        child: Column(
          children: [
            if (currentStep > 0) CreateOrderStepIndicator(currentStep: currentStep),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: state.maybeWhen(
                  selectMeals: (meals, currentOrder) => CreateOrderSelectMealsBody(
                    key: const ValueKey('selectMeals'),
                    meals: meals,
                    currentOrder: currentOrder,
                    addMealToOrder: (count, meal) => cubit.addMealsToOrder(meal, count),
                    onNext: cubit.goToSummary,
                  ),
                  loaded: (order) => CreateOrderLoadedBody(
                    key: const ValueKey('loaded'),
                    order: order,
                    onDeleteMeal: cubit.onDeleteOrderMeal,
                    onEditMealCount: cubit.onEditOrderMealCount,
                    onAditionalInstructionChanged: cubit.addNoteToOrder,
                    sendOrder: cubit.sendCurrentOrder,
                    onAddMoreMeals: cubit.goBackToSelectMeals,
                  ),
                  loading: () => const CreateOrderLoadingBody(),
                  orElse: SizedBox.shrink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _buildWhen(CreateOrderState state) => state is CreateOrderStateBuilder;
  bool _listenWhen(CreateOrderState state) => state is CreateOrderStateListener;

  void _listener(CreateOrderCubit cubit, CreateOrderState state, BuildContext context) => state.maybeWhen(
        showOrderSuccesfullyAddedDialog: (orderNumber, price) async {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return JrNumberDialog(
                title: Strings.of(context).yourOrderWasCreated,
                titleTextStyle: context.typography.header3,
                number: orderNumber,
                price: price,
                actionText: Strings.of(context).ok,
                actionButtonOnTap: () => context.pop(),
                secondaryActionText: Strings.of(context).delivered,
                secondaryActionColor: context.colors.red,
                secondaryActionButtonOnTap: () {
                  cubit.deliverLastOrder();
                  context.pop();
                },
              );
            },
          );
          return null;
        },
        orElse: doNothing,
      );
}
