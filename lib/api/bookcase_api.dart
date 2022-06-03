import 'dart:convert';

import 'package:library_online_application/models/book_in_bookcase.dart';

import '../models/book.dart';
import '../providers/api_provider.dart';
import 'apis.dart';

class BookcaseApi {
  static Future<List<BookInBookcase>> getBooks() async {
    print('>> get books in bookcase');
    List<BookInBookcase> books = [];
    final response = await ApiProvider.get('${Apis.bookcaseBaseUrl}/books');
    if (response.statusCode == 200) {
      dynamic r = json.decode(response.body);
      Iterable l = r;
      books = List<BookInBookcase>.from(l.map((model) {
        return BookInBookcase.fromMap(model);
      }));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to get Books in Bookcase');
    }
    return books;
  }

  static Future<int> deleteBooks(String bookId) async {
    print('>> delete ${bookId} books in bookcase');
    final response = await ApiProvider.delete(
        '${Apis.bookcaseBaseUrl}/deleteBookInBookcase/${bookId}');
    if (response.statusCode == 200) {
      return 200;
    } else {
      if (response.statusCode == 404) {
        return 404;
      } else {
        if (response.statusCode == 500) {
          return 500;
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          throw Exception('Failed to get Books in Bookcase');
        }
      }
    }
  }

  static Future<List> getInfo() async {
    print('>> get bookcase');
    final response = await ApiProvider.get('${Apis.bookcaseBaseUrl}');
    print(response.statusCode);
    if (response.statusCode == 200) {
      dynamic r = json.decode(response.body);
      // Iterable l = r;
      print(r);
      // books = List<BookInBookcase>.from(l.map((model) {
      //   return BookInBookcase.fromMap(model);
      // }));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to get Books in Bookcase');
    }
    return [];
  }

  static Future<Book> detailBook(String? bookId) async {
    final response = await ApiProvider.get(
      ('${Apis.bookBaseUrl}/detail/' + bookId!),
    );
    if (response.statusCode == 200) {
      dynamic book = json.decode(response.body);
      // Iterable l = r;
      print(book);
      return Book.fromJson(book);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to get Book By ID');
    }
  }

  static Future<int> buyBook(String bookId) async {
    final response = await ApiProvider.post(
        '${Apis.bookcaseBaseUrl}/buyBook', <String, dynamic>{"bookId": bookId});
    return response.statusCode;
  }
}
