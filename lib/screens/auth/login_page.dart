import 'package:e_commerce/constants/app_colors.dart';
import 'package:e_commerce/widgets/heading_widget.dart';
import 'package:e_commerce/widgets/sub_heading_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_text_field.dart';

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
                          left: screenWidth * 0.05, right: screenWidth * 0.05),
                      child: CustomeTextField(
                          labelText: 'Enter your Name',
                          labelColor: AppColors.e_primary,
                          focusBorderColor: AppColors.e_primary,
                          width: screenWidth * 1,
                          borderColor: AppColors.e_grey3,
                          prefixIcon: Text('91')),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.05, top: screenHeight * 0.02),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            minimumSize: WidgetStatePropertyAll(
                                Size(screenWidth * 0.9, screenHeight * 0.07)),
                            backgroundColor:
                                WidgetStatePropertyAll(Color(0xFF027335)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          )),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                            indent: screenWidth * 0.05, // 5% of screen width
                            endIndent: screenWidth * 0.02, // 2% of screen width
                          ),
                        ),
                        Text(
                          'Or sign up with',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize:
                                  screenWidth * 0.04), // 4% of screen width
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                            indent: screenWidth * 0.02, // 2% of screen width
                            endIndent: screenWidth * 0.05, // 5% of screen width
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: screenHeight * 0.03), // 3% of screen height
                    Container(
                      width: screenWidth * 0.9, // 90% of screen width
                      height: screenHeight * 0.07, // 7% of screen height
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              'assets/images/google.png',
                              height:
                                  screenHeight * 0.03, // 3% of screen height
                            ),
                            SizedBox(
                                width:
                                    screenWidth * 0.02), // 2% of screen width
                            Text(
                              'Log in with Google Account',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    screenWidth * 0.04, // 4% of screen width
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        height: screenHeight * 0.02), // 2% of screen height
                    Container(
                      width: screenWidth * 0.9, // 90% of screen width
                      height: screenHeight * 0.07, // 7% of screen height
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              'assets/images/apple.png',
                              height:
                                  screenHeight * 0.03, // 3% of screen height
                            ),
                            SizedBox(
                                width:
                                    screenWidth * 0.02), // 2% of screen width
                            Text(
                              'Log in with Apple Account',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    screenWidth * 0.04, // 4% of screen width
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.05, top: screenHeight * 0.02),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    side: BorderSide(color: Color(0xFF027335)),
                                    borderRadius: BorderRadius.circular(10))),
                            minimumSize: WidgetStatePropertyAll(
                                Size(screenWidth * 0.9, screenHeight * 0.07)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF027335)),
                          )),
                    ),
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}
