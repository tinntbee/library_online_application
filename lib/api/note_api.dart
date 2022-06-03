import 'dart:convert';

import 'package:library_online_application/models/note.dart';

import '../providers/api_provider.dart';
import 'apis.dart';

class NoteApi {
  static Future<Note> getNote(String noteId) async {
    Note note;
    final response =
        await ApiProvider.get('${Apis.noteBaseUrl}/getDetail/$noteId');
    if (response.statusCode == 200) {
      note = Note.fromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load note');
    }
    return note;
  }

  static Future<List<Note>> getNotes() async {
    List<Note> notes = [];
    final response = await ApiProvider.get('${Apis.noteBaseUrl}/getAll');
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      print(l);
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

  static Future<List<Note>> getNotesActive() async {
    List<Note> notes = [];
    final response =
        await ApiProvider.get('${Apis.noteBaseUrl}/getNotesActive');
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

  static Future<Note> getNotesDetail() async {
    Note notes;
    final response =
        await ApiProvider.get('${Apis.noteBaseUrl}/getNotesActive');
    if (response.statusCode == 200) {
      notes = Note.fromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load notes');
    }
    return notes;
  }

  static Future<int> changeContent(String _id, String content) async {
    print('>> change content');
    final response = await ApiProvider.put('${Apis.noteBaseUrl}/content',
        <String, dynamic>{"_id": _id, "content": content});
    if (response.statusCode == 200) {
      return 200;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load notes');
    }
    return 400;
  }

  static Future<int> changePage(String _id, int page) async {
    print('>> change page');
    final response = await ApiProvider.put('${Apis.noteBaseUrl}/page',
        <String, dynamic>{"_id": _id, "page": page});
    if (response.statusCode == 200) {
      return 200;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load notes');
    }
    return 400;
  }

//   //NOTE: close note
// router.get("/close/:_id", authUser, noteController.closeNote);

  static Future<int> closeNote(String noteId) async {
    final response = await ApiProvider.get('${Apis.noteBaseUrl}/close/$noteId');
    if (response.statusCode == 200) {
      return 200;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load notes');
    }
    return 400;
  }

  static Future<int> deleteNote(String noteId) async {
    print('>> delete ${noteId} books in bookcase');
    final response = await ApiProvider.delete('${Apis.noteBaseUrl}/$noteId');
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
          throw Exception('Failed to Delete note');
        }
      }
    }
  }

  static Future<Note> createNote(
      String name, String bookId, String image) async {
    print('>> create note into bookcase');
    Note note;
    final response = await ApiProvider.post('${Apis.noteBaseUrl}',
        <String, dynamic>{"name": name, "book": bookId, "image": image});
    if (response.statusCode == 200) {
      note = Note.fromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load notes');
    }
    return note;
  }

  static Future<Note> modifyNoteInfo(
      String _id, String name, String image) async {
    print('>> modify note into bookcase');
    Note note;
    final response = await ApiProvider.put('${Apis.noteBaseUrl}/changeInfo',
        <String, dynamic>{"_id": _id, "name": name, "image": image});
    if (response.statusCode == 200) {
      note = Note.fromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load notes');
    }
    return note;
  }
}
