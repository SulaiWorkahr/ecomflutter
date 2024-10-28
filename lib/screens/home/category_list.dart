import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final List<Map<String, String>> categoryList = [
    {'image': 'assets/images/c_fruits.png', 'items': '43 items'},
    {'image': 'assets/images/c_vegetables.png', 'items': '43 items'},
    {'image': 'assets/images/c_Bakery.png', 'items': '43 items'},
    {'image': 'assets/images/c_Dairy.png', 'items': '43 items'},
    {'image': 'assets/images/v_Mushroom.png', 'items': '43 items'},
    {'image': 'assets/images/c_Fish.png', 'items': '43 items'},
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.04,
            top: screenHeight * 0.02,
          ),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFE7E7E7)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                categoryList[index]['image']!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.broken_image),
                              ),
                            ),
                            Positioned(
                              bottom: 16,
                              left: 16,
                              child: Text(
                                categoryList[index]['items']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
