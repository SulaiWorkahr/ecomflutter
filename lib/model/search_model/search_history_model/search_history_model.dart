import 'dart:convert';

import 'package:flutter/src/material/chip.dart';

SearchHistoryPage searchhistorypageDataFromJson(String str) =>
    SearchHistoryPage.fromJson(json.decode(str));

String searchhistorypageDataToJson(SearchHistoryPage data) =>
    json.encode(data.toJson());

class SearchHistoryPage {
  String status;
  List<SearchHistoryList> list;
  String code;
  String message;

  SearchHistoryPage({
    required this.status,
    required this.list,
    required this.code,
    required this.message,
  });

  factory SearchHistoryPage.fromJson(Map<String, dynamic> json) =>
      SearchHistoryPage(
        status: json["status"],
        list: List<SearchHistoryList>.from(
            json["list"].map((x) => SearchHistoryList.fromJson(x))),
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

class SearchHistoryList {
  int id;
  String? title;

  String image;

  int status;
  int active;
  int createdBy;
  DateTime createdDate;
  int? updatedBy;
  DateTime? updatedDate;

  SearchHistoryList({
    required this.id,
    this.title,
    required this.image,
    required this.status,
    required this.active,
    required this.createdBy,
    required this.createdDate,
    this.updatedBy,
    this.updatedDate,
  });

  factory SearchHistoryList.fromJson(Map<String, dynamic> json) =>
      SearchHistoryList(
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

  static map(Chip Function(dynamic item) param0) {}
}
