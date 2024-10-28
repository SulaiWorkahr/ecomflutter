import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';

import '../../widgets/button1_widget.dart';
import '../../widgets/button_widget.dart';

class AddtoCartpage extends StatefulWidget {
  const AddtoCartpage({super.key});

  @override
  State<AddtoCartpage> createState() => _AddtoCartpageState();
}

class _AddtoCartpageState extends State<AddtoCartpage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: screenHeight,
            ),
            Positioned(
              child: Image.asset('images/c_lemon.png'),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(24)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        top: screenHeight * 0.04,
                        bottom: screenHeight * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'FRUITS',
                          style: TextStyle(
                              color: Color(0xFF33BDD6),
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Organic Lemon',
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Morem ipsum dolor sit amet, consectetur iscing elit. Nunc vulputate libero et velit interdum, quet odio mattis.',
                          style: TextStyle(
                              color: Color(0xFF888888),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        //Rating
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'images/star.png',
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '4.6 (89 Views)',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Container(
                              height: 20,
                              width: 1,
                              color: Color(0xFFE7E7E7),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'images/delivery.png',
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'FREE DELIVERY',
                                  style: TextStyle(
                                      color: Color(0xFF027335),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
//Price
                        Text(
                          'Price',
                          style: TextStyle(
                              color: Color(0xFF888888),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'AED50.0',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'AED50.0',
                              style: const TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Color(0xFF888888),
                                color: Color(0xFF888888),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // Handle minus action
                                  },
                                  child: Image.asset(
                                    'images/minus.png',
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Text(
                                    '0',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Handle plus action
                                  },
                                  child: Image.asset(
                                    'images/plus.png',
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        //Dash
                        SizedBox(
                          height: 14,
                        ),
                        Dash(
                          dashLength: 5,
                        ),
                        SizedBox(
                          height: 14,
                        ),

                        //Dis
                        Container(
                          height: 40,
                          width: 160,
                          decoration: BoxDecoration(
                              color: Color(0xFFF9E7AB),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: Text(
                            '20% OFF  DISCOUNT',
                            style: TextStyle(color: Color(0xFF027335)),
                          )),
                        ),
                        SizedBox(
                          height: 14,
                        ),

                        //Button
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                minimumSize: WidgetStatePropertyAll(Size(
                                    screenWidth * 0.05, screenHeight * 0.08)),
                                backgroundColor:
                                    WidgetStatePropertyAll(Color(0xFF027335))),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'images/cart.png',
                                  height: 18,
                                  width: 18,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Add to cart',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
