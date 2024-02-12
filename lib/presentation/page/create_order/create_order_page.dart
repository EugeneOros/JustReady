import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/create_order/body/create_order_loaded_body.dart';
import 'package:just_ready/presentation/page/create_order/body/create_order_loaded_empty_body.dart';
import 'package:just_ready/presentation/page/create_order/body/create_order_loading_body.dart';
import 'package:just_ready/presentation/page/create_order/cubit/create_order_cubit.dart';
import 'package:just_ready/presentation/page/create_order/cubit/create_order_state.dart';
import 'package:just_ready/presentation/page/home/home_page.dart';
import 'package:just_ready/presentation/widgets/jr_app_bar.dart';
import 'package:just_ready/presentation/widgets/jr_dialog.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
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
    useBlocListener(cubit, _listener);
    useOnce(cubit.init);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: JrAppBar(
        skipStartIcon: false,
        startIcon: IconsSvg.menu24,
        onStartIconTap: (_) {
          homeKey.currentState!.openDrawer();
        },
        title: Strings.of(context).yourOrder,
      ),
      body: state.maybeWhen(
        loadedEmpty: () => const CreateOrderLoadedEmptyBody(),
        loaded: (order) => CreateOrderLoadedBody(
          order: order,
          onDeleteMeal: cubit.onDeleteOrderMeal,
          onEditMealCount: cubit.onEditOrderMealCount,
          onAditionalInstructionChanged: cubit.addNoteToOrder,
          sendOrder: cubit.sendCurrentOrder,
        ),
        loading: () => const CreateOrderLoadingBody(),
        orElse: SizedBox.shrink,
      ),
    );
  }

  bool _buildWhen(CreateOrderState state) => state is Loaded || state is LoadedEmpty || state is Loading;

  void _listener(CreateOrderCubit cubit, CreateOrderState state, BuildContext context) => state.maybeWhen(
        showOrderSuccesfullyAddedDialog: (orderNumber) => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => JrDialog(
            // titleIcon: Assets.icons.download.svg(),
            title: Strings.of(context).yourOrderNumber,
            actionText: Strings.of(context).ok,
            actionButtonOnTap: () => context.pop(),
            child: Container(
              width: Dimens.xxc,
              height: Dimens.xxc,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colors.secondary,
                border: Border.all(
                  width: Dimens.xxxs,
                ),
              ),
              child: Center(
                child: JrText(
                  orderNumber.toString(),
                  style: context.typography.header1,
                  color: context.colors.background,
                ),
              ),
            ),
          ),
        ),
        orElse: doNothing,
      );
}
