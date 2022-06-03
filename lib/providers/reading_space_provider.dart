import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:library_online_application/api/note_api.dart';
import 'package:library_online_application/models/note.dart';
import 'package:library_online_application/screens/reading-space/widgets/reading_space/reading_and_note_space.dart';

class ReadingSpaceProvider extends ChangeNotifier {
  List<Note> _notesActive = [];
  List<Widget> _readingAndNoteSpace = [];
  int? _index;

  List<Note> get notesActive {
    return _notesActive;
  }

  List<Widget> get readingAndNoteSpace {
    return _readingAndNoteSpace;
  }

  int? get index {
    return _index;
  }

  Future<void> fetchAndSetNoteDetail(String noteId) async {
    try {
      final Note note = await NoteApi.getNote(noteId);
      int index = _notesActive.indexWhere((element) => element.id == note.id);
      if (index < 0) {
        _notesActive.add(note);
        _readingAndNoteSpace.add(ReadingAndNoteSpace(noteId: note.id));
        index = _notesActive.length - 1;
      }
      _index = index;
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> fetchAndSetNotesActive() async {
    try {
      final List<Note> loadedNotesActive = await NoteApi.getNotesActive();
      _notesActive = loadedNotesActive;
      for (var note in loadedNotesActive) {
        _readingAndNoteSpace.add(ReadingAndNoteSpace(noteId: note.id));
      }
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> closeAndUpdateNotesActive(String noteId) async {
    try {
      int status = await NoteApi.closeNote(noteId);
      if (status == 200) {
        int index = _notesActive.indexWhere((element) => element.id == noteId);
        _notesActive.removeAt(index);
        _readingAndNoteSpace.removeAt(index);
      }
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  void deleteNote(String noteId) {
    print("delete");
    print(_notesActive);
    _notesActive.removeWhere((element) => element.id == noteId);
    print(_notesActive);
    notifyListeners();
  }

  void addNote(Note note) {
    _notesActive.add(note);
    notifyListeners();
  }

  void modifyNoteInfo(Note note) {
    int index = _notesActive.indexWhere((n) => n.id == note.id);
    _notesActive.replaceRange(index, index + 1, [note]);
    notifyListeners();
  }
}
