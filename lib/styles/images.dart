import 'package:flutter/material.dart';
import 'package:just_ready/gen/assets.gen.dart';

class IconsSvg {
  static final _icons = Assets.images.svg;
  static final logo = _icons.logo.path;
  static final eye24 = _icons.eye24.path;
  static final eyeSlash24 = _icons.eyeSlash24.path;
  static final close24 = _icons.close24.path;
  static final bell24 = _icons.bell24.path;
  static final bellRin24 = _icons.bellRing24.path;
  static final orders24 = _icons.orders24.path;
  static final ordersTorn24 = _icons.ordersTorn24.path;
  static final meal24 = _icons.meal24.path;
  static final mealHot24 = _icons.mealHot24.path;
  static final boardProgress24 = _icons.boardProgress24.path;
  static final boardDone24 = _icons.boardDone24.path;
  static final minus24 = _icons.minus24.path;
  static final plus24 = _icons.plus24.path;
  static final edit24 = _icons.edit24.path;
  static final delete24 = _icons.delete24.path;
  static final createMeal24 = _icons.createMeal24.path;
  static final editMeal24 = _icons.editMeal24.path;


  IconsSvg._();
}

class Illustrations {
  static final _illustrations = Assets.images.illustrations;
  static final lightning = _illustrations.piorun.path;
  static final banner = _illustrations.banner.path;

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
