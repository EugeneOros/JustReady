import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:just_ready/domain/orders/models/order_status.dart';
import 'package:just_ready/extensions/build_context_extension.dart';
import 'package:just_ready/presentation/widgets/jr_svg_picture.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';

class OrderStatusDropDown extends StatelessWidget {
  final OrderStatus currentStatus;
  final Function(OrderStatus) onStatusChanged;
  const OrderStatusDropDown({
    super.key,
    required this.currentStatus,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = currentStatus.getColor(context);
    final bordrRadius = BorderRadius.circular(Dimens.l);
    return DropdownButtonHideUnderline(
      child: DropdownButton2<OrderStatus>(
        isExpanded: true,
        items: OrderStatus.values
            .map(
              (status) => DropdownMenuItem<OrderStatus>(
                value: status,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: status.getColor(context).withValues(alpha: 0.5),
                    border: Border(
                      bottom: BorderSide(color: context.colors.dark, width: Dimens.xxxs),
                    
                    ),
                  ),
                  child: Center(
                    child: JrText(
                      status.getString(context),
                      textAlign: TextAlign.center,
                      style: context.typography.body1,
                      color: context.colors.dark,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
        value: currentStatus,
        onChanged: (OrderStatus? status) {
          if (status != null) onStatusChanged(status);
        },
        barrierColor: context.colors.dark.withValues(alpha: 0.2),
        buttonStyleData: ButtonStyleData(
          height: Dimens.xxl,
          width: Dimens.sWidth,
          padding: const EdgeInsets.symmetric(
              vertical: Dimens.xs, horizontal: Dimens.xm),
          decoration: BoxDecoration(
            borderRadius: bordrRadius,
            border: Border.all(color: context.colors.dark, width: Dimens.xxxs),
            color: backgroundColor,
          ),
          elevation: 0,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: Dimens.sHeight,
          width: Dimens.sWidth,
          decoration: BoxDecoration(
            borderRadius: bordrRadius,
            border: Border.all(color: context.colors.dark, width: Dimens.xxxs),
            color: context.colors.primaryLight,
          ),
          padding: const EdgeInsets.all(Dimens.zero),
          offset: const Offset(0, Dimens.smHeight),
          elevation: 0,
        ),
        iconStyleData: IconStyleData(
          icon: JrSvgPicture(
            IconsSvg.chevronUp24,
            color: context.colors.dark,
            size: Dimens.m,
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: Dimens.xxl,
          padding: EdgeInsets.all(Dimens.zero),
        ),
        selectedItemBuilder: (context) => OrderStatus.values
            .map(
              (status) => Center(
                child: JrText(
                  status.getString(context),
                  textAlign: TextAlign.center,
                  style: context.typography.body1,
                  color: context.colors.dark,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
