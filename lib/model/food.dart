import 'nutrient.dart';

class Food {
  String foodId;
  String uri;
  String label;
  String category;
  String categoryLabel;
  String image;
  Nutrient nutrient;

  Food(
      {required this.foodId,
      required this.uri,
      required this.label,
      required this.category,
      required this.categoryLabel,
      required this.image,
      required this.nutrient});

  factory Food.fromJson(Map<String, dynamic> parsedJson) {
    return Food(
      foodId: parsedJson['foodId'],
      uri: parsedJson['uri'],
      label: parsedJson['label'],
      category: parsedJson['category'],
      categoryLabel: parsedJson['categoryLabel'],
      image: parsedJson['image'],
      nutrient: parsedJson['nutrient'],
    );
  }
}
