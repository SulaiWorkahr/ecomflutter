Future getHomePageJsonData() async {
  var result = {
    "status": "SUCCESS",
    "code": "200",
    "message": "Listed Successfully",
    "list": [
      {
        "id": 1,
        "title": "Chicken 500gm",
        "image": "images/chicken.png",
        "actualprice": "AED90.0",
        "oldprice": "AED20.0",
        "discount": "25% Off",
        "rating": 4,
        "status": 1,
        "active": 1,
        "created_by": 101,
        "created_date": DateTime.now().toIso8601String(),
        "updated_by": 102,
        "updated_date": DateTime.now().toIso8601String(),
      },
      {
        "id": 2,
        "title": "Chicken 500gm",
        "image": "images/chicken.png",
        "actualprice": "AED90.0",
        "oldprice": "AED20.0",
        "discount": "25% Off",
        "rating": 3,
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
