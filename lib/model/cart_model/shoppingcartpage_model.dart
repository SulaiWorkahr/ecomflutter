import 'dart:convert';

ShoppingcartPage shoppingcartpageDataFromJson(String str) =>
    ShoppingcartPage.fromJson(json.decode(str));

String addtocartPageDataToJson(ShoppingcartPage data) =>
    json.encode(data.toJson());

class ShoppingcartPage {
  String status;
  List<ShoppingCart> list;
  String code;
  String message;

  ShoppingcartPage({
    required this.status,
    required this.list,
    required this.code,
    required this.message,
  });

  factory ShoppingcartPage.fromJson(Map<String, dynamic> json) =>
      ShoppingcartPage(
        status: json["status"],
        list: List<ShoppingCart>.from(
            json["list"].map((x) => ShoppingCart.fromJson(x))),
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

class ShoppingCart {
  int id;
  String? title;

  String? type;
  String image;
  String? singletotal;
  String? item;
  String? Qty;
  String? totalprice;

  String? actualprice;
  String? oldprice;
  String? discount;
  String? star;
  String? plus;
  String? minus;
  int rating;
  String? views;
  int status;
  int active;
  int createdBy;
  DateTime createdDate;
  int? updatedBy;
  DateTime? updatedDate;

  ShoppingCart({
    required this.id,
    this.type,
    this.title,
    required this.image,
    this.plus,
    this.minus,
    this.views,
    this.star,
    this.singletotal,
    this.item,
    this.Qty,
    this.totalprice,
    this.actualprice,
    this.oldprice,
    this.discount,
    required this.rating,
    required this.status,
    required this.active,
    required this.createdBy,
    required this.createdDate,
    this.updatedBy,
    this.updatedDate,
  });

  factory ShoppingCart.fromJson(Map<String, dynamic> json) => ShoppingCart(
        id: json["id"],
        type: json["type"],
        title: json["title"],
        views: json["views"],
        item: json["item"],
        Qty: json["Qty"],
        totalprice: json["totalprice"],
        singletotal: json["singletotal"],
        image: json["image"],
        star: json["star"],
        plus: json["plus"],
        minus: json["minus"],
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
        "type": type,
        "title": title,
        "singletotal": singletotal,
        "item": item,
        "Qty": Qty,
        "totalprice": totalprice,
        "image": image,
        "plus": plus,
        "minus": minus,
        "views": views,
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
