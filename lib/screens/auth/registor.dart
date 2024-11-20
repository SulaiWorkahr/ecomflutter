import 'package:e_commerce/constants/app_colors.dart';
import 'package:e_commerce/maincontainer/maincontainer.dart';
import 'package:e_commerce/screens/auth/login_page.dart';
import 'package:e_commerce/screens/home/homepage.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:e_commerce/widgets/heading_widget.dart';
import 'package:e_commerce/widgets/sub_heading_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/button1_widget.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/custom_rounded_textfield.dart';
import '../../widgets/outline_btn_widget.dart';

class RegistorPage extends StatefulWidget {
  const RegistorPage({super.key});

  @override
  State<RegistorPage> createState() => _RegistorPageState();
}

class _RegistorPageState extends State<RegistorPage> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
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
                  top: screenHeight * 0.01,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.05),
                      child: HeadingWidget(
                        title: 'Create your account',
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.05),
                        child: SubHeadingWidget(
                          title: 'Enter the required details',
                          color: AppColors.e_grey1,
                          fontSize: 15,
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.05, right: screenWidth * 0.05),
                      child: CustomeTextField(
                        labelText: 'Enter your Name',
                        labelColor: AppColors.e_primary,
                        focusBorderColor: AppColors.e_primary,
                        width: screenWidth * 1,
                        borderColor: AppColors.e_grey3,
                        prefixIcon: Icon(
                          Icons.person_outline_outlined,
                          color: AppColors.e_primary,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.05, right: screenWidth * 0.05),
                      child: CustomeTextField(
                        labelText: 'Enter your mail id',
                        labelColor: AppColors.e_primary,
                        focusBorderColor: AppColors.e_primary,
                        width: screenWidth * 1,
                        borderColor: AppColors.e_grey3,
                        prefixIcon: Icon(Icons.email_outlined,
                            color: AppColors.e_primary),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.05, right: screenWidth * 0.05),
                      child: CustomeTextField(
                        labelText: 'Password',
                        labelColor: AppColors.e_primary,
                        focusBorderColor: AppColors.e_primary,
                        width: screenWidth * 1,
                        borderColor: AppColors.e_grey3,
                        suffixIcon: Icon(Icons.remove_red_eye_outlined,
                            color: AppColors.e_primary),
                        prefixIcon:
                            Icon(Icons.lock_outline, color: Color(0xFF027335)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.05,
                          top: screenHeight * 0.02,
                          right: screenWidth * 0.05),
                      child: Button1Widget(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Maincontainer()),
                          );
                        },
                        borderRadius: 10,
                        title: 'Register',
                        height: 54,
                        width: screenWidth,
                        color: AppColors.e_primary,
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //       left: screenWidth * 0.05,
                    //       right: screenWidth * 0.05,
                    //       top: screenHeight * 0.01),
                    //   child: Row(
                    //     children: [
                    //       Checkbox(value: value, onChanged: (Value) {}),
                    //       Padding(
                    //         padding: EdgeInsets.only(
                    //             right: screenWidth * 0.2, top: 0.02),
                    //         child: RichText(
                    //             text: TextSpan(children: [
                    //           TextSpan(
                    //             text: 'By tapping “Sign Up” you accept our',
                    //             style: TextStyle(
                    //                 fontSize: 15,
                    //                 fontWeight: FontWeight.w400,
                    //                 color: AppColors.e_grey1),
                    //           ),
                    //           // TextSpan(text: ' terms and condition')
                    //         ])),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.02),
                      child: Center(
                          child: SubHeadingWidget(
                        title: 'Already Have Account?',
                        fontSize: 15,
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.05,
                          top: screenHeight * 0.02,
                          right: screenWidth * 0.05),
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.e_primary),
                              borderRadius: BorderRadius.circular(10)),
                          width: screenWidth,
                          height: 54,
                          child: Center(
                            child: Text(
                              'Sig in',
                              style: TextStyle(
                                  fontSize: 18, color: AppColors.e_primary),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                      ),
                    ),
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
