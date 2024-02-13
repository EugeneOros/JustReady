import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/widgets/jr_svg_picture.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';
import 'package:just_ready/utils/ignore_else_state.dart';

class JrCheckBox extends StatelessWidget {
  final Widget child;
  final bool isChecked;
  final ValueChanged<bool>? onCheckedChanged;
  final bool disabled;
  final Color? color;

  const JrCheckBox({
    super.key,
    required this.child,
    this.isChecked = false,
    this.onCheckedChanged,
    this.disabled = false,
    this.color ,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            splashColor: context.colors.transparent,
            onTap: () => disabled ? doNothing : onCheckedChanged?.call(!isChecked),
            child: JrSvgPicture(
              isChecked ? IconsSvg.tickSquare24 : IconsSvg.square24,
              color: color,
              inactive: disabled,
            ),
          ),
          const SizedBox(width: Dimens.s),
          Expanded(child: child),
        ],
      );
}
