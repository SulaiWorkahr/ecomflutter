import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/constants/app_assets.dart';
import 'package:e_commerce/widgets/heading_widget.dart';
import 'package:e_commerce/widgets/sub_heading_widget.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../widgets/button1_widget.dart';

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
            Image.asset(
              AppAssets.bg,
              width: screenWidth,
              height: screenHeight * 0.5,
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.1, top: 0),
              child: Image.asset(
                width: screenWidth * 0.8,
                height: screenHeight * 0.5,
                AppAssets.objects,
              ),
            ),
            Spacer(),
            Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.49,
                  // left: screenWidth * 0.3,
                  // right: screenHeight * 0.3
                ),
                child: Column(
                  children: [
                    DotsIndicator(
                      dotsCount: 4,
                      decorator: DotsDecorator(
                        color: AppColors.e_grey2,
                        activeColor: AppColors.e_primary,
                        size: const Size.square(8.0),
                        activeSize: const Size(16.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    HeadingWidget(
                      title: 'Welcome to Grocery Application.',
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: screenHeight * 0.012,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.1, right: screenWidth * 0.1),
                      child: SubHeadingWidget(
                        title:
                            'Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.',
                        fontSize: 14,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.02,
                          left: screenWidth * 0.07,
                          right: screenWidth * 0.07,
                          bottom: screenHeight * 0.02),
                      child: Button1Widget(
                        title: 'Next',
                        fontWeight: FontWeight.w600,
                        height: 54,
                        width: screenWidth,
                        color: AppColors.e_primary,
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
