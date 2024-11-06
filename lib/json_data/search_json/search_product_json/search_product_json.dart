Future getSearchProductPageJsonData() async {
  var result = {
    "status": "SUCCESS",
    "code": "200",
    "message": "Listed Successfully",
    "list": [
      {
        "id": 1,
        "title": "Bellary Onion",
        "image": 'assets/images/s_p_onion.png',
        "type": "vegetable",
        "actualprice": "AED9.00",
        "oldprice": "AED20.00",
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
