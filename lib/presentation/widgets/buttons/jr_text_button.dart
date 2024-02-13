import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';

enum JrTextButtonState {
  idle,
  disabled,
}

class JrTextButtonStateFactory {
  static JrTextButtonState getState({required bool isActive}) =>
      isActive ? JrTextButtonState.idle : JrTextButtonState.disabled;
}

class JrTextButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final JrTextButtonState state;
  final EdgeInsets? padding;
  final Color? textColor;

  const JrTextButton({
    super.key,
    required this.title,
    this.onTap,
    this.state = JrTextButtonState.idle,
    this.padding,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) => TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(context.colors.transparent),
          padding: MaterialStateProperty.all(padding),
        ),
        onPressed: state == JrTextButtonState.idle ? onTap : null,
        child: JrText(
          title,
          style: context.typography.bodySemiBoldUnderline,
          color: state == JrTextButtonState.disabled ? context.colors.darkLight : textColor ?? context.colors.primary,
        ),
      );
}
