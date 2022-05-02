// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:library_online_application/models/app_user.dart';
import 'package:library_online_application/models/tag.dart';

class Book {
  String id;
  String name;
  String? namenosign;
  String? author;
  String? authorNoSign;
  List<Tag>? tags;
  String? description;
  String? descriptionNoSign;
  String? image;
  int? is_active;
  String? quote;
  int? price;
  String? link;
  String? linkIntro;
  String? key;
  int? totalPage;
  int? totalLike;
  int? totalDislike;
  int? totalComment;
  int? totalRead;

  Book({
    required this.id,
    required this.name,
    this.namenosign,
    this.author,
    this.authorNoSign,
    this.tags,
    this.description,
    this.descriptionNoSign,
    this.image,
    this.is_active,
    this.quote,
    this.price,
    this.link,
    this.linkIntro,
    this.key,
    this.totalPage,
    this.totalLike,
    this.totalDislike,
    this.totalComment,
    this.totalRead,
  });

  Book copyWith({
    String? id,
    String? name,
    String? namenosign,
    String? author,
    String? authorNoSign,
    List<Tag>? tags,
    String? description,
    String? descriptionNoSign,
    String? image,
    int? is_active,
    String? quote,
    int? price,
    String? link,
    String? linkIntro,
    String? key,
    int? totalPage,
    int? totalLike,
    int? totalDislike,
    int? totalComment,
    int? totalRead,
  }) {
    return Book(
      id: id ?? this.id,
      name: name ?? this.name,
      namenosign: namenosign ?? this.namenosign,
      author: author ?? this.author,
      authorNoSign: authorNoSign ?? this.authorNoSign,
      tags: tags ?? this.tags,
      description: description ?? this.description,
      descriptionNoSign: descriptionNoSign ?? this.descriptionNoSign,
      image: image ?? this.image,
      is_active: is_active ?? this.is_active,
      quote: quote ?? this.quote,
      price: price ?? this.price,
      link: link ?? this.link,
      linkIntro: linkIntro ?? this.linkIntro,
      key: key ?? this.key,
      totalPage: totalPage ?? this.totalPage,
      totalLike: totalLike ?? this.totalLike,
      totalDislike: totalDislike ?? this.totalDislike,
      totalComment: totalComment ?? this.totalComment,
      totalRead: totalRead ?? this.totalRead,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'namenosign': namenosign,
      'author': author,
      'authorNoSign': authorNoSign,
      'tags': tags?.map((x) => x.toMap()).toList(),
      'description': description,
      'descriptionNoSign': descriptionNoSign,
      'image': image,
      'is_active': is_active,
      'quote': quote,
      'price': price,
      'link': link,
      'linkIntro': linkIntro,
      'key': key,
      'totalPage': totalPage,
      'totalLike': totalLike,
      'totalDislike': totalDislike,
      'totalComment': totalComment,
      'totalRead': totalRead,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['_id'] as String,
      name: map['name'] as String,
      namenosign: map['namenosign'] as String?,
      author: map['author'] as String?,
      authorNoSign: map['authorNoSign'] as String?,
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
      description: map['description'] as String?,
      descriptionNoSign: map['descriptionNoSign'] as String?,
      image: map['image'] as String?,
      is_active: map['is_active'] as int?,
      quote: map['quote'] != null ? map['quote'][0] as String? : "-",
      price: map['price'] as int?,
      link: map['link'] as String?,
      linkIntro: map['linkIntro'] as String?,
      key: map['key'] as String?,
      totalPage: map['totalPage'] as int?,
      totalLike: map['totalLike'] as int?,
      totalDislike: map['totalDislike'] as int?,
      totalComment: map['totalComment'] as int?,
      totalRead: map['totalRead'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(source) => Book.fromMap(source as Map<String, dynamic>);

  @override
  String toString() {
    return 'Book(id: $id, name: $name, namenosign: $namenosign, author: $author, authorNoSign: $authorNoSign, tags: $tags, description: $description, descriptionNoSign: $descriptionNoSign, image: $image, is_active: $is_active, quote: $quote, price: $price, link: $link, linkIntro: $linkIntro, key: $key, totalPage: $totalPage, totalLike: $totalLike, totalDislike: $totalDislike, totalComment: $totalComment, totalRead: $totalRead)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Book &&
        other.id == id &&
        other.name == name &&
        other.namenosign == namenosign &&
        other.author == author &&
        other.authorNoSign == authorNoSign &&
        listEquals(other.tags, tags) &&
        other.description == description &&
        other.descriptionNoSign == descriptionNoSign &&
        other.image == image &&
        other.is_active == is_active &&
        other.quote == quote &&
        other.price == price &&
        other.link == link &&
        other.linkIntro == linkIntro &&
        other.key == key &&
        other.totalPage == totalPage &&
        other.totalLike == totalLike &&
        other.totalDislike == totalDislike &&
        other.totalComment == totalComment &&
        other.totalRead == totalRead;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        namenosign.hashCode ^
        author.hashCode ^
        authorNoSign.hashCode ^
        tags.hashCode ^
        description.hashCode ^
        descriptionNoSign.hashCode ^
        image.hashCode ^
        is_active.hashCode ^
        quote.hashCode ^
        price.hashCode ^
        link.hashCode ^
        linkIntro.hashCode ^
        key.hashCode ^
        totalPage.hashCode ^
        totalLike.hashCode ^
        totalDislike.hashCode ^
        totalComment.hashCode ^
        totalRead.hashCode;
  }
}
