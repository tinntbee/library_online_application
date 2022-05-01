import 'dart:convert';

import 'package:library_online_application/models/book.dart';
import 'package:http/http.dart' as http;

class BookApi {
  static Future<List<Book>> getBookByTag(String? tagId) async {
    List<Book> books = [];
    final response = await http.get(
      Uri.parse('http://192.168.1.9:2005/books/bookByTag/' + tagId!),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      dynamic r = json.decode(response.body);
      Iterable l = r["books"];
      books = List<Book>.from(l.map((model) {
        return Book.fromJson(model);
      }));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to get Book By TagId');
    }
    return books;
  }
}
