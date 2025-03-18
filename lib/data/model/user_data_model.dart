// import 'dart:convert';

// UserDataModel welcomeFromJson(String str) => UserDataModel.fromJson(json.decode(str));
//
// String welcomeToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  bool? status;
  String? message;
  List<Users>? data;

  UserDataModel({
    this.status,
    this.message,
    this.data,
  });

  // UserDataModel copyWith({
  //   bool? status,
  //   String? message,
  //   List<Users>? data,
  // }) =>
  //     UserDataModel(
  //       status: status ?? this.status,
  //       message: message ?? this.message,
  //       data: data ?? this.data,
  //     );

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Users>.from(json["data"]!.map((x) => Users.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Users {
  String? id;
  String? name;
  String? email;
  String? mobileNumber;
  String? password;
  String? image;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Users({
    this.id,
    this.name,
    this.email,
    this.mobileNumber,
    this.password,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  // Users copyWith({
  //   String? id,
  //   String? name,
  //   String? email,
  //   String? mobileNumber,
  //   String? password,
  //   String? image,
  //   String? status,
  //   DateTime? createdAt,
  //   DateTime? updatedAt,
  // }) =>
  //     Users(
  //       id: id ?? this.id,
  //       name: name ?? this.name,
  //       email: email ?? this.email,
  //       mobileNumber: mobileNumber ?? this.mobileNumber,
  //       password: password ?? this.password,
  //       image: image ?? this.image,
  //       status: status ?? this.status,
  //       createdAt: createdAt ?? this.createdAt,
  //       updatedAt: updatedAt ?? this.updatedAt,
  //     );

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    mobileNumber: json["mobile_number"],
    password: json["password"],
    image: json["image"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "mobile_number": mobileNumber,
    "password": password,
    "image": image,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
