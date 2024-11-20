import 'package:e_commerce/constants/app_colors.dart';
import 'package:e_commerce/screens/auth/registor.dart';
import 'package:flutter/material.dart';

import '../widgets/button1_widget.dart';
import '../widgets/heading_widget.dart';
import '../widgets/sub_heading_widget.dart';

class LocationAllowPage extends StatefulWidget {
  const LocationAllowPage({super.key});

  @override
  State<LocationAllowPage> createState() => _LocationAllowPageState();
}

class _LocationAllowPageState extends State<LocationAllowPage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.06,
                left: screenWidth * 0.05,
                right: screenWidth * 0.1),
            child: HeadingWidget(
              title: 'We don’t have your location, yet!',
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.19,
                left: screenWidth * 0.05,
                right: screenWidth * 0.1),
            child: SubHeadingWidget(
              title:
                  'Set your location to start exploring laundering service near you',
              fontSize: 14,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.25),
            child: Image.asset(
              'assets/images/map.png',
              width: screenWidth * double.infinity,
              height: screenHeight * double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: screenHeight * 0.2,
              width: screenWidth,
              decoration: BoxDecoration(
                  color: AppColors.e_white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.03,
                    right: screenWidth * 0.05,
                    left: screenWidth * 0.05),
                child: Column(
                  children: [
                    Button1Widget(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegistorPage()),
                        );
                      },
                      borderRadius: 10,
                      title: 'Next',
                      fontWeight: FontWeight.w600,
                      height: 54,
                      width: screenWidth,
                      color: AppColors.e_primary,
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Enter your location manually',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.e_primary),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
