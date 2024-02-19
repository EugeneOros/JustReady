import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_ready/extensions/extension_mixin.dart';
import 'package:just_ready/generated/l10n.dart';
import 'package:just_ready/presentation/widgets/jr_svg_picture.dart';
import 'package:just_ready/styles/dimens.dart';
import 'package:just_ready/styles/images.dart';

class HomeNavBar extends HookWidget {
  final Function(int) onTap;
  final int selectedIndex;

  const HomeNavBar({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    var items = [
      BottomNavigationBarItem(
        icon: JrSvgPicture(
          selectedIndex == 0 ? IconsSvg.bellRin24 : IconsSvg.bell24,
          size: Dimens.xxl,
        ),
        label: Strings.of(context).addOrders,
      ),
      BottomNavigationBarItem(
        icon: JrSvgPicture(
          selectedIndex == 1 ? IconsSvg.ordersTorn24 : IconsSvg.orders24,
          size: Dimens.xxl,
        ),
        label: Strings.of(context).orders,
      ),
      BottomNavigationBarItem(
        icon: JrSvgPicture(
          selectedIndex == 2 ? IconsSvg.mealHot24 : IconsSvg.meal24,
          size: Dimens.xxl,
        ),
        label: Strings.of(context).meals,
      ),
      BottomNavigationBarItem(
        icon: JrSvgPicture(
          selectedIndex == 3 ? IconsSvg.boardDone24 : IconsSvg.boardProgress24,
          size: Dimens.xxl,
        ),
        label: Strings.of(context).dashboard,
      )
    ];

    return Container(
      height: Dimens.navBarHeight,
      color: context.colors.dark.withOpacity(0.7),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 8, sigmaX: 8),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            selectedLabelStyle: context.typography.body2,
            unselectedLabelStyle: context.typography.body3,
            selectedItemColor: context.colors.bright,
            unselectedItemColor: context.colors.bright,
            backgroundColor: context.colors.transparent,
            elevation: 0,
            currentIndex: selectedIndex,
            items: items,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
