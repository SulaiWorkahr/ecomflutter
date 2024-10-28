import 'package:flutter/material.dart';

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
            child: Text(
              'We don’t have your location, yet!',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.15,
                left: screenWidth * 0.05,
                right: screenWidth * 0.1),
            child: Text(
              'Set your location to start exploring laundering service near you',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF888888)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.25),
            child: Image.network(
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
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.03),
                child: Column(
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                          minimumSize: WidgetStatePropertyAll(
                              Size(screenWidth * 0.9, screenHeight * 0.07)),
                          backgroundColor:
                              WidgetStatePropertyAll(Color(0xFF027335)),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Allow access your location',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        )),
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
                            color: Color(0xFF027335)),
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
