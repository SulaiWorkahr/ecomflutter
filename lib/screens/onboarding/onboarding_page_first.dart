import 'package:flutter/material.dart';

class OnboardingPagefirst extends StatefulWidget {
  const OnboardingPagefirst({super.key});

  @override
  State<OnboardingPagefirst> createState() => _OnboardingPagefirstState();
}

class _OnboardingPagefirstState extends State<OnboardingPagefirst> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.1),
        child: Stack(
          children: [
            Image.network(
              'assets/images/bg.png',
              width: screenWidth,
              height: screenHeight * 0.5,
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.1, top: 0),
              child: Image.network(
                width: screenWidth * 0.8,
                height: screenHeight * 0.5,
                'assets/images/obejcts.png',
              ),
            ),
            Spacer(),
            Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.55,
                  // left: screenWidth * 0.3,
                  // right: screenHeight * 0.3
                ),
                child: Column(
                  children: [
                    Text(
                      'Welcome to Grocery Application.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.015,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.1, right: screenWidth * 0.1),
                      child: Text(
                        'Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF8E9488)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.02,
                          left: screenWidth * 0.07,
                          right: screenWidth * 0.07,
                          bottom: screenHeight * 0.02),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            minimumSize: WidgetStatePropertyAll(
                                Size(screenWidth * 1, screenHeight * 0.07)),
                            backgroundColor:
                                WidgetStatePropertyAll(Color(0xFF027335)),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Next',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
