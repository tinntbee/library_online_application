import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:library_online_application/api/apis.dart';
import 'package:library_online_application/models/category.dart';

class CategoryApi {
  static Future<List<Category>> getCategories() async {
    List<Category> categories = [];
    final response = await http.get(
      Uri.parse(Apis.categoryBaseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      categories = List<Category>.from(l.map((model) {
        return Category.fromJson(model);
      }));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
    return categories;
  }
}
