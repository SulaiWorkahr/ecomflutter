Future getPopularSearchPageJsonData() async {
  var result = {
    "status": "SUCCESS",
    "code": "200",
    "message": "Listed Successfully",
    "list": [
      {
        "id": 1,
        "title": "Apple",
        "image": 'assets/images/s_apple.png',
        "status": 1,
        "active": 1,
        "created_by": 101,
        "created_date": DateTime.now().toIso8601String(),
        "updated_by": 102,
        "updated_date": DateTime.now().toIso8601String(),
      },
      {
        "id": 2,
        "title": "Vegitables",
        "image": 'assets/images/s_carrort.png',
        "status": 1,
        "active": 1,
        "created_by": 101,
        "created_date": DateTime.now().toIso8601String(),
        "updated_by": 102,
        "updated_date": DateTime.now().toIso8601String(),
      },
      {
        "id": 3,
        "title": "Meat",
        "image": 'assets/images/s_meat.png',
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
