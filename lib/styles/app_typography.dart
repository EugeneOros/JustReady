import 'package:flutter/material.dart';
import 'package:just_ready/gen/fonts.gen.dart';

const _fontFamily = 'Roboto';

class AppTypography {
  static const fontFamily = FontFamily.inter;

  /// Header
  static const header1 = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w500,
    height: 28.0 / 18.0,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const header2 = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w700,
    height: 24.0 / 16.0,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const header3 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    height: 18.0 / 14.0,
    leadingDistribution: TextLeadingDistribution.even,
  );

  /// Body
  static const body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 18.0 / 14.0,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const body2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 18.0 / 14.0,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const body3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 18.0 / 14.0,
    leadingDistribution: TextLeadingDistribution.even,
  );

  /// Subtitle
  static const subtitle1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1,
    letterSpacing: 0.4,
    leadingDistribution: TextLeadingDistribution.even,
  );
  static const subtitle2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.14,
    letterSpacing: 0.4,
    leadingDistribution: TextLeadingDistribution.even,
  );

  /// Button
  static const button = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    height: 18.0 / 14.0,
    leadingDistribution: TextLeadingDistribution.even,
  );

  /// Input
  static const input = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 18.0 / 14.0,
    leadingDistribution: TextLeadingDistribution.even,
  );
}

class CustomTypography extends ThemeExtension<CustomTypography> {
  final TextStyle header1;
  final TextStyle header2;
  final TextStyle header3;
  final TextStyle body1;
  final TextStyle body2;
  final TextStyle body3;
  final TextStyle subtitle1;
  final TextStyle subtitle2;
  final TextStyle button;
  final TextStyle input;

  const CustomTypography({
    required this.header1,
    required this.header2,
    required this.header3,
    required this.subtitle1,
    required this.subtitle2,
    required this.body1,
    required this.body2,
    required this.body3,
    required this.button,
    required this.input,
  });

  @override
  ThemeExtension<CustomTypography> copyWith({
    TextStyle? header1,
    TextStyle? header2,
    TextStyle? header3,
    TextStyle? header4,
    TextStyle? body1,
    TextStyle? body2,
    TextStyle? body3,
    TextStyle? subtitle1,
    TextStyle? subtitle2,
    TextStyle? button,
    TextStyle? input,
  }) =>
      CustomTypography(
        header1: header1 ?? this.header1,
        header2: header2 ?? this.header2,
        header3: header3 ?? this.header3,
        body1: body1 ?? this.body1,
        body2: body2 ?? this.body2,
        body3: body3 ?? this.body3,
        subtitle1: subtitle1 ?? this.subtitle1,
        subtitle2: subtitle2 ?? this.subtitle2,
        button: button ?? this.button,
        input: input ?? this.input,
      );

  @override
  ThemeExtension<CustomTypography> lerp(ThemeExtension<CustomTypography>? other, double t) => this;

  static final standard = CustomTypography(
    header1: AppTypography.header1.copyWith(fontFamily: _fontFamily),
    header2: AppTypography.header2.copyWith(fontFamily: _fontFamily),
    header3: AppTypography.header3.copyWith(fontFamily: _fontFamily),
    body1: AppTypography.body1.copyWith(fontFamily: _fontFamily),
    body2: AppTypography.body2.copyWith(fontFamily: _fontFamily),
    body3: AppTypography.body3.copyWith(fontFamily: _fontFamily),
    subtitle1: AppTypography.subtitle1.copyWith(fontFamily: _fontFamily),
    subtitle2: AppTypography.subtitle2.copyWith(fontFamily: _fontFamily),
    button: AppTypography.button.copyWith(fontFamily: _fontFamily),
    input: AppTypography.input.copyWith(fontFamily: _fontFamily),
  );
}
