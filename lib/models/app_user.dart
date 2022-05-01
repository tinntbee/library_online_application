// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppUser {
  String? id;
  String? name;
  String? email;
  String avatar;
  int? hoa;
  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.hoa,
  });

  AppUser copyWith({
    String? id,
    String? name,
    String? email,
    String? avatar,
    int? hoa,
  }) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      hoa: hoa ?? this.hoa,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
      'hoa': hoa,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> user = map['user'];
    return AppUser(
      id: user['_id'] as String?,
      name: user['name'] as String?,
      email: user['email'] as String?,
      avatar: user['avatar'] as String,
      hoa: user['hoa'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppUser(id: $id, name: $name, email: $email, avatar: $avatar, hoa: $hoa)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUser &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.avatar == avatar &&
        other.hoa == hoa;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        avatar.hashCode ^
        hoa.hashCode;
  }
}
