import 'package:e_commerce/constants/app_assets.dart';
import 'package:e_commerce/constants/app_colors.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../model/cart_model/fruitslistpage_model.dart';
import '../../../services/comfuncservice.dart';
import '../../../services/ecommerce_api_service.dart';
import '../../../widgets/svgiconButtonWidget.dart';

class Fruitslistpage extends StatefulWidget {
  const Fruitslistpage({super.key});

  @override
  State<Fruitslistpage> createState() => _FruitslistpageState();
}

class _FruitslistpageState extends State<Fruitslistpage> {
  final EcommerceApiService apiService = EcommerceApiService();

  @override
  void initState() {
    super.initState();

    getfruitslist();
  }

  //AddtoCart
  List<FruitsLists> fruitlistpage = [];
  List<FruitsLists> fruitlistpageAll = [];
  bool isLoading = false;

  Future getfruitslist() async {
    setState(() {
      isLoading = true;
    });

    try {
      var result = await apiService.getfruitslist();
      var response = fruitlistpageDataFromJson(result);
      if (response.status.toString() == 'SUCCESS') {
        setState(() {
          fruitlistpage = response.list;
          fruitlistpageAll = fruitlistpage;
          isLoading = false;
        });
      } else {
        setState(() {
          fruitlistpage = [];
          fruitlistpageAll = [];
          isLoading = false;
        });
        showInSnackBar(context, response.message.toString());
      }
    } catch (e) {
      setState(() {
        fruitlistpage = [];
        fruitlistpageAll = [];
        isLoading = false;
      });
      showInSnackBar(context, 'Error occurred: $e');
    }

    setState(() {});
  }

  final List<Map<String, String>> fruitsList = [
    {
      'image': 'assets/images/tomato.png',
      'minus': 'assets/images/minus.png',
      'number': '2',
      'plus': 'assets/images/plus.png',
      'name': 'Fresh Tomato',
      'actualprice': 'AED90.0',
      'oldprice': 'AED20.0',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fruits',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_alt)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        children: [
          // Search Field
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: CustomeTextField(
              borderColor: AppColors.e_grey3,
              width: screenWidth,
              prefixIcon: Icon(
                Icons.search_outlined,
                color: const Color.fromARGB(255, 94, 66, 66),
              ),
            ),
            //
          ),
          const SizedBox(height: 8),

          // List of Fruits
          Expanded(
            child: ListView.builder(
              itemCount: fruitlistpage.length,
              itemBuilder: (context, index) {
                final e = fruitlistpage[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.02,
                  ),
                  color: Colors.black12,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        e.image,
                        height: 78,
                        width: 84,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.title.toString(),
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  e.actualprice.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  e.oldprice.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    decoration: TextDecoration.lineThrough,
                                    color: Color(0xFF888888),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Image.asset(
                                  e.discounticon.toString(),
                                  height: 18,
                                  width: 18,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Disc 5% off',
                                  style: TextStyle(color: Color(0xFF027335)),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {},
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
                                    e.number.toString(),
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
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
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Checkout Section
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
                      color: AppColors.e_primary,
                      onTap: () {},
                      title: 'Add to cart',
                      width: 170,
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
