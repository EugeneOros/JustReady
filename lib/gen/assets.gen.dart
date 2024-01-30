/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesIllustrationsGen get illustrations =>
      const $AssetsImagesIllustrationsGen();
  $AssetsImagesSvgGen get svg => const $AssetsImagesSvgGen();
}

class $AssetsImagesIllustrationsGen {
  const $AssetsImagesIllustrationsGen();

  /// File path: assets/images/illustrations/banner.webp
  AssetGenImage get banner =>
      const AssetGenImage('assets/images/illustrations/banner.webp');

  /// File path: assets/images/illustrations/banner_holy.webp
  AssetGenImage get bannerHoly =>
      const AssetGenImage('assets/images/illustrations/banner_holy.webp');

  /// File path: assets/images/illustrations/piorun.png
  AssetGenImage get piorun =>
      const AssetGenImage('assets/images/illustrations/piorun.png');

  /// List of all assets
  List<AssetGenImage> get values => [banner, bannerHoly, piorun];
}

class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();

  /// File path: assets/images/svg/bell_24.svg
  SvgGenImage get bell24 => const SvgGenImage('assets/images/svg/bell_24.svg');

  /// File path: assets/images/svg/bell_ring_24.svg
  SvgGenImage get bellRing24 =>
      const SvgGenImage('assets/images/svg/bell_ring_24.svg');

  /// File path: assets/images/svg/board_done_24.svg
  SvgGenImage get boardDone24 =>
      const SvgGenImage('assets/images/svg/board_done_24.svg');

  /// File path: assets/images/svg/board_progress_24.svg
  SvgGenImage get boardProgress24 =>
      const SvgGenImage('assets/images/svg/board_progress_24.svg');

  /// File path: assets/images/svg/close_24.svg
  SvgGenImage get close24 =>
      const SvgGenImage('assets/images/svg/close_24.svg');

  /// File path: assets/images/svg/create_meal_24.svg
  SvgGenImage get createMeal24 =>
      const SvgGenImage('assets/images/svg/create_meal_24.svg');

  /// File path: assets/images/svg/delete_24.svg
  SvgGenImage get delete24 =>
      const SvgGenImage('assets/images/svg/delete_24.svg');

  /// File path: assets/images/svg/edit_24.svg
  SvgGenImage get edit24 => const SvgGenImage('assets/images/svg/edit_24.svg');

  /// File path: assets/images/svg/edit_meal_24.svg
  SvgGenImage get editMeal24 =>
      const SvgGenImage('assets/images/svg/edit_meal_24.svg');

  /// File path: assets/images/svg/eye_24.svg
  SvgGenImage get eye24 => const SvgGenImage('assets/images/svg/eye_24.svg');

  /// File path: assets/images/svg/eye_slash_24.svg
  SvgGenImage get eyeSlash24 =>
      const SvgGenImage('assets/images/svg/eye_slash_24.svg');

  /// File path: assets/images/svg/logo.svg
  SvgGenImage get logo => const SvgGenImage('assets/images/svg/logo.svg');

  /// File path: assets/images/svg/meal_24.svg
  SvgGenImage get meal24 => const SvgGenImage('assets/images/svg/meal_24.svg');

  /// File path: assets/images/svg/meal_hot_24.svg
  SvgGenImage get mealHot24 =>
      const SvgGenImage('assets/images/svg/meal_hot_24.svg');

  /// File path: assets/images/svg/minus_24.svg
  SvgGenImage get minus24 =>
      const SvgGenImage('assets/images/svg/minus_24.svg');

  /// File path: assets/images/svg/orders_24.svg
  SvgGenImage get orders24 =>
      const SvgGenImage('assets/images/svg/orders_24.svg');

  /// File path: assets/images/svg/orders_torn_24.svg
  SvgGenImage get ordersTorn24 =>
      const SvgGenImage('assets/images/svg/orders_torn_24.svg');

  /// File path: assets/images/svg/plus_24.svg
  SvgGenImage get plus24 => const SvgGenImage('assets/images/svg/plus_24.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        bell24,
        bellRing24,
        boardDone24,
        boardProgress24,
        close24,
        createMeal24,
        delete24,
        edit24,
        editMeal24,
        eye24,
        eyeSlash24,
        logo,
        meal24,
        mealHot24,
        minus24,
        orders24,
        ordersTorn24,
        plus24
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
