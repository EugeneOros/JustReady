import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/domain/orders/models/order_status.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/page/orders/cubit/orders_cubit.dart';
import 'package:just_ready/presentation/page/orders/widgets/order_card/order_card_body.dart';
import 'package:just_ready/presentation/page/orders/widgets/order_card/widgets/card_overlay.dart';
import 'package:just_ready/presentation/page/orders/widgets/order_card/widgets/order_number_overlay.dart';
import 'package:just_ready/presentation/page/orders/widgets/order_status_dropdown.dart';
import 'package:just_ready/presentation/widgets/jr_container.dart';
import 'package:just_ready/presentation/widgets/jr_number_circle.dart';
import 'package:just_ready/styles/dimens.dart';

class OrderCard extends HookWidget {
  final Order order;
  final Function(Order, int) toggleOrderMealIsDone;
  final Function(Order, OrderStatus) updateOrderStatus;
  final Function(Order) onDeleteOrder;

  final Function() cancelDeletionCountdown;
  final int deletionCountdown;
  final bool showDeleteionCountdown;

  const OrderCard({
    super.key,
    required this.order,
    required this.toggleOrderMealIsDone,
    required this.updateOrderStatus,
    required this.onDeleteOrder,
    required this.cancelDeletionCountdown,
    required this.deletionCountdown,
    required this.showDeleteionCountdown,
  });

  @override
  Widget build(BuildContext context) => Stack(
      children: [
        Positioned(
          child: JrContainer(
            showShadow: false,
            isAnimated: true,
            borderRadius: Dimens.ms,
            borderColor: showDeleteionCountdown ? context.colors.red : context.colors.dark,
            width: Dimens.orderCardWidth,
            padding: const EdgeInsets.symmetric(vertical: Dimens.m),
            margin: const EdgeInsets.all(Dimens.xm),
            child: OrderCardBody(
              order: order,
              toggleOrderMealIsDone: toggleOrderMealIsDone,
            ),
          ),
        ),
        if (showDeleteionCountdown)
          CardOverlay(
            countdown: deletionCountdown,
            onCancel: () {
              cancelDeletionCountdown();
              updateOrderStatus(order, OrderStatus.ready);
              // cubit.cancelCountdown();
            },
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
              countdown: deletionCountdown,
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
              onStatusChanged: (status) async => await updateOrderStatus(order, status),
            ),
          ),
        ),
      ],
    );
}
