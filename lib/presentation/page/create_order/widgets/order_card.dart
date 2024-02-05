import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/select_meals/widgets/price_badge.dart';
import 'package:just_ready/presentation/router/route_name.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_button.dart';
import 'package:just_ready/presentation/widgets/jr_container.dart';
import 'package:just_ready/styles/dimens.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final Widget child;
  const OrderCard({
    super.key,
    required this.child,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.ms),
            constraints: const BoxConstraints(
              maxWidth: Dimens.lMaxCardButtonWidth,
            ),
            child: JrContainer(
              showShadow: false,
              isAnimated: true,
              borderRadius: Dimens.ms,
              height: MediaQuery.of(context).size.height - Dimens.bannerHeight - Dimens.navBarHeight,
              margin: const EdgeInsets.symmetric(horizontal: Dimens.ms, vertical: Dimens.m),
              child: child,
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: PriceBadge(
            price: order.getSumPrice(),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: JrButton(
            onTap: () => context.goNamed(JustReadyRoute.selectMeals.name),
            title: Strings.of(context).addOrders,
          ),
        ),
      ],
    );
  }
}
