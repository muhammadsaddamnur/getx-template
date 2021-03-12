import 'dart:convert';

NavigatorModel testModelFromJson(String str) =>
    NavigatorModel.fromJson(json.decode(str));

String testModelToJson(NavigatorModel data) => json.encode(data.toJson());

class NavigatorModel {
  NavigatorModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory NavigatorModel.fromJson(Map<String, dynamic> json) => NavigatorModel(
        userId: json["userId"] == null ? null : json["userId"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        body: json["body"] == null ? null : json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId == null ? null : userId,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "body": body == null ? null : body,
      };
}
