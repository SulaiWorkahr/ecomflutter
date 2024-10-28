import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_rounded_textfield.dart';

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
            decoration: BoxDecoration(color: Color(0xFF027335)),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: screenHeight * 0.75,
              width: screenWidth,
              decoration: BoxDecoration(
                  color: Colors.white,
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
                      child: Text(
                        'Create your account',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.05),
                      child: Text(
                        'Enter the required details',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Color(0xFFB0B0B0),
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.05, right: screenWidth * 0.05),
                      child: CustomeTextField(
                        labelText: 'Enter your Name',
                        labelColor: Color(0xFF027335),
                        focusBorderColor: Color(0xFF027335),
                        width: screenWidth * 1,
                        borderColor: Color(0xE7E7E7E7),
                        prefixIcon: Icon(
                          Icons.person_outline_outlined,
                          color: Color(0xFF027335),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.05, right: screenWidth * 0.05),
                      child: CustomeTextField(
                        labelText: 'Enter your mail id',
                        labelColor: Color(0xFF027335),
                        focusBorderColor: Color(0xFF027335),
                        width: screenWidth * 1,
                        borderColor: Color(0xE7E7E7E7),
                        prefixIcon: Icon(Icons.email_outlined,
                            color: Color(0xFF027335)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.05, right: screenWidth * 0.05),
                      child: CustomeTextField(
                        labelText: 'Password',
                        labelColor: Color(0xFF027335),
                        focusBorderColor: Color(0xFF027335),
                        width: screenWidth * 1,
                        borderColor: Color(0xE7E7E7E7),
                        suffixIcon: Icon(Icons.remove_red_eye_outlined,
                            color: Color(0xFF027335)),
                        prefixIcon:
                            Icon(Icons.lock_outline, color: Color(0xFF027335)),
                      ),
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
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.05,
                          right: screenWidth * 0.05,
                          top: screenHeight * 0.01),
                      child: Row(
                        children: [
                          Checkbox(value: value, onChanged: (Value) {}),
                          Padding(
                            padding: EdgeInsets.only(
                                right: screenWidth * 0.2, top: 0.02),
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: 'By tapping “Sign Up” you accept our',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF888888)),
                              ),
                              TextSpan(text: ' terms and condition')
                            ])),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.02),
                      child: Center(
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Already Have Account?',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF888888)),
                            )),
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
