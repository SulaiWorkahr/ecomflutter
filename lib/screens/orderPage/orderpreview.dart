import 'package:e_commerce/constants/constants.dart';
import 'package:e_commerce/widgets/heading_widget.dart';
import 'package:e_commerce/widgets/sub_heading_widget.dart';
import 'package:flutter/material.dart';

import '../../constants/app_assets.dart';

class OrderPreview extends StatefulWidget {
  @override
  _OrderPreviewState createState() => _OrderPreviewState();
}

class _OrderPreviewState extends State<OrderPreview> {
  int quantity = 3;
  double itemPrice = 15.50;
  double deliveryFee = 44.0;
  double platformFee = 5.0;
  double gstFee = 2.0;
  double discount = 0.0;
  bool isTripAdded = false;

  int selectedOption =
      0; // 0 for no selection, 1 for first option, 2 for second option

  void _selectOption(int option) {
    setState(() {
      selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeadingWidget(
          title: "Order Preview",
          fontSize: 20,
        ),
        backgroundColor: AppColors.e_white,
        foregroundColor: AppColors.e_black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Image.asset(
                      AppAssets.homeicon,
                      height: 25,
                      width: 25,
                    ),
                    HeadingWidget(
                      title: " Standard Delivery",
                      fontSize: 16,
                    ),
                  ]),
                  SubHeadingWidget(
                    title: " | ",
                  ),
                  SubHeadingWidget(
                    title: "Lorem ipsum dolor sit...",
                    fontSize: 12,
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_drop_down))
                ],
              ),
              SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                    color: AppColors.e_white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.e_grey3,
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Row(children: [
                              Image.asset(
                                AppAssets.c_tomato,
                                height: 80,
                                width: 80,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    HeadingWidget(
                                        title: "Sweet Young Coconut",
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    SubHeadingWidget(
                                        title: "Fruits",
                                        color: AppColors.e_grey),
                                    Text(
                                      "AED 20.0",
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: AppColors.e_grey,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        HeadingWidget(
                                            title: "AED $itemPrice",
                                            color: AppColors.e_black,
                                            fontWeight: FontWeight.bold),
                                        SizedBox(width: 15),
                                        Row(
                                          children: [
                                            _buildQuantityButton(Icons.remove,
                                                () {
                                              if (quantity > 1)
                                                setState(() => quantity--);
                                            }),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0),
                                              child: HeadingWidget(
                                                  title: quantity.toString(),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            _buildQuantityButton(Icons.add, () {
                                              setState(() => quantity++);
                                            }),
                                          ],
                                        )
                                      ],
                                    ),
                                  ])
                            ])),
                        Divider(
                          color: AppColors.e_grey3,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SubHeadingWidget(
                                  title: "Add More Items",
                                ),
                                Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: AppColors.e_grey2,
                                )
                              ],
                            ))
                      ])),
              SizedBox(
                height: 10,
              ),
              HeadingWidget(
                title: "Offer & Benefits",
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.e_white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.e_grey3,
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    Image.asset(
                                      AppAssets.vector,
                                      height: 50,
                                      width: 50,
                                    ),
                                    Text(
                                      'Try New Coupon',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ]),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Apply',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                'Save another AED 44 on this Order',
                                style: TextStyle(color: Colors.grey),
                              )
                            ])),
                    SizedBox(height: 8.0),
                    Divider(
                      color: AppColors.e_grey3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HeadingWidget(title: 'View more Coupons '),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingWidget(
                    title: "Delivery Type",
                  ),
                  SubHeadingWidget(
                    title: "Your Product is Always Fresh",
                    color: AppColors.e_grey,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => _selectOption(1),
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: AppColors.e_white,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: selectedOption == 1
                                  ? AppColors.e_primary
                                  : AppColors.e_grey3,
                              width: selectedOption == 1 ? 2 : 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeadingWidget(
                                title: 'Standard',
                                color: AppColors.e_grey,
                              ),
                              Row(
                                children: [
                                  HeadingWidget(
                                    title: "30-35 Mins",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.e_black,
                                  ),
                                  Spacer(),
                                  if (selectedOption == 1)
                                    Icon(
                                      Icons.check_circle,
                                      color: AppColors.e_primary,
                                      size: 20,
                                    ),
                                ],
                              ),
                              Row(children: [
                                HeadingWidget(
                                  title: "AED 44",
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ]),
                              SubHeadingWidget(
                                title: "Delivery Charges",
                              ),
                              SubHeadingWidget(
                                title: "Recommended If You are in a hurry",
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _selectOption(2),
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: AppColors.e_white,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: selectedOption == 2
                                  ? Colors.green
                                  : Colors.grey.shade300,
                              width: selectedOption == 2 ? 2 : 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeadingWidget(
                                title: 'Standard',
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                              Row(
                                children: [
                                  HeadingWidget(
                                    title: "40-45 Mins",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  Spacer(),
                                  if (selectedOption == 2)
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                ],
                              ),
                              HeadingWidget(
                                title: "AED 60",
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                              SubHeadingWidget(
                                title: "Delivery Charges",
                              ),
                              SubHeadingWidget(
                                title: "Recommended If You are in a hurry",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              HeadingWidget(
                title: "Bill Details",
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubHeadingWidget(title: "Item total"),
                        SubHeadingWidget(
                          title: "AED ${itemPrice.toStringAsFixed(2)}",
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SubHeadingWidget(
                              title: "Delivery Fee | 9.8 km",
                            ),
                            SubHeadingWidget(
                              title: "AED ${deliveryFee.toStringAsFixed(2)}",
                            ),
                          ],
                        ),
                        SubHeadingWidget(
                          title: "Enjoy Discounted Delivery!",
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubHeadingWidget(
                          title: "Delivery Trip",
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isTripAdded = !isTripAdded;
                            });
                          },
                          child: HeadingWidget(
                              title: isTripAdded ? "Remove Trip" : "Add Trip",
                              color: Colors.red,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubHeadingWidget(
                          title: "Platform fee",
                        ),
                        SubHeadingWidget(
                          title: "AED ${platformFee.toStringAsFixed(2)}",
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubHeadingWidget(
                          title: "GST and Restaurant Charges",
                        ),
                        SubHeadingWidget(
                          title: "AED ${gstFee.toStringAsFixed(2)}",
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HeadingWidget(title: "To Pay", fontSize: 16),
                        HeadingWidget(title: "AED 27.00", fontSize: 16),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4),
              HeadingWidget(
                title: "Select your payment Method",
              ),
              SizedBox(height: 4),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPaymentMethod(
                          Image.asset(
                            AppAssets.gpay,
                            height: 50,
                            width: 50,
                          ),
                          "Gpay"),
                      _buildPaymentMethod(
                          Image.asset(
                            AppAssets.phonepay,
                            height: 50,
                            width: 50,
                          ),
                          "Phone pay"),
                      _buildPaymentMethod(
                          Image.asset(
                            AppAssets.upiicon,
                            height: 50,
                            width: 50,
                          ),
                          "Pay with UPI"),
                      _buildPaymentMethod(
                          Image.asset(
                            AppAssets.card,
                            height: 50,
                            width: 50,
                          ),
                          "Debit/Credit Card"),
                    ],
                  )),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubHeadingWidget(
                        title: "1 item | $quantity Qty",
                        color: Color(0xFF027335),
                      ),
                      HeadingWidget(
                        title: "Total: AED 27.00",
                        color: Color(0xFF027335),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        child: Row(
                          children: [
                            SubHeadingWidget(
                              title: "Pay now   ",
                              color: Colors.white,
                            ),
                            Icon(Icons.arrow_forward)
                          ],
                        )),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF027335),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, size: 20, color: Colors.black),
      ),
    );
  }

  Widget _buildPaymentMethod(Image image, String method) {
    return ListTile(
      leading: image,
      title: Text(method),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
