import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/styles/dimens.dart';

enum ButtonType {
  primary,
  secondary,
}

class JrButton extends HookWidget {
  final VoidCallback onPressed;
  final String title;
  final ButtonType type;

  const JrButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.type = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    final isHover = useState(false);
    final bordrRadius = BorderRadius.circular(Dimens.xl);

    return Align(
      child: Material(
        color: type == ButtonType.primary ? context.colors.dark : context.colors.background,
        borderRadius: bordrRadius,
        child: InkWell(
          onTap: onPressed,
          highlightColor: context.colors.transparent,
          splashColor: type == ButtonType.primary ? context.colors.primary : context.colors.dark,
          hoverColor: context.colors.darkLight,
          onHover: (value) => isHover.value = value,
          borderRadius: bordrRadius,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: bordrRadius,
              border: Border.all(color: context.colors.dark, width: Dimens.xxxs),
              color: context.colors.transparent, // isHover.value ? context.colors.dark : context.colors.bright,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Dimens.xs, horizontal: Dimens.xm),
                  child: Text(
                    title,
                    style: context.typography.button.copyWith(
                      color: type == ButtonType.primary ? context.colors.background : context.colors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   final isHover = useState(false);

  //   return ElevatedButton(
  //     style: ElevatedButton.styleFrom(
  //       elevation: 20,
  //       foregroundColor: context.colors.primary,
  //       backgroundColor: getBackgroundColor(context, isHover.value),
  //       textStyle: context.typography.body1.copyWith(color: context.colors.background),
  //     ),
  //     onPressed: onPressed,
  //     onHover: (value) => isHover.value = value,
  //   );
  // }

  Color getBackgroundColor(BuildContext context, bool isHover) {
    if (isHover) return type == ButtonType.primary ? context.colors.primary : context.colors.dark;
    return type == ButtonType.primary ? context.colors.dark : context.colors.primary;
  }
}
