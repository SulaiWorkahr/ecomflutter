import 'package:e_commerce/constants/app_colors.dart';
import 'package:e_commerce/widgets/button1_widget.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:e_commerce/widgets/heading_widget.dart';
import 'package:e_commerce/widgets/sub_heading_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../model/search_model/search_product_model/search_product_model.dart';
import '../../services/comfuncservice.dart';
import '../../services/ecommerce_api_service.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  final EcommerceApiService apiService = EcommerceApiService();

  @override
  void initState() {
    super.initState();

    getsearchproduct();
  }

  //searchproduct
  List<SearchProducts> searchproductpage = [];
  List<SearchProducts> searchproductpageAll = [];
  bool isLoading = false;

  Future getsearchproduct() async {
    setState(() {
      isLoading = true;
    });

    try {
      var result = await apiService.getsearchproduct();
      var response = searchproductpageDataFromJson(result);
      if (response.status.toString() == 'SUCCESS') {
        setState(() {
          searchproductpage = response.list;
          searchproductpageAll = searchproductpage;
          isLoading = false;
        });
      } else {
        setState(() {
          searchproductpage = [];
          searchproductpageAll = [];
          isLoading = false;
        });
        showInSnackBar(context, response.message.toString());
      }
    } catch (e) {
      setState(() {
        searchproductpage = [];
        searchproductpageAll = [];
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
        body: Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.05,
        left: screenWidth * 0.05,
        right: screenWidth * 0.05,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextField(
          style: const TextStyle(color: Colors.black),
          cursorColor: AppColors.e_primary,
          decoration: InputDecoration(
            suffix: TextButton(
              onPressed: () {},
              child: const Text(
                'Search',
                style: TextStyle(
                  color: AppColors.e_primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            prefixIcon: const Icon(
              Icons.search_outlined,
              color: AppColors.e_grey,
            ),
            hintText: 'Search Beverage or Foods',
            hintStyle: const TextStyle(color: AppColors.e_grey),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          onChanged: (value) {},
        ),
        SizedBox(
          height: 10,
        ),
        //Listview
        Expanded(
          child: SizedBox(
            height: screenHeight,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: searchproductpage.length,
              itemBuilder: (context, index) {
                final e = searchproductpage[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        e.image.toString(),
                        height: 80,
                        width: 80,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeadingWidget(
                            title: e.title.toString(),
                            fontSize: 16,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: AppColors.e_grey1,
                              ),
                              SubHeadingWidget(title: e.type.toString()),
                            ],
                          ),
                          Row(
                            children: [
                              HeadingWidget(
                                title: e.actualprice.toString(),
                                fontSize: 12,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                e.oldprice.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: AppColors.e_grey,
                                  color: AppColors.e_grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.e_lightgreen,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              size: 30,
                              color: AppColors.e_primary,
                            ),
                          ),
                          const SizedBox(height: 5),
                          ButtonWidget(
                            title: 'Buy Now',
                            width: 100,
                            color: AppColors.e_primary,
                            onTap: () {},
                            borderRadius: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ]),
    ));
  }
}
