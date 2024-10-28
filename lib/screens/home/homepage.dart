import 'package:e_commerce/constants/app_assets.dart';
import 'package:e_commerce/constants/app_colors.dart';
import 'package:e_commerce/model/home_page_model/home_category_model.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:pinput/pinput.dart';

import '../../model/home_page_model/home_carousel_model.dart';
import '../../model/home_page_model/home_model.dart';
import '../../services/comfuncservice.dart';
import '../../services/ecommerce_api_service.dart';
import '../../widgets/heading_widget.dart';
import '../../widgets/svgiconButtonWidget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final EcommerceApiService apiService = EcommerceApiService();

  @override
  void initState() {
    super.initState();
    gethomePage();
    gethomecategory();
    gethomecarousel();
  }

  List<HomesPage> homePage = [];
  List<HomesPage> homePageAll = [];
  bool isLoading = false;

  Future gethomePage() async {
    setState(() {
      isLoading = true;
    });

    try {
      var result = await apiService.gethomePage();
      var response = homePageDataFromJson(result);
      if (response.status.toString() == 'SUCCESS') {
        setState(() {
          homePage = response.list;
          homePageAll = homePage;
          isLoading = false;
        });
      } else {
        setState(() {
          homePage = [];
          homePageAll = [];
          isLoading = false;
        });
        showInSnackBar(context, response.message.toString());
      }
    } catch (e) {
      setState(() {
        homePage = [];
        homePageAll = [];
        isLoading = false;
      });
      showInSnackBar(context, 'Error occurred: $e');
    }

    setState(() {});
  }

  //Category
  List<categories> categorypage = [];
  List<categories> categorypageAll = [];
  bool isLoading1 = false;

  Future gethomecategory() async {
    setState(() {
      isLoading1 = true;
    });

    try {
      var result = await apiService.gethomecategory();
      var response = homecategoryDataFromJson(result);
      if (response.status.toString() == 'SUCCESS') {
        setState(() {
          categorypage = response.list;
          categorypageAll = categorypage;
          isLoading1 = false;
        });
      } else {
        setState(() {
          categorypage = [];
          categorypageAll = [];
          isLoading = false;
        });
        showInSnackBar(context, response.message.toString());
      }
    } catch (e) {
      setState(() {
        categorypage = [];
        categorypageAll = [];
        isLoading1 = false;
      });
      showInSnackBar(context, 'Error occurred: $e');
    }

    setState(() {});
  }

  //Carousel
  List<carousels> carouselpage = [];
  List<carousels> carouselpageAll = [];
  bool isLoading2 = false;

  Future gethomecarousel() async {
    setState(() {
      isLoading2 = true;
    });

    try {
      var result = await apiService.gethomecarousel();
      var response = homecarouselDataFromJson(result);
      if (response.status.toString() == 'SUCCESS') {
        setState(() {
          carouselpage = response.list;
          carouselpageAll = carouselpage;
          isLoading2 = false;
        });
      } else {
        setState(() {
          carouselpage = [];
          carouselpageAll = [];
          isLoading2 = false;
        });
        showInSnackBar(context, response.message.toString());
      }
    } catch (e) {
      setState(() {
        carouselpage = [];
        carouselpage = [];
        isLoading2 = false;
      });
      showInSnackBar(context, 'Error occurred: $e');
    }

    setState(() {});
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(14.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingWidget(
                      title: 'Good Morning',
                      color: AppColors.e_grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    Row(
                      children: [
                        HeadingWidget(
                          title: 'Tony Thomas',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        Image.asset(
                          AppAssets.hand,
                          height: 24,
                          width: 24,
                        )
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: AppColors.e_lightyellow,
                  child: Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_outlined,
                          color: AppColors.e_primary,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 20,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.e_red),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),

//Search

            TextField(
              cursorColor: AppColors.e_primary,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: AppColors.grey1,
                  ),
                  hintText: 'Search Beverage for foods',
                  hintStyle: TextStyle(color: AppColors.grey1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  )),
              onChanged: (value) {},
            ),
            SizedBox(
              height: screenWidth * 0.04,
            ),
//CarouselOptions
            if (carouselpage.isNotEmpty)
              Column(
                children: [
                  CarouselSlider.builder(
                    carouselController: CarouselSliderController(),
                    itemCount: carouselpage.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      final e = carouselpage[itemIndex];
                      return ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: Image.asset(e.image, fit: BoxFit.fill,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                          return Image.asset(
                            '',
                          );
                        }),
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,

                      aspectRatio: 13.2 / 6, // Adjust as needed
                      viewportFraction: 1.0,

                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      initialPage: 0,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  DotsIndicator(
                    dotsCount: 4,
                    position: currentIndex,
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
                ],
              ),

            SizedBox(
              height: screenHeight * 0.02,
            ),
//Categories
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text('View More',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.e_primary,
                                decorationStyle: TextDecorationStyle.solid,
                                decorationThickness: 1,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.e_primary)))
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                if (categorypage.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: SizedBox(
                        height: 130.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categorypage.length,
                          itemBuilder: (context, index) {
                            final e = categorypage[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Column(
                                children: [
                                  Container(
                                    height: 109,
                                    width: 97,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Image.asset(e.image),
                                  ),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            );
                          },
                        )),
                  ),
              ],
            ),

//Popular Deals

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Deals',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                if (homePage.isNotEmpty)
                  // Container(
                  //   child: Padding(
                  //     padding: EdgeInsets.all(0),
                  //     child: GridView.builder(
                  //       shrinkWrap:
                  //           true, // Prevents ListView from taking infinite height
                  //       physics: NeverScrollableScrollPhysics(),
                  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 2, // Number of columns
                  //         crossAxisSpacing: 10.0,
                  //         mainAxisSpacing: 10.0,
                  //         childAspectRatio: 0.75,
                  //       ),
                  //       itemCount: homePage.length,
                  //       itemBuilder: (context, index) {
                  //         final e = homePage[index];
                  //         return Container(
                  //           decoration: BoxDecoration(
                  //               color: Color(0xFFFFFFFF),
                  //               borderRadius: BorderRadius.circular(16),
                  //               border: Border.all(
                  //                   color: Color.fromARGB(255, 111, 83, 83))),
                  //           child: Stack(children: [
                  //             Container(
                  //               // Specify height for better layout
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.only(
                  //                     topLeft: Radius.circular(16),
                  //                     topRight: Radius.circular(16)),
                  //               ),
                  //               clipBehavior: Clip
                  //                   .hardEdge, // Ensure the image fits within the rounded container
                  //               child: (e.image != null && e.image!.isNotEmpty)
                  //                   ? Image.asset(
                  //                       e.image, // Safely accessing the 'image' key
                  //                       fit: BoxFit.contain,
                  //                       errorBuilder:
                  //                           (context, error, stackTrace) =>
                  //                               const Icon(Icons.broken_image),
                  //                     )
                  //                   : const Icon(Icons
                  //                       .image_not_supported), // Fallback if the image path is empty
                  //             ),
                  //             Positioned(
                  //                 top: 10,
                  //                 right: 10,
                  //                 child: IconButton(
                  //                     onPressed: () {},
                  //                     icon: Image.asset(
                  //                       'images/heart.png',
                  //                       height: 20,
                  //                       width: 20,
                  //                     ))),
                  //             Padding(
                  //               padding: EdgeInsets.only(top: 120),
                  //               child: Positioned(
                  //                 bottom: 0,
                  //                 left: 12,
                  //                 right: 0,
                  //                 child: Column(
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.start,
                  //                   mainAxisAlignment: MainAxisAlignment.start,
                  //                   children: [
                  //                     Text(
                  //                       e.title,
                  //                       style: const TextStyle(
                  //                           fontSize: 17,
                  //                           fontWeight: FontWeight.w600),
                  //                     ),
                  //                     SizedBox(
                  //                       height: 2,
                  //                     ),
                  //                     Row(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.start,
                  //                       children: [
                  //                         Text(
                  //                           e.actualprice,
                  //                           style: const TextStyle(
                  //                             fontSize: 16,
                  //                             fontWeight: FontWeight.w600,
                  //                           ),
                  //                         ),
                  //                         SizedBox(
                  //                           width: 2,
                  //                         ),
                  //                         Text(
                  //                           e.oldprice,
                  //                           style: const TextStyle(
                  //                               fontSize: 13,
                  //                               decoration:
                  //                                   TextDecoration.lineThrough,
                  //                               decorationColor: Colors.black,
                  //                               fontWeight: FontWeight.w500,
                  //                               color: Color(0xFF888888)),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                     SizedBox(
                  //                       height: 8,
                  //                     ),
                  //                     Row(
                  //                       children: [
                  //                         Text(
                  //                           e.discount,
                  //                           style: const TextStyle(
                  //                               fontSize: 17,
                  //                               fontWeight: FontWeight.w700,
                  //                               color: Color(0xFF027335)),
                  //                         ),
                  //                         SizedBox(
                  //                           width: 12,
                  //                         ),
                  //                         Row(
                  //                           children: [
                  //                             Image.asset(
                  //                               'assets/images/star.png',
                  //                               height: 18,
                  //                               width: 18,
                  //                             ),
                  //                             SizedBox(
                  //                               width: 3,
                  //                             ),
                  //                             Text(
                  //                               e.rating.toString(),
                  //                               style: const TextStyle(
                  //                                 fontSize: 16,
                  //                                 fontWeight: FontWeight.w500,
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         )
                  //                       ],
                  //                     ),
                  //                     SizedBox(
                  //                       height: 14,
                  //                     ),
                  //                     Positioned(
                  //                         child: Padding(
                  //                       padding: const EdgeInsets.only(
                  //                           right: 8, bottom: 8),
                  //                       child: ElevatedButton(
                  //                           style: ButtonStyle(
                  //                               shape: WidgetStatePropertyAll(
                  //                                   RoundedRectangleBorder(
                  //                                       borderRadius:
                  //                                           BorderRadius
                  //                                               .circular(10))),
                  //                               minimumSize:
                  //                                   WidgetStatePropertyAll(Size(
                  //                                       screenWidth * 0.05,
                  //                                       screenHeight * 0.065)),
                  //                               backgroundColor:
                  //                                   WidgetStatePropertyAll(
                  //                                       Color(0xFF027335))),
                  //                           onPressed: () {},
                  //                           child: Row(
                  //                             mainAxisAlignment:
                  //                                 MainAxisAlignment.center,
                  //                             crossAxisAlignment:
                  //                                 CrossAxisAlignment.center,
                  //                             children: [
                  //                               Image.asset(
                  //                                 'assets/images/cart.png',
                  //                                 height: 18,
                  //                                 width: 18,
                  //                               ),
                  //                               SizedBox(
                  //                                 width: 8,
                  //                               ),
                  //                               Text(
                  //                                 'Add to cart',
                  //                                 style: const TextStyle(
                  //                                     fontSize: 14,
                  //                                     fontWeight:
                  //                                         FontWeight.w700),
                  //                               ),
                  //                             ],
                  //                           )),
                  //                     ))
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //           ]),
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),

                  Container(
                    padding: const EdgeInsets.all(0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio:
                            0.7, // Adjust ratio for better height control
                      ),
                      itemCount: homePage.length,
                      itemBuilder: (context, index) {
                        final e = homePage[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.e_grey3),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Flexible image container
                              Expanded(
                                flex:
                                    10, // Image takes 4 parts of the total height
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                  child: (e.image != null &&
                                          e.image!.isNotEmpty)
                                      ? Image.asset(
                                          e.image!,
                                          width: double.infinity,
                                          fit: BoxFit.contain,
                                          errorBuilder: (context, error,
                                                  stackTrace) =>
                                              const Icon(Icons.broken_image),
                                        )
                                      : const Icon(Icons.image_not_supported),
                                ),
                              ),
                              // Spacing between the image and the content
                              SizedBox(height: 0),
                              // Content Section
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.title,
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Row(
                                      children: [
                                        Text(
                                          e.actualprice,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          e.oldprice,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: AppColors.e_grey,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Text(
                                          e.discount,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.e_primary,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        Row(
                                          children: [
                                            Image.asset(
                                              AppAssets.star,
                                              height: 14,
                                              width: 14,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              e.rating.toString(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Spacer to push button to the bottom

                              // Flexible button container
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: SizedBox(
                                  height: 35,
                                  width: double.infinity,
                                  child: SvgIconButtonWidget(
                                    title: 'Add to cart',
                                    width: screenWidth,
                                    leadingIcon: Image.asset(
                                      AppAssets.w_cart,
                                      width: 18,
                                      height: 18,
                                    ),
                                  ),

                                  //     ElevatedButton(
                                  //   style: ElevatedButton.styleFrom(
                                  //     shape: RoundedRectangleBorder(
                                  //       borderRadius: BorderRadius.circular(10),
                                  //     ),
                                  //     backgroundColor: Color(0xFF027335),
                                  //   ),
                                  //   onPressed: () {},
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.center,
                                  //     children: [
                                  //       Image.asset(
                                  //         'assets/images/cart.png',
                                  //         height: 18,
                                  //         width: 18,
                                  //       ),
                                  //       SizedBox(width: 8),
                                  //       Text(
                                  //         'Add to cart',
                                  //         style: const TextStyle(
                                  //           fontSize: 14,
                                  //           fontWeight: FontWeight.w700,
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                //
              ],
            ),
          ],
        ),
      )),
    );
  }
}
