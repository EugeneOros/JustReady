import 'package:flutter/material.dart';
import 'package:just_ready/gen/assets.gen.dart';

class IconsSvg {
  static final _icons = Assets.images.svg;
  static final lightning = _icons.piorun.path;

  IconsSvg._();
}

class Illustrations {
  static final _illustrations = Assets.images.illustrations;
  static final lightning = _illustrations.piorun.path;

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
