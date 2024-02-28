import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';

enum OrderStatus {
  ordered('ordered'),
  inProgress('inProgress'),
  ready('ready'),
  deliverd('delivered');

  final String name;
  const OrderStatus(this.name);
}

extension OrderStatusExtension on OrderStatus {
  String getString(BuildContext context) {
    switch (this) {
      case OrderStatus.ordered:
        return Strings.of(context).ordered;
      case OrderStatus.inProgress:
        return Strings.of(context).inProgress;
      case OrderStatus.ready:
        return Strings.of(context).ready;
      case OrderStatus.deliverd:
        return Strings.of(context).delivered;
      default:
        return '';
    }
  }

  Color getColor(BuildContext context) {
    switch (this) {
      case OrderStatus.ordered:
        return context.colors.grey;
      case OrderStatus.inProgress:
        return context.colors.secondary;
      case OrderStatus.ready:
        return context.colors.dark;
      case OrderStatus.deliverd:
        return context.colors.red;
    }
  }
}
