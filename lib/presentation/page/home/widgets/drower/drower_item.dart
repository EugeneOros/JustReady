import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/presentation/widgets/jr_container.dart';
import 'package:just_ready/presentation/widgets/jr_svg_picture.dart';
import 'package:just_ready/presentation/widgets/jr_text.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';

class DrowerItem extends StatelessWidget {
  final String title;
  final String selectedIcon;
  final String unselectedIcon;
  final int selectdIndex;
  final int index;
  final Function(int) onTap;

  const DrowerItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.selectdIndex,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return JrContainer(
      borderRadius: Dimens.ms,
      height: Dimens.defaultMealCardHeight,
      margin: const EdgeInsets.symmetric(horizontal: Dimens.ms, vertical: Dimens.m),
      padding: const EdgeInsets.symmetric(horizontal: Dimens.m),
      backgroundColor: index == selectdIndex ? context.colors.primary : context.colors.background,
      onTap: () {
        onTap(index);
        Navigator.of(context).pop();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          JrSvgPicture(
            index == selectdIndex ? selectedIcon : unselectedIcon,
            height: Dimens.xxxl,
            color: context.colors.dark,
          ),
          const SizedBox(width: Dimens.s),
          Expanded(
            child: JrText(
              title,
              overflow: TextOverflow.ellipsis,
              style: context.typography.body1,
              color: context.colors.dark,
            ),
          ),
          JrSvgPicture(
            IconsSvg.chevronRight24,
            height: Dimens.l,
            color: context.colors.dark,
          ),
        ],
      ),
    );
  }
}
