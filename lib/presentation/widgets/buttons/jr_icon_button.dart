import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/widgets/jr_svg_picture.dart';
import 'package:just_ready/styles/dimens.dart';

enum IconButtonType {
  primary,
  secondary,
  tertiary,
}

class JrIconButton extends HookWidget {
  final String icon;
  final IconButtonType type;
  final VoidCallback onPressed;
  final double size;
  final Color? color;

  const JrIconButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      this.size = Dimens.xxl,
      this.color,
      this.type = IconButtonType.secondary});

  @override
  Widget build(BuildContext context) {
    final isHover = useState(false);
    return Container(
      alignment: Alignment.center,
      width: size,
      height: size,
      child: Material(
        color: getBackgroundColor(context),
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onPressed,
          highlightColor: context.colors.transparent,
          splashColor: getSplashColor(context),
          hoverColor: context.colors.darkLight,
          onHover: (value) => isHover.value = value,
          borderRadius: BorderRadius.circular(size / 2),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              border: Border.all(color: context.colors.dark, width: Dimens.xxxs),
              shape: BoxShape.circle,
              color: context.colors.transparent, // isHover.value ? context.colors.dark : context.colors.bright,
            ),
            child: Center(
              child: JrSvgPicture(
                icon,
                height: size * 0.6,
                width: size * 0.6,
                color: getIconColor(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getIconColor(BuildContext context) {
    switch (type) {
      case IconButtonType.primary:
        return context.colors.dark;
      case IconButtonType.secondary:
        return context.colors.dark;
      case IconButtonType.tertiary:
        return color ?? context.colors.primary;
    }
  }

  Color getBackgroundColor(BuildContext context) {
    switch (type) {
      case IconButtonType.primary:
        return color ?? context.colors.primary;
      case IconButtonType.secondary:
        return context.colors.bright;
      case IconButtonType.tertiary:
        return context.colors.bright;
    }
  }

  Color getSplashColor(BuildContext context) {
    switch (type) {
      case IconButtonType.primary:
        return context.colors.bright;
      case IconButtonType.secondary:
        return color ?? context.colors.primary;
      case IconButtonType.tertiary:
        return context.colors.dark;
    }
  }
}
