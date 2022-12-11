// To parse this JSON data, do
//
//     final challengeListModel = challengeListModelFromJson(jsonString);

import 'dart:convert';

ChallengeListModel challengeListModelFromJson(String str) =>
    ChallengeListModel.fromJson(json.decode(str));

String challengeListModelToJson(ChallengeListModel data) =>
    json.encode(data.toJson());

class ChallengeListModel {
  ChallengeListModel({
    this.id,
    this.userId,
    this.challengeId,
    this.status,
    this.heatScore,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.description,
    this.type,
    this.groupId,
    this.point,
    this.user,
    this.challenge,
  });

  int? id;
  int? userId;
  int? challengeId;
  String? status;
  dynamic heatScore;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? title;
  String? description;
  String? type;
  int? groupId;
  int? point;
  User? user;
  List<Challenge>? challenge;

  factory ChallengeListModel.fromJson(Map<String, dynamic> json) =>
      ChallengeListModel(
        id: json["id"],
        userId: json["user_id"],
        challengeId: json["challenge_id"],
        status: json["status"],
        heatScore: json["heat_score"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        title: json["title"],
        description: json["description"],
        type: json["type"],
        groupId: json["group_id"],
        point: json["point"],
        user: User.fromJson(json["user"]),
        challenge: List<Challenge>.from(json["group_user"].map((x) {
          return Challenge.fromJson(x);
        })),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "challenge_id": challengeId,
        "status": status,
        "heat_score": heatScore,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "title": title,
        "description": description,
        "type": type,
        "group_id": groupId,
        "point": point,
        "user": user?.toJson(),
        "challenge": List<dynamic>.from(challenge!.map((x) => x.toJson())),
      };
}

class Challenge {
  Challenge({
    this.id,
    this.title,
    this.description,
    this.type,
    this.groupId,
    this.point,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? description;
  String? type;
  int? groupId;
  int? point;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Challenge.fromJson(Map<String, dynamic> json) => Challenge(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        type: json["type"],
        groupId: json["group_id"],
        point: json["point"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "type": type,
        "group_id": groupId,
        "point": point,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
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
