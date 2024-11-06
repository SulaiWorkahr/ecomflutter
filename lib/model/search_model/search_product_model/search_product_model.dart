import 'dart:convert';

import 'package:flutter/src/material/chip.dart';

SearchProductPage searchproductpageDataFromJson(String str) =>
    SearchProductPage.fromJson(json.decode(str));

String searchproductpageDataToJson(SearchProductPage data) =>
    json.encode(data.toJson());

class SearchProductPage {
  String status;
  List<SearchProducts> list;
  String code;
  String message;

  SearchProductPage({
    required this.status,
    required this.list,
    required this.code,
    required this.message,
  });

  factory SearchProductPage.fromJson(Map<String, dynamic> json) =>
      SearchProductPage(
        status: json["status"],
        list: List<SearchProducts>.from(
            json["list"].map((x) => SearchProducts.fromJson(x))),
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

class SearchProducts {
  int id;
  String? title;

  String image;
  String? actualprice;
  String? oldprice;
  String? type;
  int status;
  int active;
  int createdBy;
  DateTime createdDate;
  int? updatedBy;
  DateTime? updatedDate;

  SearchProducts({
    required this.id,
    this.title,
    this.actualprice,
    this.oldprice,
    this.type,
    required this.image,
    required this.status,
    required this.active,
    required this.createdBy,
    required this.createdDate,
    this.updatedBy,
    this.updatedDate,
  });

  factory SearchProducts.fromJson(Map<String, dynamic> json) => SearchProducts(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        actualprice: json["actualprice"],
        oldprice: json["oldprice"],
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
        "actualprice": actualprice,
        "oldprice": oldprice,
        "type": type,
        "title": title,
        "image": image,
        "status": status,
        "active": active,
        "created_by": createdBy,
        "created_date": createdDate.toIso8601String(),
        "updated_by": updatedBy,
        "updated_date": updatedDate?.toIso8601String(),
      };

  static map(Chip Function(dynamic item) param0) {}
}
