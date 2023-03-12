class Item {
  num id;
  String title;
  num price;
  String description;
  String category;
  String image;

  Item({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory Item.fromJson(Map<String, dynamic> parsedjson) {
    return Item(
      id: parsedjson['id'],
      title: parsedjson['title'],
      price: parsedjson['price'],
      description: parsedjson['description'],
      category: parsedjson['category'],
      image: parsedjson['image'],
    );
  }

  static List? foodList(List food) {
    List foods = [];
    for (var i = 0; i < food.length; i++) {
      foods.add(Item.fromJson(food[i]));
    }
    return foods;
  }
}
