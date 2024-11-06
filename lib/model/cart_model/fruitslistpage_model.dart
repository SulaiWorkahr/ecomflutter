import 'dart:convert';

FruitsListPage fruitlistpageDataFromJson(String str) =>
    FruitsListPage.fromJson(json.decode(str));

String fruitlistpageDataToJson(FruitsListPage data) =>
    json.encode(data.toJson());

class FruitsListPage {
  String status;
  List<FruitsLists> list;
  String code;
  String message;

  FruitsListPage({
    required this.status,
    required this.list,
    required this.code,
    required this.message,
  });

  factory FruitsListPage.fromJson(Map<String, dynamic> json) => FruitsListPage(
        status: json["status"],
        list: List<FruitsLists>.from(
            json["list"].map((x) => FruitsLists.fromJson(x))),
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

class FruitsLists {
  int id;
  String? title;

  String image;
  int number;
  String? actualprice;
  String? oldprice;
  String? discount;
  String? discounticon;

  String? plus;
  String? minus;

  String? views;
  int status;
  int active;
  int createdBy;
  DateTime createdDate;
  int? updatedBy;
  DateTime? updatedDate;

  FruitsLists({
    required this.id,
    this.title,
    required this.image,
    this.discounticon,
    this.plus,
    this.minus,
    this.views,
    this.actualprice,
    this.oldprice,
    this.discount,
    required this.number,
    required this.status,
    required this.active,
    required this.createdBy,
    required this.createdDate,
    this.updatedBy,
    this.updatedDate,
  });

  factory FruitsLists.fromJson(Map<String, dynamic> json) => FruitsLists(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        plus: json["plus"],
        minus: json["minus"],
        actualprice: json["actualprice"],
        oldprice: json["oldprice"],
        discount: json["discount"],
        discounticon: json["discounticon"],
        number: json["number"],
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
        "plus": plus,
        "minus": minus,
        "discounticon": discounticon,
        "actualprice": actualprice,
        "oldprice": oldprice,
        "discount": discount,
        "status": status,
        "active": active,
        "created_by": createdBy,
        "created_date": createdDate.toIso8601String(),
        "updated_by": updatedBy,
        "updated_date": updatedDate?.toIso8601String(),
      };
}
