import 'package:e_commerce/constants/app_assets.dart';
import 'package:e_commerce/constants/constants.dart';
import 'package:e_commerce/widgets/heading_widget.dart';
import 'package:e_commerce/widgets/sub_heading_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

import '../../model/cart_model/addtocartpage_model.dart';
import '../../services/comfuncservice.dart';
import '../../services/ecommerce_api_service.dart';
import '../../widgets/svgiconButtonWidget.dart';

class AddtoCartpage extends StatefulWidget {
  const AddtoCartpage({super.key});

  @override
  State<AddtoCartpage> createState() => _AddtoCartpageState();
}

class _AddtoCartpageState extends State<AddtoCartpage> {
  final EcommerceApiService apiService = EcommerceApiService();

  @override
  void initState() {
    super.initState();

    getaddtocart();
  }

  //AddtoCart
  List<AddtoCart> addcartpage = [];
  List<AddtoCart> addcartpageAll = [];
  bool isLoading = false;

  Future getaddtocart() async {
    setState(() {
      isLoading = true;
    });

    try {
      var result = await apiService.getaddtocart();
      var response = addtocartPageDataFromJson(result);
      if (response.status.toString() == 'SUCCESS') {
        setState(() {
          addcartpage = response.list;
          addcartpageAll = addcartpage;
          isLoading = false;
        });
      } else {
        setState(() {
          addcartpage = [];
          addcartpageAll = [];
          isLoading = false;
        });
        showInSnackBar(context, response.message.toString());
      }
    } catch (e) {
      setState(() {
        addcartpage = [];
        addcartpageAll = [];
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
      body: ListView.builder(
        itemCount: addcartpage.length,
        itemBuilder: (context, index) {
          final e = addcartpage[index];
          return Stack(
            children: [
              Container(
                height: screenHeight,
              ),
              Positioned(
                child: Image.asset(
                  e.image,
                  height: screenHeight,
                  width: screenWidth,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    width: screenWidth,
                    decoration: BoxDecoration(
                        color: AppColors.e_white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))
                        // borderRadius: BorderRadius.circular(24)
                        ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.05,
                          right: screenWidth * 0.05,
                          top: screenHeight * 0.04,
                          bottom: screenHeight * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.type.toString(),
                            style: TextStyle(
                                color: AppColors.e_blue,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),

                          HeadingWidget(
                            title: e.title.toString(),
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                          SubHeadingWidget(
                            title: e.content.toString(),
                            fontSize: 16,
                          ),

                          SizedBox(
                            height: 16,
                          ),
                          //Rating
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    e.star.toString(),
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    e.rating.toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    e.views.toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              Container(
                                height: 20,
                                width: 1,
                                color: AppColors.e_grey3,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    e.deliveryicon.toString(),
                                    width: 24,
                                    height: 24,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    e.delivery.toString(),
                                    style: TextStyle(
                                        color: AppColors.e_primary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //Price
                          Text(
                            'Price',
                            style: TextStyle(
                                color: AppColors.e_grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e.actualprice.toString(),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                e.oldprice.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: AppColors.e_grey,
                                  color: AppColors.e_grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Handle minus action
                                    },
                                    child: Image.asset(
                                      e.minus.toString(),
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Text(
                                      '0',
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // Handle plus action
                                    },
                                    child: Image.asset(
                                      e.plus.toString(),
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          //Dash
                          SizedBox(
                            height: 14,
                          ),
                          Dash(
                            dashLength: 5,
                          ),
                          SizedBox(
                            height: 14,
                          ),

                          //Dis
                          Container(
                            height: 40,
                            width: 160,
                            decoration: BoxDecoration(
                                color: AppColors.e_lightyellow,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                                child: Text(
                              e.discount.toString(),
                              style: TextStyle(color: AppColors.e_primary),
                            )),
                          ),
                          SizedBox(
                            height: 14,
                          ),

                          //Button

                          SvgIconButtonWidget(
                            height: 45,
                            title: 'Add to cart',
                            width: screenWidth,
                            leadingIcon: Image.asset(
                              AppAssets.w_cart,
                              width: 18,
                              height: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }
}
