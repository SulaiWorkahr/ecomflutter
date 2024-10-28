import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  bool discount = false;
  bool Voucher = false;
  bool FreeShipping = false;
  bool SameDayDeliv = false;

  final List<String> categories = [
    'Fresh Fruits',
    'Fresh Vegetables',
    'Mushroom',
    'Bakery',
    'Fresh Fish',
  ];
  final List<String> items = [
    '45 items',
    '45 items',
    '45 items',
    '45 items',
    '45 items',
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Filter'),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Reset',
                style: TextStyle(color: Color(0xFFC8A633)),
              ))
        ],
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.04,
                right: screenWidth * 0.04,
                top: screenHeight * 0.04,
                bottom: screenHeight * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price Range',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomeTextField(
                          width: 150,
                          hint: '₹5.00',
                        ),
                        CustomeTextField(
                          width: 150,
                          hint: 'Max',
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Divider(
                  color: Color(0xFFEDE6E6),
                ),
                SizedBox(
                  height: 4,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Star Ratings',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              'assets/images/star.png',
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Image.network(
                              'assets/images/star.png',
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Image.network(
                              'assets/images/star.png',
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Image.network(
                              'assets/images/star.png',
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Image.network(
                              'assets/images/star.png',
                              height: 24,
                              width: 24,
                            ),
                          ],
                        ),
                        Text(
                          '4 Star',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFB3B3B3)),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Divider(
                  color: Color(0xFFEDE6E6),
                ),
                SizedBox(
                  height: 4,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Others',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: discount,
                                        onChanged: (Value) {
                                          setState(() {
                                            discount = Value!;
                                          });
                                        }),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'Discount',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                        value: Voucher,
                                        onChanged: (Value) {
                                          setState(() {
                                            Voucher = Value!;
                                          });
                                        }),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'Voucher',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                        value: FreeShipping,
                                        onChanged: (Value) {
                                          setState(() {
                                            FreeShipping = Value!;
                                          });
                                        }),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'FreeShipping',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                        value: SameDayDeliv,
                                        onChanged: (Value) {
                                          setState(() {
                                            SameDayDeliv = Value!;
                                          });
                                        }),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'SameDayDeliv',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),

                //Categories
                SizedBox(
                  height: 4,
                ),
                Divider(
                  color: Color(0xFFEDE6E6),
                ),
                SizedBox(
                  height: 4,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Categories ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            categories[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                items[index],
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFFB3B3B3)),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Color(0xFFB3B3B3),
                              ),
                            ],
                          ),
                          onTap: () {},
                        );
                      },
                    )
                  ],
                ),

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
                      'APPLY FILTER',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    )),
              ],
            ),
          )),
    );
  }
}
