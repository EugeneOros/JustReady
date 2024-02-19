import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/widgets/buttons/jr_button.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';

class CardOverlay extends StatelessWidget {
  final int countdown;
  final int deletionContdownInitValue;
  final Function() onCancel;
  const CardOverlay({
    super.key,
    required this.countdown,
    required this.deletionContdownInitValue,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration( 
          border: Border.all(color: context.colors.red, width: Dimens.xxs),
          borderRadius: BorderRadius.circular(Dimens.ms),
        ),
        margin: const EdgeInsets.all(Dimens.xm),
        width: Dimens.orderCardWidth,
        height: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.ms),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaY: (deletionContdownInitValue - countdown).toDouble(),
              sigmaX: (deletionContdownInitValue - countdown).toDouble(),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  JrText(
                    countdown.toString(),
                    style: context.typography.header1,
                    color: context.colors.red,
                  ),
                  const SizedBox(height: Dimens.xs),
                  JrButton(
                    title: Strings.of(context).cancel,
                    type: ButtonType.secondary,
                    onTap: onCancel,
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
