import 'package:flutter/material.dart';
import 'package:just_ready/domain/orders/models/order.dart';
import 'package:just_ready/extensions/build_context_extension.dart';
import 'package:just_ready/presentation/page/dashboard/widgets/order_numeber_card.dart';
import 'package:just_ready/styles/dimens.dart';

class DashboardOrdersColumn extends StatelessWidget {
  final List<Order> orders;
  const DashboardOrdersColumn({
    super.key,
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
          children: [
            const SizedBox(height: Dimens.dashboardColumnTitleHeight),
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: SingleChildScrollView(
                  child: Wrap(
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
                ),
              ),
            ),
          ],
        ),
      );
}
