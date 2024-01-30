import 'package:flutter/material.dart';
import 'package:just_ready/styles/app_typography.dart';
import 'package:just_ready/styles/colors.dart';
import 'package:just_ready/styles/images.dart';

enum ThemeType {
  light,
  dark,
}

class ThemeModel with ChangeNotifier {
  ThemeType _currentTheme = ThemeType.dark;

  ThemeType get currentTheme => _currentTheme;

  List<ThemeExtension<dynamic>> _currentExtensions = _lightThemeExtensions;

  List<ThemeExtension<dynamic>> get currentExtensions => _currentExtensions;

  set setTheme(ThemeType themeType) {
    _currentTheme = themeType;
    switch (themeType) {
      case ThemeType.light:
        _currentExtensions = _lightThemeExtensions;
        break;
      case ThemeType.dark:
        _currentExtensions = _darkThemeExtensions;
        break;
      default:
        _currentExtensions = _lightThemeExtensions;
    }
    notifyListeners();
  }
}

 List<ThemeExtension<dynamic>> _lightThemeExtensions = [
  CustomColors.lightTheme,
  CustomIllustrations.standard,
  CustomTypography.standard,
];

 List<ThemeExtension<dynamic>> _darkThemeExtensions = [
  CustomColors.darkTheme,
  CustomIllustrations.standard,
  CustomTypography.standard,
];
