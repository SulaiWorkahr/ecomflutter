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
              top: screenHeight * 0.04,
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
                          color: Color(0xFF027335),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF888888)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF888888)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Contact : 1234567890',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF888888)),
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
                            color: Color(0xFF027335)),
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
                            color: Color(0xFF027335)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Color(0xFFEDEDED),
          ),
        ],
      ),
    );
  }
}
