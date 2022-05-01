// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Tag {
  String? id;
  String? name;
  String? description;
  String? category;
  int? is_active;
  Tag({
    this.id,
    this.name,
    this.description,
    this.category,
    this.is_active,
  });

  Tag copyWith({
    String? id,
    String? name,
    String? description,
    String? category,
    int? is_active,
  }) {
    return Tag(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      is_active: is_active ?? this.is_active,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'is_active': is_active,
    };
  }

  factory Tag.fromMap(Map<String, dynamic> map) {
    return Tag(
      id: map['_id'] as String,
      name: map['name'] as String?,
      description: map['description'] as String?,
      category: map['category'] as String?,
      is_active: map['is_active'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tag.fromJson(String source) =>
      Tag.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Tag(id: $id, name: $name, description: $description, category: $category, is_active: $is_active)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tag &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.category == category &&
        other.is_active == is_active;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        category.hashCode ^
        is_active.hashCode;
  }
}
