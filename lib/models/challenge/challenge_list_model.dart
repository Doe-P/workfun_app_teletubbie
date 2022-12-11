
class ChallengeListModel {
    ChallengeListModel({
        this.id,
        this.userId,
        this.challengeId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.user,
        this.challenge,
    });

    int? id;
    int? userId;
    int? challengeId;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    User? user;
    Challenge? challenge;

    factory ChallengeListModel.fromJson(Map<String, dynamic> json) {
      return ChallengeListModel(
        id: json["id"],
        userId: json["user_id"],
        challengeId: json["challenge_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
        challenge: Challenge.fromJson(json["challenge"]),
    );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "challenge_id": challengeId,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
        "challenge": challenge?.toJson(),
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
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? title;
    String? description;
    String? type;
    int? groupId;
    int? point;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Challenge.fromJson(Map<String, dynamic> json){
      return Challenge(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        type: json["type"],
        groupId: json["group_id"],
        point: json["point"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "type": type,
        "group_id": groupId,
        "point": point,
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
        this.tel,
        this.notificationToken,
        this.createdAt,
        this.updatedAt,
        this.position,
    });

    int? id;
    String? name;
    String? surname;
    String? email;
    String? tel;
    String? notificationToken;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? position;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        surname: json["surname"],
        email: json["email"],
        tel: json["tel"],
        notificationToken: json["notification_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        position: json["position"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "surname": surname,
        "email": email,
        "tel": tel,
        "notification_token": notificationToken,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "position": position,
    };
}

