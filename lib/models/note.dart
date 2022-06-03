// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:library_online_application/models/book.dart';

class Note {
  String id;
  String user;
  Book book;
  String name;
  String? content;
  String? image;
  int? page;
  int? status;
  Note({
    required this.id,
    required this.user,
    required this.book,
    required this.name,
    this.content,
    this.image,
    this.page,
    this.status,
  });

  Note copyWith({
    String? id,
    String? user,
    Book? book,
    String? name,
    String? content,
    String? image,
    int? page,
    int? status,
  }) {
    return Note(
      id: id ?? this.id,
      user: user ?? this.user,
      book: book ?? this.book,
      name: name ?? this.name,
      content: content ?? this.content,
      image: image ?? this.image,
      page: page ?? this.page,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user,
      'book': book.toMap(),
      'name': name,
      'content': content,
      'image': image,
      'page': page,
      'status': status,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['_id'] as String,
      user: map['user'] as String,
      book: Book.fromMap(map['book'] as Map<String, dynamic>),
      name: map['name'] as String,
      content: map['content'] != null ? map['content'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      page: map['page'] != null ? map['page'] as int : null,
      status: map['status'] != null ? map['status'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Note(id: $id, user: $user, book: $book, name: $name, content: $content, image: $image, page: $page, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Note &&
        other.id == id &&
        other.user == user &&
        other.book == book &&
        other.name == name &&
        other.content == content &&
        other.image == image &&
        other.page == page &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user.hashCode ^
        book.hashCode ^
        name.hashCode ^
        content.hashCode ^
        image.hashCode ^
        page.hashCode ^
        status.hashCode;
  }
}
