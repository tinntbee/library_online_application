import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:library_online_application/models/book_in_bookcase.dart';
import 'package:library_online_application/models/note.dart';

class BookcaseProvider extends ChangeNotifier {
  final List<BookInBookcase> _books = [];
  final List<Note> _notes = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<BookInBookcase> get books =>
      UnmodifiableListView(_books);
  UnmodifiableListView<Note> get notes => UnmodifiableListView(_notes);

  void setBooks(List<BookInBookcase> books) {
    _books.clear();
    _books.addAll(books);
    notifyListeners();
  }

  void setNotes(List<Note> notes) {
    _notes.clear();
    _notes.addAll(notes);
    notifyListeners();
  }

  void deleteBooks(String bookId) {
    _books.removeWhere((element) => element.book!.id == bookId);
    notifyListeners();
  }

  void deleteNote(String noteId) {
    _notes.removeWhere((element) => element.id == noteId);
    notifyListeners();
  }
}
