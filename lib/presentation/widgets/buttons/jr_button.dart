import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/widgets/jr_svg_picture.dart';
import 'package:just_ready/styles/dimens.dart';

enum ButtonType {
  primary,
  secondary,
  tertiary,
}

class JrButton extends HookWidget {
  final VoidCallback onTap;
  final String title;
  final ButtonType type;
  final String? prefixIcon;
  final Color? color;
  final double? width;
  final BoxConstraints? constraints;

  const JrButton({
    super.key,
    required this.onTap,
    required this.title,
    this.type = ButtonType.primary,
    this.prefixIcon,
    this.color,
    this.width,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final isHover = useState(false);
    final bordrRadius = BorderRadius.circular(Dimens.xl);

    return Material(
      color: getBackgroundColor(context),
      borderRadius: bordrRadius,
      child: InkWell(
        onTap: onTap,
        highlightColor: context.colors.transparent,
        splashColor: getSplashColor(context),
        hoverColor: context.colors.darkLight,
        onHover: (value) => isHover.value = value,
        borderRadius: bordrRadius,
        child: Container(
          width: width,
          constraints: constraints,
          decoration: BoxDecoration(
            borderRadius: bordrRadius,
            border: Border.all(color: context.colors.dark, width: Dimens.xxxs),
            color: context.colors.transparent, // isHover.value ? context.colors.dark : context.colors.bright,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixIcon != null)
                JrSvgPicture(
                  prefixIcon!,
                  height: Dimens.xl,
                  width: Dimens.xl,
                  color: getTitleColor(context),
                ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: Dimens.xs, horizontal: Dimens.xm),
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: context.typography.button.copyWith(
                      color: getTitleColor(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getTitleColor(BuildContext context) {
    switch (type) {
      case ButtonType.primary:
        return context.colors.dark;
      case ButtonType.secondary:
        return context.colors.dark;
      case ButtonType.tertiary:
        return color ?? context.colors.primary;
    }
  }

  Color getBackgroundColor(BuildContext context) {
    switch (type) {
      case ButtonType.primary:
        return color ?? context.colors.primary;
      case ButtonType.secondary:
        return context.colors.bright;
      case ButtonType.tertiary:
        return context.colors.bright;
    }
  }

  Color getSplashColor(BuildContext context) {
    switch (type) {
      case ButtonType.primary:
        return context.colors.bright;
      case ButtonType.secondary:
        return color ?? context.colors.primary;
      case ButtonType.tertiary:
        return context.colors.dark;
    }
  }

  // Color getBackgroundColor(BuildContext context, bool isHover) {
  //   if (isHover) return type == ButtonType.primary ? context.colors.primary : context.colors.dark;
  //   return type == ButtonType.primary ? context.colors.dark : context.colors.primary;
  // }
}
