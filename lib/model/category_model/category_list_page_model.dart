import 'dart:convert';

CategoryListPage categorylistpageDataFromJson(String str) =>
    CategoryListPage.fromJson(json.decode(str));

String categorylistpageDataToJson(CategoryListPage data) =>
    json.encode(data.toJson());

class CategoryListPage {
  String status;
  List<CategoryLists> list;
  String code;
  String message;

  CategoryListPage({
    required this.status,
    required this.list,
    required this.code,
    required this.message,
  });

  factory CategoryListPage.fromJson(Map<String, dynamic> json) =>
      CategoryListPage(
        status: json["status"],
        list: List<CategoryLists>.from(
            json["list"].map((x) => CategoryLists.fromJson(x))),
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

class CategoryLists {
  int id;
  String? title;

  String image;

  String? item;

  int status;
  int active;
  int createdBy;
  DateTime createdDate;
  int? updatedBy;
  DateTime? updatedDate;

  CategoryLists({
    required this.id,
    this.title,
    required this.image,
    this.item,
    required this.status,
    required this.active,
    required this.createdBy,
    required this.createdDate,
    this.updatedBy,
    this.updatedDate,
  });

  factory CategoryLists.fromJson(Map<String, dynamic> json) => CategoryLists(
        id: json["id"],
        title: json["title"],
        item: json["item"],
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
        "item": item,
        "image": image,
        "status": status,
        "active": active,
        "created_by": createdBy,
        "created_date": createdDate.toIso8601String(),
        "updated_by": updatedBy,
        "updated_date": updatedDate?.toIso8601String(),
      };
}
