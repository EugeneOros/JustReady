import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/home/home_page.dart';
import 'package:just_ready/presentation/page/orders/body/orders_loaded_body.dart';
import 'package:just_ready/presentation/page/orders/body/orders_loaded_empty_body.dart';
import 'package:just_ready/presentation/page/orders/body/orders_loading_body.dart';
import 'package:just_ready/presentation/page/orders/cubit/orders_state.dart';
import 'package:just_ready/presentation/widgets/jr_app_bar.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/presentation/page/orders/cubit/orders_cubit.dart';
import 'package:just_ready/presentation/widgets/jr_imaged_body.dart';
import 'package:just_ready/styles/images.dart';
import 'package:just_ready/utils/hooks/use_once.dart';

class OrdersPage extends HookWidget {
  const OrdersPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<OrdersCubit>();
    final state = useBlocBuilder(cubit, buildWhen: _buildWhen);
    useOnce(cubit.loadOrders);

    return Scaffold(
      appBar: JrAppBar(
        skipStartIcon: false,
        startIcon: IconsSvg.menu24,
        onStartIconTap: (_) {
          homeKey.currentState!.openDrawer();
        },
        title: Strings.of(context).orders,
      ),
      body: JrImagedBody(
        child: state.maybeWhen(
          loaded: (orders, orderToDelete, deletionCountdown) => OrdersLoadedBody(
            orders: orders,
            toggleOrderMealIsDone: cubit.toggleOrderMealIsDone,
            updateOrderStatus: cubit.updateOrderStatus,
            deleteOrder: cubit.deleteOrder,
            cancelDeletionCountdown: cubit.cancelDeletionCountdown,
            deletionCountdown: deletionCountdown,
            orderToDelete: orderToDelete,
          ),
          loadedEmpty: () => const OrdersLoadedEmptyBody(),
          loading: () => const OrdersLoadingBody(),
          orElse: SizedBox.shrink,
        ),
      ),
    );
  }

  bool _buildWhen(OrdersState state) => state is OrdersStateBuilder;
}
