import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:library_online_application/api/apis.dart';
import 'package:library_online_application/models/category.dart';
import 'package:library_online_application/models/tag.dart';
import 'package:library_online_application/providers/api_provider.dart';

class TagApi {
  static Future<List<Tag>> getTags() async {
    List<Tag> tags = [];
    final response = await ApiProvider.get(Apis.tagBaseUrl);
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      tags = List<Tag>.from(l.map((model) {
        return Tag.fromMap(model);
      }));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load tags');
    }
    return tags;
  }
}
