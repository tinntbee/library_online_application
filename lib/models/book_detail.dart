// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:library_online_application/models/tag.dart';

class BookDetail {
  String id;
  String name;
  String image;
  int price;
  String? description;
  String? author;
  List<Tag>? tags;
  int totalRead;
  int totalLike;
  int totalDislike;
  String? linkIntro;
  int react;
  bool isHad;
  BookDetail({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.description,
    this.author,
    this.tags,
    required this.totalRead,
    required this.totalLike,
    required this.totalDislike,
    this.linkIntro,
    required this.react,
    required this.isHad,
  });

  BookDetail copyWith({
    String? id,
    String? name,
    String? image,
    int? price,
    String? description,
    String? author,
    List<Tag>? tags,
    int? totalRead,
    int? totalLike,
    int? totalDislike,
    int? liked,
    String? linkIntro,
    int? react,
    bool? isHad,
  }) {
    return BookDetail(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      description: description ?? this.description,
      author: author ?? this.author,
      tags: tags ?? this.tags,
      totalRead: totalRead ?? this.totalRead,
      totalLike: totalLike ?? this.totalLike,
      totalDislike: totalDislike ?? this.totalDislike,
      linkIntro: linkIntro ?? this.linkIntro,
      react: react ?? this.react,
      isHad: isHad ?? this.isHad,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'description': description,
      'author': author,
      'tags': tags?.map((x) => x.toMap()).toList(),
      'totalRead': totalRead,
      'totalLike': totalLike,
      'totalDislike': totalDislike,
      'linkIntro': linkIntro,
      'react': react,
      'isHad': isHad,
    };
  }

  factory BookDetail.fromMap(Map<String, dynamic> map) {
    print("book detail");
    print(map);
    return BookDetail(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      price: map['price'] as int,
      description:
          map['description'] != null ? map['description'] as String : null,
      author: map['author'] != null ? map['author'] as String : null,
      tags: map['tags'] != null
          ? List<Tag>.from(
              (map['tags'] as List<dynamic>).map<Tag?>(
                (x) {
                  if (x is String) {
                    return Tag.fromMap(
                        jsonDecode('{"_id": "${x}"}') as Map<String, dynamic>);
                  }
                  return Tag.fromMap(x as Map<String, dynamic>);
                },
              ),
            )
          : <Tag>[],
      totalRead: map['totalRead'] as int,
      totalLike: map['totalLike'] as int,
      totalDislike: map['totalDislike'] as int,
      linkIntro: map['linkIntro'] != null ? map['linkIntro'] as String : null,
      react: map['react'] as int,
      isHad: map['isHad'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookDetail.fromJson(String source) =>
      BookDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookDetail(id: $id, name: $name, image: $image, price: $price, description: $description, author: $author, tags: $tags, totalRead: $totalRead, totalLike: $totalLike, totalDislike: $totalDislike, linkIntro: $linkIntro, react: $react, isHad: $isHad)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookDetail &&
        other.id == id &&
        other.name == name &&
        other.image == image &&
        other.price == price &&
        other.description == description &&
        other.author == author &&
        listEquals(other.tags, tags) &&
        other.totalRead == totalRead &&
        other.totalLike == totalLike &&
        other.totalDislike == totalDislike &&
        other.linkIntro == linkIntro &&
        other.react == react &&
        other.isHad == isHad;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        price.hashCode ^
        description.hashCode ^
        author.hashCode ^
        tags.hashCode ^
        totalRead.hashCode ^
        totalLike.hashCode ^
        totalDislike.hashCode ^
        linkIntro.hashCode ^
        react.hashCode ^
        isHad.hashCode;
  }
}
