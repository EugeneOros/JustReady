import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_ready/extensions/extension_mixin.dart';

class JrSvgPicture extends StatelessWidget {
  final String assetName;
  final bool inactive;
  final double? height;
  final double? width;
  final String? semanticsLabel;
  final Color? color;

  const JrSvgPicture(
    this.assetName, {
    super.key,
    this.height,
    this.width,
    this.inactive = false,
    this.semanticsLabel,
    this.color,
  });

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
        assetName,
        height: height,
        width: width,
        colorFilter: _getColor(context),
        semanticsLabel: semanticsLabel,
      );

  ColorFilter? _getColor(BuildContext context) {
    final color = inactive ? context.colors.primary : this.color;
    return color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null;
  }
}
