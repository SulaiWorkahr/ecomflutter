// To parse this JSON data, do
//
//     final driverListData = driverListDataFromJson(jsonString);

import 'dart:convert';

HomeCategoryData homecategoryDataFromJson(String str) =>
    HomeCategoryData.fromJson(json.decode(str));

String homecategoryDataToJson(HomeCategoryData data) =>
    json.encode(data.toJson());

class HomeCategoryData {
  String status;
  List<categories> list;
  String code;
  String message;

  HomeCategoryData({
    required this.status,
    required this.list,
    required this.code,
    required this.message,
  });

  factory HomeCategoryData.fromJson(Map<String, dynamic> json) =>
      HomeCategoryData(
        status: json["status"],
        list: List<categories>.from(
            json["list"].map((x) => categories.fromJson(x))),
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "code": code,
        "message": message,
      };
}

class categories {
  int id;
  String title;

  String image;

  int status;
  int active;
  int createdBy;
  DateTime createdDate;
  int? updatedBy;
  DateTime? updatedDate;

  categories({
    required this.id,
    required this.title,
    required this.image,
    required this.status,
    required this.active,
    required this.createdBy,
    required this.createdDate,
    this.updatedBy,
    this.updatedDate,
  });

  factory categories.fromJson(Map<String, dynamic> json) => categories(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        status: json["status"],
        active: json["active"],
        createdBy: json["created_by"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedBy: json["updated_by"],
        updatedDate: json["updated_date"] == null
            ? null
            : DateTime.parse(json["updated_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "status": status,
        "active": active,
        "created_by": createdBy,
        "created_date": createdDate.toIso8601String(),
        "updated_by": updatedBy,
        "updated_date": updatedDate?.toIso8601String(),
      };
}
