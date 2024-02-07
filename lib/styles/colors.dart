import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color dark;
  final Color darkLight;
  final Color primary;
  final Color primaryLight;
  final Color secondary;
  final Color bright;
  final Color background;
  final Color error;
  final Color disabled;
  final Color transparent;

  const CustomColors({
    required this.dark,
    required this.darkLight,
    required this.primary,
    required this.primaryLight,
    required this.secondary,
    required this.bright,
    required this.background,
    required this.error,
    required this.disabled,
    required this.transparent,
  });

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? dark,
    Color? darkLight,
    Color? primary,
    Color? primaryLight,
    Color? secondary,
    Color? bright,
    Color? background,
    Color? error,
    Color? disabled,
    Color? transparent,
  }) =>
      CustomColors(
        dark: dark ?? this.dark,
        darkLight: darkLight ?? this.darkLight,
        primary: primary ?? this.primary,
        primaryLight: primaryLight ?? this.primaryLight,
        secondary: secondary ?? this.secondary,
        bright: bright ?? this.bright,
        background: background ?? this.background,
        error: error ?? this.error,
        disabled: disabled ?? this.disabled,
        transparent: transparent ?? this.transparent,
      );

  @override
  ThemeExtension<CustomColors> lerp(
    ThemeExtension<CustomColors>? other,
    double t,
  ) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      dark: _getColorLerp(dark, other.dark, t),
      darkLight: _getColorLerp(darkLight, other.darkLight, t),
      primary: _getColorLerp(primary, other.primary, t),
      primaryLight: _getColorLerp(primaryLight, other.primaryLight, t),
      secondary: _getColorLerp(secondary, other.secondary, t),
      bright: _getColorLerp(bright, other.bright, t),
      background: _getColorLerp(background, other.background, t),
      error: _getColorLerp(error, other.error, t),
      disabled: _getColorLerp(disabled, other.disabled, t),
      transparent: _getColorLerp(transparent, other.transparent, t),
    );
  }

  Color _getColorLerp(Color actual, Color other, double t) => Color.lerp(actual, other, t) ?? other;

  static const lightTheme = CustomColors(
    dark: Color(0xff000000),
    darkLight: Color(0xff555555),
    primary: Color(0xffbfe34b),
    primaryLight: Color(0xffECFFDC),
    secondary: Color(0xff4392AE),
    bright: Color(0xffffffff),
    background: Color(0xffffffff),
    error: Color(0xffee6c4d),
    disabled: Color(0xffd7dadd),
    transparent: Color(0x00000000),
  );

  static const darkTheme = CustomColors(
    dark: Color(0xff98C1D9),
    darkLight: Color(0xff3D5A80),
    primary: Color(0xffbfe34b),
    primaryLight: Color(0xffF1FFC3),
    secondary: Color(0xff4392AE),
    bright: Color(0xffffffff),
    background: Color(0xff000000),
    error: Color(0xffee6c4d),
    disabled: Color(0xffd7dadd),
    transparent: Color(0x00000000),
  );
}
