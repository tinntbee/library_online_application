// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:library_online_application/models/tag.dart';

class Category {
  String id;
  String? name;
  String? namenosign;
  String? thumbnail;
  String? quote;
  String? color;
  int? is_active;
  List<Tag>? tags;

  Category({
    required this.id,
    this.name,
    this.namenosign,
    this.thumbnail,
    this.quote,
    this.color,
    this.is_active,
    this.tags,
  });

  Category copyWith({
    String? id,
    String? name,
    String? namenosign,
    String? thumbnail,
    String? quote,
    String? color,
    int? is_active,
    List<Tag>? tags,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      namenosign: namenosign ?? this.namenosign,
      thumbnail: thumbnail ?? this.thumbnail,
      quote: quote ?? this.quote,
      color: color ?? this.color,
      is_active: is_active ?? this.is_active,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'namenosign': namenosign,
      'thumbnail': thumbnail,
      'quote': quote,
      'color': color,
      'is_active': is_active,
      'tags': tags?.map((x) => x.toMap()).toList(),
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['_id'] as String,
      name: map['name'] as String?,
      namenosign: map['namenosign'] as String?,
      thumbnail: map['thumbnail'] as String?,
      quote: map['quote'] as String?,
      color: map['color'] as String?,
      is_active: map['is_active'] as int?,
      tags: List<Tag>.from(
        (map['tags'] as List<dynamic>).map<Tag>(
          (x) => Tag.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(source) =>
      Category.fromMap(source as Map<String, dynamic>);

  @override
  String toString() {
    return 'Category(id: $id, name: $name, namenosign: $namenosign, thumbnail: $thumbnail, quote: $quote, color: $color, is_active: $is_active, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.id == id &&
        other.name == name &&
        other.namenosign == namenosign &&
        other.thumbnail == thumbnail &&
        other.quote == quote &&
        other.color == color &&
        other.is_active == is_active &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        namenosign.hashCode ^
        thumbnail.hashCode ^
        quote.hashCode ^
        color.hashCode ^
        is_active.hashCode ^
        tags.hashCode;
  }
}
