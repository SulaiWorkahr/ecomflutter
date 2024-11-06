import 'package:e_commerce/constants/app_colors.dart';
import 'package:e_commerce/widgets/heading_widget.dart';
import 'package:e_commerce/widgets/sub_heading_widget.dart';
import 'package:flutter/material.dart';

class Myaddress extends StatefulWidget {
  const Myaddress({super.key});

  @override
  State<Myaddress> createState() => _MyaddressState();
}

class _MyaddressState extends State<Myaddress> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Address'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              right: screenWidth * 0.04,
              top: screenHeight * 0.02,
              bottom: screenHeight * 0.02,
            ),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: AppColors.e_primary,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        HeadingWidget(
                          title: 'Home',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.e_grey,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    SubHeadingWidget(
                      title:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
                      color: AppColors.e_grey,
                      fontSize: 14,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    SubHeadingWidget(
                      title: 'Contact : 1234567890',
                      color: AppColors.e_grey,
                      fontSize: 14,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Edit',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: AppColors.e_primary),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Delete',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: AppColors.e_primary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.e_grey3,
          ),
        ],
      ),
    );
  }
}
