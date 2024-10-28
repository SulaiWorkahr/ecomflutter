import 'package:e_commerce/widgets/button1_widget.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.05,
        left: screenWidth * 0.05,
        right: screenWidth * 0.05,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextField(
          style: const TextStyle(color: Colors.black),
          cursorColor: const Color(0xFF027335),
          decoration: InputDecoration(
            suffix: TextButton(
              onPressed: () {},
              child: const Text(
                'Search',
                style: TextStyle(
                  color: Color(0xFF027335),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            prefixIcon: const Icon(
              Icons.search_outlined,
              color: Color(0xFFB0B0B0),
            ),
            hintText: 'Search Beverage or Foods',
            hintStyle: const TextStyle(color: Color(0xFFB0B0B0)),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          onChanged: (value) {},
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'images/s_p_onion.png',
                        height: 80,
                        width: 100,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bellary Onion'),
                          Text('Vegetable'),
                          Text('AED9.00'),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'images/cart.png',
                            height: 16,
                            width: 16,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Color(0xFF027335),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Buy Now',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ]),
    )));
  }
}
