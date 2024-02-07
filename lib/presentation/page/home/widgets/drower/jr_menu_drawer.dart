import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/page/home/widgets/drower/drower_item.dart';
import 'package:just_ready/presentation/widgets/jr_svg_picture.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';

class JrMenuDrawer extends StatelessWidget {
  final Function(int) onTap;
  final int selectedIndex;

  const JrMenuDrawer({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: Border.all(width: 0),
      backgroundColor: context.colors.transparent,
      child: Container(
        color: context.colors.dark.withOpacity(0.5),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 8, sigmaX: 8),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                height: Dimens.bannerHeight,
                alignment: Alignment.center,
                child: JrSvgPicture(
                  IconsSvg.logo,
                  height: Dimens.xxxl,
                  color: context.colors.bright,
                ),
              ),
              DrowerItem(
                index: 0,
                selectdIndex: selectedIndex,
                title: Strings.of(context).addOrders,
                selectedIcon: IconsSvg.bellRin24,
                unselectedIcon: IconsSvg.bell24,
                onTap: onTap,
              ),
              DrowerItem(
                index: 1,
                selectdIndex: selectedIndex,
                title: Strings.of(context).orders,
                selectedIcon: IconsSvg.ordersTorn24,
                unselectedIcon: IconsSvg.orders24,
                onTap: onTap,
              ),
              DrowerItem(
                index: 2,
                selectdIndex: selectedIndex,
                title: Strings.of(context).meals,
                selectedIcon: IconsSvg.mealHot24,
                unselectedIcon: IconsSvg.meal24,
                onTap: onTap,
              ),
              DrowerItem(
                index: 3,
                selectdIndex: selectedIndex,
                title: Strings.of(context).dashboard,
                selectedIcon: IconsSvg.boardDone24,
                unselectedIcon: IconsSvg.boardProgress24,
                onTap: onTap,
              ),
              const SizedBox(height: Dimens.xxc),
            ],
          ),
        ),
      ),
    );
  }
}
