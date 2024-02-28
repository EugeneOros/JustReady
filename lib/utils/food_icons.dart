import 'dart:math';

import 'package:just_ready/styles/images.dart';

final foodIcons = [
  IconsSvg.carrot24,
  IconsSvg.toast24,
  IconsSvg.nachos24,
  IconsSvg.lemonade24,
  IconsSvg.pizza24,
  IconsSvg.waffle24,
  IconsSvg.avocado24,
  IconsSvg.grape24,
  IconsSvg.nachos24,
  IconsSvg.lemon24,
  IconsSvg.coffee24,
  IconsSvg.shake24,
  IconsSvg.nachos24,
  IconsSvg.burger24,
  IconsSvg.pizza24,
  IconsSvg.avocado24,
  IconsSvg.toast24,
  IconsSvg.coffee24,
];

String getRandomFoodIcon() {
  Random random = Random();
  final randomIndex = random.nextInt(foodIcons.length);
  return foodIcons[randomIndex];
}
