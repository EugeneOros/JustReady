import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/domain/orders/models/order_status.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/dashboard/cubit/dashboard_cubit.dart';
import 'package:just_ready/presentation/page/dashboard/cubit/dashboard_state.dart';
import 'package:just_ready/presentation/page/dashboard/widgets/dachbard_orders_column.dart';
import 'package:just_ready/presentation/page/dashboard/widgets/dachbard_title_column.dart';
import 'package:just_ready/presentation/page/orders/body/orders_loading_body.dart';
import 'package:just_ready/presentation/widgets/dialogs/jr_number_dialog.dart';
import 'package:just_ready/presentation/widgets/falling_icons.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';
import 'package:just_ready/utils/hooks/use_once.dart';
import 'package:just_ready/utils/ignore_else_state.dart';

class DashboardPage extends HookWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<DashboardCubit>();
    final state = useBlocBuilder(cubit, buildWhen: _buildWhen);
    useBlocListener(cubit, _listener, listenWhen: _listenWhen);
    useOnce(cubit.loadOrders);

    return Scaffold(
      body: state.maybeWhen(
        loaded: (orders) => Stack(
          children: [
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: DashboardTitleColumn(
                      title: Strings.of(context).dashbordWaitingTitle,
                    ),
                  ),
                  Expanded(
                    child: DashboardTitleColumn(
                      title: Strings.of(context).dashbordDoneTitle,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: Dimens.bannerHeight,
              right: 0,
              left: 0,
              bottom: 0,
              child: Image.asset(
                Illustrations.dashboardRippedBackground,
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: DashboardOrdersColumn(
                      orders: orders
                          .where((order) =>
                              order.status == OrderStatus.ordered || order.status == OrderStatus.inProgress)
                          .toList(),
                    ),
                  ),
                  Expanded(
                    child: DashboardOrdersColumn(
                      orders: orders.where((order) => order.status == OrderStatus.ready).toList(),
                    ),
                  ),
                ],
              ),
            ),
    
            //ToDo
            const Positioned.fill(child: FallingIconsWidget())
          ],
        ),
        loading: () => const OrdersLoadingBody(),
        orElse: SizedBox.shrink,
      ),
    );
  }

  void _listener(DashboardCubit cubit, DashboardState state, BuildContext context) => state.maybeWhen(
        announceReady: (order) async {
          final phrases = [
            "Come to me",
            "Jestem tuuu cekam na ciebieee",
            "Licze do trzech. Jeden... Dwa... i ostatnie słowo mówie trzy",
            "Jestem gotowy do podbicia twojego żołądka",
            "Szykuj się to będzie pyszne",
            "Uważaj, zaraz wybuchnie kulinarna bomba!",
            "Prosto z serca dla twojego brzuszka",
            "Hop-hop! Twój posiłek czeka",
            "Czy jesteś moim dzisiejszym odbiorcą? Bo ja tu czekam"
          ];
          final index = Random().nextInt(phrases.length);
          cubit.orderReadyAnnounced(order);
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              Future.delayed(const Duration(seconds: 4), () => context.pop());
              return JrNumberDialog(
                title: phrases[index],
                number: order.number!,
              );
            },
          );
          cubit.announceNext();
          return null;
        },
        orElse: doNothing,
      );

  bool _buildWhen(DashboardState state) => state is DashboardStateBuilder;
  bool _listenWhen(DashboardState state) => state is DashboardStateListener;
}
