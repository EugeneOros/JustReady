import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/domain/orders/models/order_status.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/dashboard/cubit/dashboard_cubit.dart';
import 'package:just_ready/presentation/page/dashboard/cubit/dashboard_state.dart';
import 'package:just_ready/presentation/page/dashboard/widgets/dachbard_column.dart';
import 'package:just_ready/presentation/page/orders/body/orders_loading_body.dart';
import 'package:just_ready/presentation/widgets/jr_dialog.dart';
import 'package:just_ready/presentation/widgets/jr_number_circle.dart';
import 'package:just_ready/utils/hooks/use_once.dart';
import 'package:just_ready/utils/ignore_else_state.dart';

class DashboardPage extends HookWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<DashboardCubit>();
    final state = useBlocBuilder(cubit);
    useOnce(cubit.loadOrders);
    useBlocListener(cubit, _listener);

    return Scaffold(
      body: state.maybeWhen(
        loaded: (orders) => Row(
          children: [
            Expanded(
              child: DashboardColumn(
                title: Strings.of(context).dashbordWaitingTitle,
                orders: orders.where((order) => order.status == OrderStatus.ordered).toList(),
              ),
            ),
            Expanded(
              child: DashboardColumn(
                title: Strings.of(context).dashbordInProgresTitle,
                orders: orders.where((order) => order.status == OrderStatus.inProgress).toList(),
              ),
            ),
            Expanded(
              child: DashboardColumn(
                title: Strings.of(context).dashbordDoneTitle,
                orders: orders.where((order) => order.status == OrderStatus.ready).toList(),
              ),
            ),
          ],
        ),
        loading: () => const OrdersLoadingBody(),
        orElse: SizedBox.shrink,
      ),
    );
  }

  void _listener(DashboardCubit cubit, DashboardState state, BuildContext context) => state.maybeWhen(
        announceReady: (orders) => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => JrDialog(
            // titleIcon: Assets.icons.download.svg(),
            title: Strings.of(context).yourOrderNumber,
            actionText: Strings.of(context).ok,
            actionButtonOnTap: () => context.pop(),
            child: JrNumberCircle(
              color: context.colors.secondary,
              numberColor: context.colors.bright,
              size: NumberCircleSize.l,
              number: orders[0].number!,
            ),
          ),
        ),
        orElse: doNothing,
      );
}
