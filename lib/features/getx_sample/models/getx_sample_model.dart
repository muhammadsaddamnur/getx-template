import 'dart:convert';

GetxSampleModel getxSampleModelFromJson(String str) =>
    GetxSampleModel.fromJson(json.decode(str));

String getxSampleModelToJson(GetxSampleModel data) =>
    json.encode(data.toJson());

class GetxSampleModel {
  GetxSampleModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory GetxSampleModel.fromJson(Map<String, dynamic> json) =>
      GetxSampleModel(
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
