import 'package:flutter/material.dart';
import 'package:just_ready/gen/fonts.gen.dart';

class AppTypography {
  static const fontFamily = FontFamily.alata;

  /// Header
  static const header1 = TextStyle(
    fontSize: 60,
    height: 1.3,
    fontWeight: FontWeight.w700,
  );
  static const header2 = TextStyle(
    fontSize: 27,
    height: 1.3,
    fontWeight: FontWeight.w600,
  );
  static const header3 = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );
  static const header4 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  /// Body
  static const body1 = TextStyle(
    fontSize: 16,
    height: 1.3,
  );
  static const body2 = TextStyle(
    fontSize: 14,
    height: 1,
  );
  static const body3 = TextStyle(
    fontSize: 12,
    height: 1,
  );

  /// Subtitle
  static const subtitle1 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    height: 0.8,
  );
  static const subtitle2 = TextStyle(
    fontSize: 10,
    height: 1,
  );
  static const subtitle3 = TextStyle(
    fontSize: 7.5,
    height: 1,
  );

  /// Button
  static const button = TextStyle(
    fontSize: 16,
    // fontWeight: FontWeight.w600,
  );

  /// Input
  static const input = TextStyle(
    fontSize: 14,
    // fontWeight: FontWeight.w400,
    // height: 18.0 / 14.0,
    // leadingDistribution: TextLeadingDistribution.even,
  );

  static const bodySemiBoldUnderline = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    leadingDistribution: TextLeadingDistribution.even,
    decoration: TextDecoration.underline,
    // letterSpacing: -0.41,
  );
}

class CustomTypography extends ThemeExtension<CustomTypography> {
  final TextStyle header1;
  final TextStyle header2;
  final TextStyle header3;
  final TextStyle header4;
  final TextStyle body1;
  final TextStyle body2;
  final TextStyle body3;
  final TextStyle subtitle1;
  final TextStyle subtitle2;
  final TextStyle subtitle3;
  final TextStyle button;
  final TextStyle input;
  final TextStyle bodySemiBoldUnderline;

  const CustomTypography({
    required this.header1,
    required this.header2,
    required this.header3,
    required this.header4,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.body1,
    required this.body2,
    required this.body3,
    required this.button,
    required this.input,
    required this.bodySemiBoldUnderline,
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
    TextStyle? subtitle3,
    TextStyle? button,
    TextStyle? input,
    TextStyle? bodySemiBoldUnderline,
  }) =>
      CustomTypography(
        header1: header1 ?? this.header1,
        header2: header2 ?? this.header2,
        header3: header3 ?? this.header3,
        header4: header4 ?? this.header4,
        body1: body1 ?? this.body1,
        body2: body2 ?? this.body2,
        body3: body3 ?? this.body3,
        subtitle1: subtitle1 ?? this.subtitle1,
        subtitle2: subtitle2 ?? this.subtitle2,
        subtitle3: subtitle3 ?? this.subtitle3,
        button: button ?? this.button,
        input: input ?? this.input,
        bodySemiBoldUnderline: bodySemiBoldUnderline ?? this.bodySemiBoldUnderline,
      );

  @override
  ThemeExtension<CustomTypography> lerp(ThemeExtension<CustomTypography>? other, double t) => this;

  static final standard = CustomTypography(
    header1: AppTypography.header1.copyWith(fontFamily: AppTypography.fontFamily),
    header2: AppTypography.header2.copyWith(fontFamily: AppTypography.fontFamily),
    header3: AppTypography.header3.copyWith(fontFamily: AppTypography.fontFamily),
    header4: AppTypography.header4.copyWith(fontFamily: AppTypography.fontFamily),
    body1: AppTypography.body1.copyWith(fontFamily: AppTypography.fontFamily),
    body2: AppTypography.body2.copyWith(fontFamily: AppTypography.fontFamily),
    body3: AppTypography.body3.copyWith(fontFamily: AppTypography.fontFamily),
    subtitle1: AppTypography.subtitle1.copyWith(fontFamily: AppTypography.fontFamily),
    subtitle2: AppTypography.subtitle2.copyWith(fontFamily: AppTypography.fontFamily),
    subtitle3: AppTypography.subtitle3.copyWith(fontFamily: AppTypography.fontFamily),
    button: AppTypography.button.copyWith(fontFamily: AppTypography.fontFamily),
    input: AppTypography.input.copyWith(fontFamily: AppTypography.fontFamily),
    bodySemiBoldUnderline: AppTypography.bodySemiBoldUnderline.copyWith(fontFamily: AppTypography.fontFamily),
  );
}
