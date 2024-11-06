Future getFruitListPageJsonData() async {
  var result = {
    "status": "SUCCESS",
    "code": "200",
    "message": "Listed Successfully",
    "list": [
      {
        "id": 1,
        "title": "Fresh Tomato",
        "image": "assets/images/c_tomato.png",
        "plus": "images/plus.png",
        "minus": "images/minus.png",
        "actualprice": "AED90.0",
        "oldprice": "AED20.0",
        "discounticon": "assets/images/discount.png",
        "number": 0,
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
