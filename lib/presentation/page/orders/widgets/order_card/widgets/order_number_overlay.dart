import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/styles/dimens.dart';

class OrderNumberOverlay extends StatelessWidget {
  final int countdown;
  final int deletionContdownInitValue;

  const OrderNumberOverlay({
    super.key,
    required this.countdown,
    required this.deletionContdownInitValue,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: Dimens.xxl,
        height: Dimens.xxl,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: context.colors.red, width: Dimens.xxs),
          color: context.colors.background.withOpacity(0.4 + ((deletionContdownInitValue - countdown) / 10)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.ms),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaY: (deletionContdownInitValue - countdown).toDouble(),
              sigmaX: (deletionContdownInitValue - countdown).toDouble(),
            ),
          ),
        ),
      );
}
