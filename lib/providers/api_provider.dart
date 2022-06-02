import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api/apis.dart';

class ApiProvider {
  static Map<String, String> headers = {};

  static Future<http.Response> login(String idToken) async {
    final response = await http.post(
      Uri.parse('${Apis.accountBaseUrl}/login-google'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'tokenId': idToken,
      }),
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.headers);
      // print(user);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
    updateCookie(response);
    return response;
  }

  static Future<http.Response> get(String url) async {
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    updateCookie(response);
    return response;
  }

  static Future<http.Response> post(String url, dynamic data) async {
    print('>> post url "${url}"');
    http.Response response =
        await http.post(Uri.parse(url), body: data, headers: headers);
    updateCookie(response);
    return response;
  }

  static void updateCookie(http.Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
    print(headers);
  }
}
