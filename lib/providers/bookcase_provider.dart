import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:library_online_application/api/book_api.dart';
import 'package:library_online_application/api/bookcase_api.dart';
import 'package:library_online_application/api/note_api.dart';
import 'package:library_online_application/models/book_in_bookcase.dart';
import 'package:library_online_application/models/note.dart';

class BookcaseProvider extends ChangeNotifier {
  List<BookInBookcase> _books = [];
  List<Note> _notes = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<BookInBookcase> get books =>
      UnmodifiableListView(_books);
  List<Note> get notes {
    return _notes;
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
    super.addListener(listener);
  }

  Future<void> fetchAndSetBooks() async {
    try {
      List<BookInBookcase> books = await BookcaseApi.getBooks();
      await Future.delayed(Duration(seconds: 2));
      _books = books;
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> fetchAndSetNotes() async {
    try {
      final List<Note> loadedNotesActive = await NoteApi.getNotes();
      _notes = loadedNotesActive;
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<int> deleteAndUpdateNotes(String noteId) async {
    try {
      int status = await NoteApi.deleteNote(noteId);
      if (status == 200) {
        _notes.removeWhere((element) => element.id == noteId);
        notifyListeners();
        return 200;
      } else {
        return 400;
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<int> deleteAndUpdateBooks(String bookId) async {
    try {
      int status = await BookcaseApi.deleteBooks(bookId);
      if (status == 200) {
        _books.removeWhere((element) => element.book!.id == bookId);
        _notes.removeWhere((element) => element.book.id == bookId);
        notifyListeners();
        return 200;
      } else {
        return 400;
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }

  void addBook(BookInBookcase book) {
    _books.add(book);
    notifyListeners();
  }

  Future<int> addNoteAndUpdate(Note note) async {
    try {
      Note newNote =
          await NoteApi.createNote(note.name, note.book.id, note.image ?? "");
      _notes.add(newNote);
      notifyListeners();
      return 200;
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> modifyNoteInfo(Note note) async {
    try {
      await NoteApi.modifyNoteInfo(note.id, note.name, note.image ?? "");
      int index = _notes.indexWhere((n) => n.id == note.id);
      _notes.replaceRange(index, index + 1, [note]);
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
