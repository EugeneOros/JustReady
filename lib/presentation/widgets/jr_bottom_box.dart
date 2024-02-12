import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/styles/dimens.dart';

class JrBottomBox extends StatelessWidget {
  final Widget? child;
  final List<Widget> buttons;
  const JrBottomBox({
    super.key,
    this.child,
    required this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.colors.primaryLight.withOpacity(0.6),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 8, sigmaX: 8),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB( Dimens.xl, Dimens.s, Dimens.xl, Dimens.m),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: context.colors.darkLight,
                  width: Dimens.xxxxs,
                ),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (child != null)
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: Dimens.buttonBoxChildMaxWidth,
                    ),
                    child: child!,
                  ),
                const SizedBox(height: Dimens.m),
                for (int i = 0; i < buttons.length; i++) ...[
                  buttons[i],
                  if (i != buttons.length - 1) const SizedBox(height: Dimens.s),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
