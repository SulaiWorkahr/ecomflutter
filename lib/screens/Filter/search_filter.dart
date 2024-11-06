import 'package:e_commerce/constants/app_colors.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:e_commerce/widgets/heading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/filter_model/searchfilter_model.dart';
import '../../services/comfuncservice.dart';
import '../../services/ecommerce_api_service.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  bool discount = false;
  bool Voucher = false;
  bool FreeShipping = false;
  bool SameDayDeliv = false;

  final EcommerceApiService apiService = EcommerceApiService();

  @override
  void initState() {
    super.initState();

    getfilterlist();
  }

  //AddtoCart
  List<SearchFilterList> searchfilterpage = [];
  List<SearchFilterList> searchfilterpageAll = [];
  bool isLoading = false;

  Future getfilterlist() async {
    setState(() {
      isLoading = true;
    });

    try {
      var result = await apiService.getcategorypage();
      var response = searchfilterpageDataFromJson(result);
      if (response.status.toString() == 'SUCCESS') {
        setState(() {
          searchfilterpage = response.list;
          searchfilterpageAll = searchfilterpage;
          isLoading = false;
        });
      } else {
        setState(() {
          searchfilterpage = [];
          searchfilterpageAll = [];
          isLoading = false;
        });
        showInSnackBar(context, response.message.toString());
      }
    } catch (e) {
      setState(() {
        searchfilterpage = [];
        searchfilterpageAll = [];
        isLoading = false;
      });
      showInSnackBar(context, 'Error occurred: $e');
    }

    setState(() {});
  }

  final List<String> categories = [
    'Fresh Fruits',
    'Fresh Vegetables',
    'Mushroom',
    'Bakery',
    'Fresh Fish',
  ];
  final List<String> items = [
    '45 items',
    '45 items',
    '45 items',
    '45 items',
    '45 items',
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Filter'),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Reset',
                style: TextStyle(color: AppColors.e_yellow),
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadingWidget(
                          title: 'Price Range',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomeTextField(
                              width: 150,
                              hint: '₹5.00',
                            ),
                            CustomeTextField(
                              width: 150,
                              hint: 'Max',
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 4),
                    Divider(color: AppColors.e_grey3),
                    SizedBox(height: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadingWidget(
                          title: 'Star Ratings',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: List.generate(5, (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: Image.asset(
                                    'assets/images/star.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                );
                              }),
                            ),
                            Text(
                              '4 Star',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFB3B3B3)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Divider(color: Color(0xFFEDE6E6)),
                    SizedBox(height: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadingWidget(
                          title: 'Others',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: discount,
                                        onChanged: (Value) {
                                          setState(() {
                                            discount = Value!;
                                          });
                                        }),
                                    SizedBox(width: 4),
                                    HeadingWidget(
                                      title: 'Discount',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Checkbox(
                                        value: Voucher,
                                        onChanged: (Value) {
                                          setState(() {
                                            Voucher = Value!;
                                          });
                                        }),
                                    SizedBox(width: 4),
                                    HeadingWidget(
                                      title: 'Voucher',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: FreeShipping,
                                        onChanged: (Value) {
                                          setState(() {
                                            FreeShipping = Value!;
                                          });
                                        }),
                                    SizedBox(width: 4),
                                    HeadingWidget(
                                      title: 'FreeShipping',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Checkbox(
                                        value: SameDayDeliv,
                                        onChanged: (Value) {
                                          setState(() {
                                            SameDayDeliv = Value!;
                                          });
                                        }),
                                    SizedBox(width: 4),
                                    HeadingWidget(
                                      title: 'Same Day Deliv',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Divider(color: AppColors.e_grey3),
                    SizedBox(height: 4),
                    HeadingWidget(
                      title: 'Categories',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            categories[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                items[index],
                                style: TextStyle(
                                    fontSize: 16, color: AppColors.e_grey),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: AppColors.e_grey,
                              ),
                            ],
                          ),
                          onTap: () {},
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(16.0),
              child: ButtonWidget(
                title: "APPLY FILTER",
                width: screenWidth * 1,
                color: AppColors.e_primary,
                onTap: () {},
              )),
        ],
      ),
    );
  }
}
