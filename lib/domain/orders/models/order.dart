class Order {
  final String id;
  final int orderNumber;
  final Map<int, int> mealNumbersMap; //key - mealNumber, value - quantity
  final String note;

  Order({
    required this.id,
    required this.orderNumber,
    required this.mealNumbersMap,
    required this.note,
  });
}
