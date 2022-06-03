// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppUser {
  String? id;
  String? name;
  String? gender;
  String? nickname;
  String? email;
  String? avatar;
  String? avatarGoogle;
  String? cover;
  String? faculty;
  DateTime? dob;
  int? hoa;
  int? is_banned;
  AppUser({
    this.id,
    this.name,
    this.gender,
    this.nickname,
    this.email,
    this.avatar,
    this.avatarGoogle,
    this.cover,
    this.faculty,
    this.dob,
    this.hoa,
    this.is_banned,
  });

  AppUser copyWith({
    String? id,
    String? name,
    String? gender,
    String? nickname,
    String? email,
    String? avatar,
    String? avatarGoogle,
    String? cover,
    String? faculty,
    DateTime? dob,
    int? hoa,
    int? is_banned,
  }) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      nickname: nickname ?? this.nickname,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      avatarGoogle: avatarGoogle ?? this.avatarGoogle,
      cover: cover ?? this.cover,
      faculty: faculty ?? this.faculty,
      dob: dob ?? this.dob,
      hoa: hoa ?? this.hoa,
      is_banned: is_banned ?? this.is_banned,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'gender': gender,
      'nickname': nickname,
      'email': email,
      'avatar': avatar,
      'avatarGoogle': avatarGoogle,
      'cover': cover,
      'faculty': faculty,
      'dob': dob?.millisecondsSinceEpoch,
      'hoa': hoa,
      'is_banned': is_banned,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['_id'] != null ? map['_id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      nickname: map['nickname'] != null ? map['nickname'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      avatarGoogle:
          map['avatarGoogle'] != null ? map['avatarGoogle'] as String : null,
      cover: map['cover'] != null ? map['cover'] as String : null,
      faculty: map['faculty'] != null ? map['faculty'] as String : null,
      dob: map['dob'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dob'] as int)
          : null,
      hoa: map['hoa'] != null ? map['hoa'] as int : null,
      is_banned: map['is_banned'] != null ? map['is_banned'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppUser(id: $id, name: $name, gender: $gender, nickname: $nickname, email: $email, avatar: $avatar, avatarGoogle: $avatarGoogle, cover: $cover, faculty: $faculty, dob: $dob, hoa: $hoa, is_banned: $is_banned)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUser &&
        other.id == id &&
        other.name == name &&
        other.gender == gender &&
        other.nickname == nickname &&
        other.email == email &&
        other.avatar == avatar &&
        other.avatarGoogle == avatarGoogle &&
        other.cover == cover &&
        other.faculty == faculty &&
        other.dob == dob &&
        other.hoa == hoa &&
        other.is_banned == is_banned;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        gender.hashCode ^
        nickname.hashCode ^
        email.hashCode ^
        avatar.hashCode ^
        avatarGoogle.hashCode ^
        cover.hashCode ^
        faculty.hashCode ^
        dob.hashCode ^
        hoa.hashCode ^
        is_banned.hashCode;
  }
}
