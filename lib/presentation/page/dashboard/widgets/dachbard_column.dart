import 'package:flutter/material.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/extensions/build_context_extension.dart';
import 'package:just_ready/presentation/page/dashboard/widgets/order_numeber_card.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';

class DashboardColumn extends StatelessWidget {
  final String title;
  final List<Order> orders;
  const DashboardColumn({
    super.key,
    required this.title,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: context.colors.darkLight,
              width: Dimens.xxxxs,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Dimens.bannerHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.colors.transparent,
                border: Border(
                  right: BorderSide(
                    color: context.colors.primary,
                    width: Dimens.xxxxs,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      Illustrations.banner,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: JrText(
                        title,
                        textAlign: TextAlign.center,
                        style: context.typography.header1,
                        color: context.colors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Wrap(
              alignment: WrapAlignment.start,
              direction: Axis.horizontal,
              children: List.generate(
                orders.length,
                (index) => OrderNumberItem(
                  number: orders[index].number!,
                  isSelected: true,
                ),
              ),
            ),
          ],
        ),
      );
}
