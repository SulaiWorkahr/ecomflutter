import 'package:flutter/material.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  final List<Map<String, String>> shopping = [
    {
      'image': 'assets/images/sweetpotato.png',
      'minus': 'assets/images/minus.png',
      'number': '2',
      'plus': 'assets/images/plus.png',
      'name': 'Sweet Young Coc..',
      'type': 'Fruits',
      'actualprice': 'AED90.0',
      'oldprice': 'AED20.0',
      'singletotal': 'AED9.50',
      'item': '3 item',
      'Qty': '6 Qty',
      'Total': 'AED70.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping Cart',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        children: [
          // Fixed Search Field at the top
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
            child: TextField(
              style: const TextStyle(color: Colors.black),
              cursorColor: const Color(0xFF027335),
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: Color(0xFFB0B0B0),
                ),
                hintText: 'Search Beverage or Foods',
                hintStyle: TextStyle(color: Color(0xFFB0B0B0)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onChanged: (value) {},
            ),
          ),
          const SizedBox(height: 8),

          // Scrollable content below
          Expanded(
            child: ListView.builder(
              itemCount: shopping.length, // Dynamic length
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.02),
                  color: Colors.black12,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        shopping[index]['image']!,
                        height: 78,
                        width: 84,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  shopping[index]['name'] ?? 'No name',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  shopping[index]['singletotal'] ?? 'AED0.0',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF027335)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              shopping[index]['type'] ?? 'No type',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF888888),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  shopping[index]['actualprice'] ?? 'AED0.0',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  shopping[index]['oldprice'] ?? 'AED0.0',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Color(0xFF888888),
                                    color: Color(0xFF888888),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Handle minus action
                                      },
                                      child: Image.network(
                                        shopping[index]['minus']!,
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Text(
                                        shopping[index]['number'] ?? '0',
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
                                      child: Image.network(
                                        shopping[index]['plus']!,
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Bottom container for total or checkout button
          Container(
              width: double.infinity,
              color: Color(0xFFF1FFF7),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '3item | 6 Qty',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: (Color(0xFF027335))),
                        ),
                        Text(
                          'Total: AED70.00',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: (Color(0xFF027335))),
                        )
                      ],
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            minimumSize: WidgetStatePropertyAll(
                                Size(screenWidth * 0.05, screenHeight * 0.065)),
                            backgroundColor:
                                WidgetStatePropertyAll(Color(0xFF027335))),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Checkout',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Image.asset(
                              'images/arrow-right.png',
                              height: 18,
                              width: 18,
                            ),
                          ],
                        ))
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
