import 'dart:convert';

import 'package:library_online_application/models/book.dart';
import 'package:http/http.dart' as http;

import 'apis.dart';

class BookApi {
  static Future<List<Book>> getBookByTag(String? tagId) async {
    List<Book> books = [];
    final response = await http.get(
      Uri.parse('${Apis.bookBaseUrl}/bookByTag/' + tagId!),
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

  static Future<List<Book>> getBooksTrending() async {
    List<Book> books = [];
    final response = await http.get(
      Uri.parse('${Apis.bookBaseUrl}/trending/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
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
