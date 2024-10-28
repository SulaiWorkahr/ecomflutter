import 'package:flutter/material.dart';

class Fruitslistpage extends StatefulWidget {
  const Fruitslistpage({super.key});

  @override
  State<Fruitslistpage> createState() => _FruitslistpageState();
}

class _FruitslistpageState extends State<Fruitslistpage> {
  final List<Map<String, String>> fruitsList = [
    {
      'image': 'assets/images/tomato.png',
      'minus': 'assets/images/minus.png',
      'number': '2',
      'plus': 'assets/images/plus.png',
      'name': 'Fresh Tomato',
      'actualprice': 'AED90.0',
      'oldprice': 'AED20.0',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fruits',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_alt)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        children: [
          // Search Field
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: TextField(
              style: const TextStyle(color: Colors.black),
              cursorColor: const Color(0xFF027335),
              decoration: const InputDecoration(
                prefixIcon:
                    Icon(Icons.search_outlined, color: Color(0xFFB0B0B0)),
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

          // List of Fruits
          Expanded(
            child: ListView.builder(
              itemCount: fruitsList.length,
              itemBuilder: (context, index) {
                final fruit = fruitsList[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.02,
                  ),
                  color: Colors.black12,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        fruit['image']!,
                        height: 78,
                        width: 84,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fruit['name'] ?? 'No name',
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  fruit['actualprice'] ?? 'AED0.0',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  fruit['oldprice'] ?? 'AED0.0',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    decoration: TextDecoration.lineThrough,
                                    color: Color(0xFF888888),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Image.network(
                                  'assets/images/Discount.png',
                                  height: 18,
                                  width: 18,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Disc 5% off',
                                  style: TextStyle(color: Color(0xFF027335)),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {},
                                  child: Image.network(
                                    fruit['minus']!,
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Text(
                                    fruit['number'] ?? '0',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Image.network(
                                    fruit['plus']!,
                                    height: 30,
                                    width: 30,
                                  ),
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

          // Checkout Section
          Container(
            width: double.infinity,
            color: const Color(0xFFF1FFF7),
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '3 items | 6 Qty',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF027335),
                      ),
                    ),
                    const Text(
                      'Total: AED70.00',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF027335),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(
                      Size(screenWidth * 0.3, screenHeight * 0.065),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF027335)),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      const Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Image.network(
                        'assets/images/arrow-right.png',
                        height: 18,
                        width: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
