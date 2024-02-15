import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/models/order_status.dart';
import 'package:just_ready/presentation/page/orders/widgets/order_card/cubit/order_card_cubit.dart';
import 'package:just_ready/presentation/page/orders/widgets/order_card/cubit/order_card_state.dart';
import 'package:just_ready/presentation/page/orders/widgets/order_card/order_card_body.dart';
import 'package:just_ready/presentation/page/orders/widgets/order_card/widgets/card_overlay.dart';
import 'package:just_ready/presentation/page/orders/widgets/order_card/widgets/order_number_overlay.dart';
import 'package:just_ready/presentation/page/orders/widgets/order_status_dropdown.dart';
import 'package:just_ready/presentation/widgets/jr_container.dart';
import 'package:just_ready/presentation/widgets/jr_number_circle.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/utils/ignore_else_state.dart';

class OrderCard extends HookWidget {
  final Order order;
  final Function(Order, int) toggleOrderMealIsDone;
  final Function(Order, OrderStatus) updateOrderStatus;
  final Function() onDeleteOrder;

  const OrderCard({
    super.key,
    required this.order,
    required this.toggleOrderMealIsDone,
    required this.updateOrderStatus,
    required this.onDeleteOrder,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<OrderCardCubit>();
    final state = useBlocBuilder(cubit, buildWhen: _buildWhen);
    useBlocListener(cubit, _listener, listenWhen: _listenWhen);

    return state.maybeWhen(
      loaded: (showDeleteionCountdown, countdown) => Stack(
        children: [
          Positioned(
            child: JrContainer(
                showShadow: false,
                isAnimated: true,
                borderRadius: Dimens.ms,
                width: Dimens.orderCardWidth,
                padding: const EdgeInsets.symmetric(vertical: Dimens.m),
                margin: const EdgeInsets.all(Dimens.xm),
                child: OrderCardBody(
                  order: order,
                  toggleOrderMealIsDone: toggleOrderMealIsDone,
                )),
          ),
          if (showDeleteionCountdown)
            CardOverlay(
              countdown: countdown,
              deletionContdownInitValue: deletionContdownInitValue,
            ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: JrNumberCircle(
              number: order.number!,
              size: NumberCircleSize.m,
            ),
          ),
          if (showDeleteionCountdown)
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: OrderNumberOverlay(
                countdown: countdown,
                deletionContdownInitValue: deletionContdownInitValue,
              ),
            ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Center(
              child: OrderStatusDropDown(
                currentStatus: order.status,
                onStatusChanged: (status) {
                  status == OrderStatus.deliverd ? cubit.startCountdown() : cubit.cancelCountdown();
                  updateOrderStatus(order, status);
                },
              ),
            ),
          ),
        ],
      ),
      orElse: SizedBox.shrink,
    );
  }

  void _listener(OrderCardCubit bloc, OrderCardState state, BuildContext context) => state.maybeWhen(
        deleteOrder: onDeleteOrder,
        orElse: doNothing,
      );

  bool _buildWhen(OrderCardState state) => state is OrderCardStateBuilder;
  bool _listenWhen(OrderCardState state) => state is OrderCardStateListener;
}
