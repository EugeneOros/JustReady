class MealAddonDto {
  final String name;
  final double price;

  const MealAddonDto({required this.name, required this.price});

  factory MealAddonDto.fromJson(Map<String, dynamic> json) => MealAddonDto(
        name: json['name'] as String,
        price: (json['price'] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
      };
}
