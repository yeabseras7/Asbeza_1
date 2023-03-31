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

  factory Item.histfromJson(Map<String, dynamic> parsedJson) {
    return Item(
      id: parsedJson["id"],
      title: parsedJson['title'],
      description: parsedJson['description'],
      price: parsedJson['price'],
      image: parsedJson['image'],
      category: parsedJson["category"],
    );
  }

  toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['title'] = title;
    json['description'] = description;
    json['price'] = price;
    json['category'] = category;
    json['image'] = image;
    return json;
  }

  static List foodList(List food) {
    List foods = [];
    for (var i = 0; i < food.length; i++) {
      foods.add(Item.fromJson(food[i]));
    }
    return foods;
  }

  static List histList(List values) {
    List items = [];
    for (var i = 0; i < values.length; i++) {
      items.add(Item.histfromJson(values[i]));
    }
    return items;
  }
}
