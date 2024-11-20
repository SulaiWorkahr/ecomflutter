import 'package:e_commerce/constants/app_colors.dart';
import 'package:e_commerce/screens/auth/registor.dart';
import 'package:e_commerce/widgets/heading_widget.dart';
import 'package:e_commerce/widgets/sub_heading_widget.dart';
import 'package:e_commerce/widgets/svgiconButtonWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../widgets/button1_widget.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/outline_btn_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Container(
          height: screenHeight,
          width: screenWidth,
          decoration: BoxDecoration(color: AppColors.e_primary),
        ),
        Positioned(
          bottom: 0,
          child: SingleChildScrollView(
            child: Container(
              height: screenHeight * 0.75,
              width: screenWidth,
              decoration: BoxDecoration(
                  color: AppColors.e_white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.03,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.05),
                        child: HeadingWidget(
                          title: 'Login',
                          color: AppColors.e_black,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.05),
                        child: SubHeadingWidget(
                          title: 'Enter your mobile number to proceed',
                          color: AppColors.e_grey1,
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.05,
                            right: screenWidth * 0.05),
                        child: CustomeTextField(
                          labelText: 'Enter your Name',
                          labelColor: AppColors.e_primary,
                          focusBorderColor: AppColors.e_primary,
                          width: screenWidth * 1,
                          borderColor: AppColors.e_grey3,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.05,
                            top: screenHeight * 0.02,
                            right: screenWidth * 0.05),
                        child: Button1Widget(
                          onTap: () {},
                          title: 'Get OTP',
                          borderRadius: 10,
                          height: 54,
                          width: screenWidth,
                          color: AppColors.e_primary,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: AppColors.e_grey1,
                              indent: screenWidth * 0.05, // 5% of screen width
                              endIndent:
                                  screenWidth * 0.02, // 2% of screen width
                            ),
                          ),
                          Text(
                            'Or',
                            style: TextStyle(
                                color: AppColors.e_black,
                                fontSize:
                                    screenWidth * 0.04), // 4% of screen width
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: AppColors.e_grey1,
                              indent: screenWidth * 0.02, // 2% of screen width
                              endIndent:
                                  screenWidth * 0.05, // 5% of screen width
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: screenHeight * 0.03), // 3% of screen height
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.05,
                            right: screenWidth * 0.05),
                        child: InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.e_grey3),
                                borderRadius: BorderRadius.circular(10)),
                            width: screenWidth,
                            height: 40,
                            child: Center(
                              child: Text(
                                'Log in with Google Account',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                      SizedBox(
                          height: screenHeight * 0.02), // 2% of screen height
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.05,
                            right: screenWidth * 0.05),
                        child: InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.e_grey3),
                                borderRadius: BorderRadius.circular(10)),
                            width: screenWidth,
                            height: 40,
                            child: Center(
                              child: Text(
                                'Log in with Apple Account',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.05,
                            right: screenWidth * 0.05),
                        child: SubHeadingWidget(
                          title:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.05,
                          top: screenHeight * 0.02,
                          right: screenWidth * 0.05,
                        ),
                        child: InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.e_primary),
                                borderRadius: BorderRadius.circular(10)),
                            width: screenWidth,
                            height: 54,
                            child: Center(
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.e_primary,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegistorPage()),
                            );
                          },
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
