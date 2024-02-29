import 'dart:ui';

class Meal {
  final String name;
  final int number;
  final double price;
  final double? doublePrice;

  Meal({
    required this.name,
    required this.number,
    required this.price,
    this.doublePrice,
  });

  Color getColor() {
    List<Color> colors = [
      const Color(0xffB9B5C3),
      const Color(0xFF1E88E5),
      const Color(0xFF43A047),
      const Color(0xFF8E24AA),
      const Color(0xFFE91E63),
      const Color(0xFFFF9800),
      const Color(0xFF795548),
      const Color(0xFF673AB7),
      const Color(0xFF009688),
      const Color(0xFF2196F3),
      const Color(0xFF4CAF50),
      const Color(0xFFFFC107),
      const Color(0xFF9C27B0),
      const Color(0xFF607D8B),
      const Color(0xFFCDDC39),
      const Color(0xFF3F51B5),
      const Color(0xFF009688),
      const Color(0xFFFF5722),
      const Color(0xFF00BCD4),
      const Color(0xFFFFEB3B),
      const Color(0xFF795548),
    ];
    return colors[number % colors.length];
  }
}
