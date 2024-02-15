import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';

class CardOverlay extends StatelessWidget {
  final int countdown;
  final int deletionContdownInitValue;
  const CardOverlay({
    super.key,
    required this.countdown,
    required this.deletionContdownInitValue,
  });

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.error, width: Dimens.xxs),
        borderRadius: BorderRadius.circular(Dimens.ms),
        color: context.colors.background.withOpacity(0.4 + ((deletionContdownInitValue - countdown) / 10)),
      ),
      margin: const EdgeInsets.all(Dimens.xm),
      width: Dimens.orderCardWidth - Dimens.l,
      height: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.ms),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaY: (deletionContdownInitValue - countdown).toDouble(),
            sigmaX: (deletionContdownInitValue - countdown).toDouble(),
          ),
          child: Center(
            child: JrText(
              countdown.toString(),
              style: context.typography.header1,
              color: context.colors.error,
            ),
          ),
        ),
      ),
    );
}
