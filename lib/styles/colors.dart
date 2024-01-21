import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color? dark;
  final Color? darkLight;
  final Color? main;
  final Color? bright;
  final Color? background;
  final Color? error;

  const CustomColors({
    this.dark,
    this.darkLight,
    this.main,
    this.bright,
    this.background,
    this.error,
  });

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? dark,
    Color? darkLight,
    Color? main,
    Color? bright,
    Color? background,
    Color? error,
  }) =>
      CustomColors(
        dark: dark ?? this.dark,
        darkLight: darkLight ?? this.darkLight,
        main: main ?? this.main,
        bright: bright ?? this.bright,
        background: background ?? this.background,
        error: error ?? this.error,
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
      dark: Color.lerp(dark, other.dark, t),
      darkLight: Color.lerp(darkLight, other.darkLight, t),
      main: Color.lerp(main, other.main, t),
      bright: Color.lerp(bright, other.bright, t),
      background: Color.lerp(background, other.background, t),
      error: Color.lerp(error, other.error, t),
    );
  }

  static const lightTheme = CustomColors(
    dark: Color(0xff202124),
    darkLight: Color(0xff555555),
    main: Color(0xff9747ff),
    bright: Color(0xffe6e6e6),
    background: Color(0xffffffff),
    error: Color(0xffAB2E27),
  );

  static const darkTheme = CustomColors(
    dark: Color(0xff98C1D9),
    darkLight: Color(0xff3D5A80),
    main: Color(0xffe0fbfc),
    bright: Color(0xffee6c4d),
    background: Color(0xff293241),
    error: Color(0xffee6c4d),
  );
}
