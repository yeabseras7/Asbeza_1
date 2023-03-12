import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:asbeza_1/model/food.dart';

class ApiServiceProvider {
  Future<List?> fetchItem() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return Item.foodList(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}
