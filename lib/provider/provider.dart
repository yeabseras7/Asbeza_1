import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:asbeza_1/model/food.dart';

class ApiServiceProvider {
  Future<Food?> fetchFood() async {
    final response = await http.get(
      Uri.parse(
          'https://edamam-food-and-grocery-database.p.rapidapi.com/parser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return Food.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}
