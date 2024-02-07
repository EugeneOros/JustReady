import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/create_order/body/create_order_loaded_body.dart';
import 'package:just_ready/presentation/page/create_order/body/create_order_loaded_empty_body.dart';
import 'package:just_ready/presentation/page/create_order/body/create_order_loading_body.dart';
import 'package:just_ready/presentation/page/create_order/cubit/create_order_cubit.dart';
import 'package:just_ready/presentation/page/create_order/cubit/create_order_state.dart';
import 'package:just_ready/presentation/page/home/home_page.dart';
import 'package:just_ready/presentation/widgets/jr_app_bar.dart';
import 'package:just_ready/styles/images.dart';
import 'package:just_ready/utils/hooks/use_once.dart';

class CreateOrderPage extends HookWidget {
  const CreateOrderPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<CreateOrderCubit>();

    final state = useBlocBuilder(cubit, buildWhen: _buildWhen);
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
        ),
        loading: () => const CreateOrderLoadingBody(),
        orElse: SizedBox.shrink,
      ),
    );
  }

  bool _buildWhen(CreateOrderState state) => state is Loaded || state is LoadedEmpty || state is Loading;
}
