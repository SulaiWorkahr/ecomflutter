import 'package:flutter/material.dart';

import '../../model/cart_model/shoppingcartpage_model.dart';
import '../../model/category_model/category_list_page_model.dart';
import '../../services/comfuncservice.dart';
import '../../services/ecommerce_api_service.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final EcommerceApiService apiService = EcommerceApiService();

  @override
  void initState() {
    super.initState();

    getcategorylist();
  }

  //AddtoCart
  List<CategoryLists> categorylistpage = [];
  List<CategoryLists> categorylistpageAll = [];
  bool isLoading = false;

  Future getcategorylist() async {
    setState(() {
      isLoading = true;
    });

    try {
      var result = await apiService.getcategorypage();
      var response = categorylistpageDataFromJson(result);
      if (response.status.toString() == 'SUCCESS') {
        setState(() {
          categorylistpage = response.list;
          categorylistpageAll = categorylistpage;
          isLoading = false;
        });
      } else {
        setState(() {
          categorylistpage = [];
          categorylistpageAll = [];
          isLoading = false;
        });
        showInSnackBar(context, response.message.toString());
      }
    } catch (e) {
      setState(() {
        categorylistpage = [];
        categorylistpageAll = [];
        isLoading = false;
      });
      showInSnackBar(context, 'Error occurred: $e');
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              top: screenHeight * 0.02,
              right: screenWidth * 0.04,
              bottom: screenHeight * 0.02,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 3 / 4,
                    ),
                    itemCount: categorylistpage.length,
                    itemBuilder: (context, index) {
                      final e = categorylistpage[index];
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.asset(
                              e.image.toString(),
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          Positioned(
                            bottom: 20.0,
                            left: 20.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.title.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  e.item.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
