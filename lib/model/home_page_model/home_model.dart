// To parse this JSON data, do
//
//     final driverListData = driverListDataFromJson(jsonString);

import 'dart:convert';

HomePageData homePageDataFromJson(String str) =>
    HomePageData.fromJson(json.decode(str));

String homePageDataToJson(HomePageData data) => json.encode(data.toJson());

class HomePageData {
  String status;
  List<HomesPage> list;
  String code;
  String message;

  HomePageData({
    required this.status,
    required this.list,
    required this.code,
    required this.message,
  });

  factory HomePageData.fromJson(Map<String, dynamic> json) => HomePageData(
        status: json["status"],
        list: List<HomesPage>.from(
            json["list"].map((x) => HomesPage.fromJson(x))),
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

class HomesPage {
  int id;
  String title;

  String image;
  String actualprice;
  String oldprice;
  String discount;
  int rating;

  int status;
  int active;
  int createdBy;
  DateTime createdDate;
  int? updatedBy;
  DateTime? updatedDate;

  HomesPage({
    required this.id,
    required this.title,
    required this.image,
    required this.actualprice,
    required this.oldprice,
    required this.discount,
    required this.rating,
    required this.status,
    required this.active,
    required this.createdBy,
    required this.createdDate,
    this.updatedBy,
    this.updatedDate,
  });

  factory HomesPage.fromJson(Map<String, dynamic> json) => HomesPage(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        actualprice: json["actualprice"],
        oldprice: json["oldprice"],
        discount: json["discount"],
        rating: json["rating"],
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
        "actualprice": actualprice,
        "oldprice": oldprice,
        "discount": discount,
        "rating": rating,
        "status": status,
        "active": active,
        "created_by": createdBy,
        "created_date": createdDate.toIso8601String(),
        "updated_by": updatedBy,
        "updated_date": updatedDate?.toIso8601String(),
      };
}
