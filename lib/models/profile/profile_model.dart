// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.id,
    this.name,
    this.surname,
    this.email,
    this.emailVerifiedAt,
    this.tel,
    this.notificationToken,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.position,
  });

  int? id;
  String? name;
  String? surname;
  String? email;
  dynamic emailVerifiedAt;
  String? tel;
  dynamic notificationToken;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? position;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        name: json["name"],
        surname: json["surname"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        tel: json["tel"],
        notificationToken: json["notification_token"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "surname": surname,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "tel": tel,
        "notification_token": notificationToken,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "position": position,
      };
}
