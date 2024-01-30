import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/widgets/jr_svg_picture.dart';
import 'package:just_ready/styles/dimens.dart';

enum IconButtonType {
  primary,
  secondary,
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
    final iconColor = type == IconButtonType.primary ? context.colors.background : (color ?? context.colors.primary);
    final backgroundColor =
        type == IconButtonType.primary ? (color ?? context.colors.primary) : context.colors.background;
    return Container(
      alignment: Alignment.center,
      width: size,
      height: size,
      child: Material(
        color: backgroundColor,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onPressed,
          highlightColor: context.colors.transparent,
          splashColor: context.colors.dark,
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
                color: iconColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
