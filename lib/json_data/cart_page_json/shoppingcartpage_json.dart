Future getShoppingCartPageJsonData() async {
  var result = {
    "status": "SUCCESS",
    "code": "200",
    "message": "Listed Successfully",
    "list": [
      {
        "id": 1,
        "type": "Fruit",
        "title": "Organic Lemon",
        "content":
            "Morem ipsum dolor sit amet, consectetur iscing elit. Nunc vulputate libero et velit interdum, quet odio mattis.",
        "image": "assets/images/c_lemon.png",
        "views": "(89 Views)",
        "plus": "images/plus.png",
        "minus": "images/minus.png",
        "star": "images/star.png",
        "actualprice": "AED90.0",
        "oldprice": "AED20.0",
        "discount": "20% OFF  DISCOUNT",
        "deliveryicon": "assets/images/delivery.png",
        "delivery": "FREE DELIVERY",
        "rating": 4,
        "status": 1,
        "active": 1,
        "created_by": 101,
        "created_date": DateTime.now().toIso8601String(),
        "updated_by": 102,
        "updated_date": DateTime.now().toIso8601String(),
      },
    ]
  };

  return result;
}
