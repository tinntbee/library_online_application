import 'dart:convert';

import 'package:library_online_application/models/note.dart';

import '../providers/api_provider.dart';
import 'apis.dart';

class NoteApi {
  static Future<List<Note>> getNotes() async {
    List<Note> notes = [];
    final response = await ApiProvider.get('${Apis.noteBaseUrl}/getAll');
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      notes = List<Note>.from(l.map((model) {
        return Note.fromMap(model);
      }));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load notes');
    }
    return notes;
  }
}
