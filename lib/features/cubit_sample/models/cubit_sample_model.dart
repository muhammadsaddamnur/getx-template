import 'dart:convert';

CubitSampleModel cubitSampleModelFromJson(String str) =>
    CubitSampleModel.fromJson(json.decode(str));

String cubitSampleModelToJson(CubitSampleModel data) =>
    json.encode(data.toJson());

class CubitSampleModel {
  CubitSampleModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory CubitSampleModel.fromJson(Map<String, dynamic> json) =>
      CubitSampleModel(
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
