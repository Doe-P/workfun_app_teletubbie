

class GroupInfoModel {
    GroupInfoModel({
         this.groupInfo,
         this.groupUser,
    });

    GroupInfo? groupInfo;
    List<GroupUser>? groupUser;

    factory GroupInfoModel.fromJson(Map<String, dynamic> json){
      return GroupInfoModel(
        groupInfo: GroupInfo.fromJson(json["group_info"]),
        groupUser: List<GroupUser>.from(json["group_user"].map((x){
          return  GroupUser.fromJson(x);
        })),
    );
    }

    Map<String, dynamic> toJson() => {
        "group_info": groupInfo?.toJson(),
        "group_user": List<dynamic>.from(groupUser!.map((x) => x.toJson())),
    };
}

class GroupInfo {
    GroupInfo({
        this.id,
        this.name,
        this.description,
        this.code,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? name;
    String? description;
    String? code;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory GroupInfo.fromJson(Map<String, dynamic> json) => GroupInfo(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        code: json["code"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "code": code,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class GroupUser {
    GroupUser({
        this.id,
        this.userId,
        this.groupId,
        this.type,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.user,
    });

    int? id;
    int? userId;
    int? groupId;
    String? type;
    int? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    User? user;

    factory GroupUser.fromJson(Map<String, dynamic> json){
      return GroupUser(
        id: json["id"],
        userId: json["user_id"],
        groupId: json["group_id"],
        type: json["type"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
    );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "group_id": groupId,
        "type": type,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
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
