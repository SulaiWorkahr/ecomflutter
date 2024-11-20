import 'package:e_commerce/constants/app_colors.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../constants/app_assets.dart';
import '../../model/cart_model/shoppingcartpage_model.dart';
import '../../services/comfuncservice.dart';
import '../../services/ecommerce_api_service.dart';
import '../../widgets/svgiconButtonWidget.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  final EcommerceApiService apiService = EcommerceApiService();

  @override
  void initState() {
    super.initState();

    getshoppingcart();
  }

  //shoppingcart
  List<ShoppingCart> shoppingcartpage = [];
  List<ShoppingCart> shoppingcartpageAll = [];
  bool isLoading = false;

  Future getshoppingcart() async {
    setState(() {
      isLoading = true;
    });

    try {
      var result = await apiService.getshoppingcart();
      var response = shoppingcartpageDataFromJson(result);
      if (response.status.toString() == 'SUCCESS') {
        setState(() {
          shoppingcartpage = response.list;
          shoppingcartpageAll = shoppingcartpage;
          isLoading = false;
        });
      } else {
        setState(() {
          shoppingcartpage = [];
          shoppingcartpageAll = [];
          isLoading = false;
        });
        showInSnackBar(context, response.message.toString());
      }
    } catch (e) {
      setState(() {
        shoppingcartpage = [];
        shoppingcartpageAll = [];
        isLoading = false;
      });
      showInSnackBar(context, 'Error occurred: $e');
    }

    setState(() {});
  }

  final List<Map<String, String>> shopping = [
    {
      'image': 'assets/images/c_sweetpotato.png',
      'minus': 'assets/images/minus.png',
      'number': '2',
      'plus': 'assets/images/plus.png',
      'name': 'Sweet Young Coc..',
      'type': 'Fruits',
      'actualprice': 'AED90.0',
      'oldprice': 'AED20.0',
      'singletotal': 'AED9.50',
      'item': '3 item',
      'Qty': '6 Qty',
      'Total': 'AED70.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping Cart',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        children: [
          // Fixed Search Field at the top
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
            child: CustomeTextField(
                width: screenWidth,
                hint: 'Search Beverage or Foods',
                hintColor: AppColors.e_grey,
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: AppColors.e_grey,
                )),
          ),
          const SizedBox(height: 8),

          // Scrollable content below
          Expanded(
            child: ListView.builder(
              itemCount: shoppingcartpage.length, // Dynamic length
              itemBuilder: (context, index) {
                final e = shoppingcartpage[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.02),
                  color: AppColors.e_grey3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        e.image.toString(),
                        height: 78,
                        width: 84,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  e.title.toString(),
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  e.singletotal.toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.e_primary),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              e.type.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.e_grey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  e.actualprice.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  e.oldprice.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: AppColors.e_grey,
                                    color: AppColors.e_grey,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Bottom container for total or checkout button
          Container(
              width: double.infinity,
              color: AppColors.e_lightgreen,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '3 item | 6 Qty',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.e_primary),
                        ),
                        Text(
                          'Total: AED70.00',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.e_primary),
                        )
                      ],
                    ),
                    SvgIconButtonWidget(
                      title: 'Add to cart',
                      width: 170,
                      color: AppColors.e_primary,
                      onTap: () {},
                      leadingIcon: Image.asset(
                        'images/arrow-right.png',
                        width: 18,
                        height: 18,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
