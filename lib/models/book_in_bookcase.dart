// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:library_online_application/models/book.dart';

class BookInBookcase {
  String? id;
  String? name;
  String? user;
  Book? book;
  String? key;
  int? progress;
  int? status;
  int? currentPage;
  int? isRefunded;
  BookInBookcase({
    this.id,
    this.name,
    this.user,
    this.book,
    this.key,
    this.progress,
    this.status,
    this.currentPage,
    this.isRefunded,
  });

  BookInBookcase copyWith({
    String? id,
    String? name,
    String? user,
    Book? book,
    String? key,
    int? progress,
    int? status,
    int? currentPage,
    int? isRefunded,
  }) {
    return BookInBookcase(
      id: id ?? this.id,
      name: name ?? this.name,
      user: user ?? this.user,
      book: book ?? this.book,
      key: key ?? this.key,
      progress: progress ?? this.progress,
      status: status ?? this.status,
      currentPage: currentPage ?? this.currentPage,
      isRefunded: isRefunded ?? this.isRefunded,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'user': user,
      'book': book?.toMap(),
      'key': key,
      'progress': progress,
      'status': status,
      'currentPage': currentPage,
      'isRefunded': isRefunded,
    };
  }

  factory BookInBookcase.fromMap(Map<String, dynamic> map) {
    return BookInBookcase(
      id: map['_id'] != null ? map['_id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      user: map['user'] != null ? map['user'] as String : null,
      book: map['book'] != null
          ? Book.fromMap(map['book'] as Map<String, dynamic>)
          : null,
      key: map['key'] != null ? map['key'] as String : null,
      progress: map['progress'] != null ? map['progress'] as int : null,
      status: map['status'] != null ? map['status'] as int : null,
      currentPage:
          map['currentPage'] != null ? map['currentPage'] as int : null,
      isRefunded: map['isRefunded'] != null ? map['isRefunded'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookInBookcase.fromJson(String source) =>
      BookInBookcase.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookInBookcase(id: $id, name: $name, user: $user, book: $book, key: $key, progress: $progress, status: $status, currentPage: $currentPage, isRefunded: $isRefunded)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookInBookcase &&
        other.id == id &&
        other.name == name &&
        other.user == user &&
        other.book == book &&
        other.key == key &&
        other.progress == progress &&
        other.status == status &&
        other.currentPage == currentPage &&
        other.isRefunded == isRefunded;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        user.hashCode ^
        book.hashCode ^
        key.hashCode ^
        progress.hashCode ^
        status.hashCode ^
        currentPage.hashCode ^
        isRefunded.hashCode;
  }
}
