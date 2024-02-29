import 'package:flutter/material.dart';
import 'package:just_ready/gen/assets.gen.dart';

class IconsSvg {
  static final _icons = Assets.images.svg;
  static final logo = _icons.logo.path;
  static final eye24 = _icons.eye24.path;
  static final eyeSlash24 = _icons.eyeSlash24.path;
  static final close24 = _icons.close24.path;
  static final bell48 = _icons.bell48.path;
  static final bellRin48 = _icons.bellRing48.path;
  static final orders48 = _icons.orders48.path;
  static final ordersTorn48 = _icons.ordersTorn48.path;
  static final meal48 = _icons.meal48.path;
  static final mealHot48 = _icons.mealHot48.path;
  static final boardProgress48 = _icons.boardProgress48.path;
  static final boardDone48 = _icons.boardDone48.path;
  static final minus24 = _icons.minus24.path;
  static final plus24 = _icons.plus24.path;
  static final edit24 = _icons.edit24.path;
  static final delete24 = _icons.delete24.path;
  static final createMeal104 = _icons.createMeal104.path;
  static final editMeal104 = _icons.editMeal104.path;
  static final chevronUp24 = _icons.chevronUp24.path;
  static final chevronDown24 = _icons.chevronDown24.path;
  static final chevronRight24 = _icons.chevronRight24.path;
  static final chevronLeft24 = _icons.chevronLeft24.path;
  static final menu24 = _icons.menu24.path;
  static final emptyMeal104 = _icons.emptyMeal104.path;
  static final tickSquare24 = _icons.tickSquare24.path;
  static final square24 = _icons.square24.path;
  static final check24 = _icons.check24.path;
  static final cart24 = _icons.cart24.path;

  static final carrot24 = _icons.carrot24.path;
  static final toast24 = _icons.toast24.path;
  static final lemonade24 = _icons.lemonade24.path;
  static final lemon24 = _icons.lemon24.path;
  static final pizza24 = _icons.pizza24.path;
  static final waffle24 = _icons.waffle24.path;
  static final avocado24 = _icons.avocado24.path;
  static final grape24 = _icons.grape24.path;
  static final nachos24 = _icons.nachos24.path;
  static final coffee24 = _icons.coffee24.path;
  static final shake24 = _icons.shake24.path;
  static final burger24 = _icons.burger24.path;

  IconsSvg._();
}

class Illustrations {
  static final _illustrations = Assets.images.illustrations;
  static final banner = _illustrations.banner.path;
  static final bannerHoly = _illustrations.bannerHoly.path;
  static final plate = _illustrations.plate.path;
  static final dashboardBackground = _illustrations.dashboardBackground.path;
  static final dashboardRippedBackground = _illustrations.dashboardRippedBackground.path;

  Illustrations._();
}

const _illustrationsPathPrefix = 'assets/images/illustrations/';

@immutable
class CustomIllustrations extends ThemeExtension<CustomIllustrations> {
  final String mainPagePicture;

  const CustomIllustrations({
    required this.mainPagePicture,
  });

  @override
  ThemeExtension<CustomIllustrations> copyWith({
    String? mainPagePicture,
  }) =>
      CustomIllustrations(
        mainPagePicture: mainPagePicture ?? this.mainPagePicture,
      );

  @override
  ThemeExtension<CustomIllustrations> lerp(ThemeExtension<CustomIllustrations>? other, double t) => this;

  static const standard = CustomIllustrations(mainPagePicture: '${_illustrationsPathPrefix}piorun.png');
}
