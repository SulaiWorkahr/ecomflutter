import 'package:e_commerce/constants/constants.dart';
import 'package:flutter/material.dart';

class SearchHistory extends StatefulWidget {
  const SearchHistory({super.key});

  @override
  State<SearchHistory> createState() => _SearchHistoryState();
}

class _SearchHistoryState extends State<SearchHistory> {
  final List<Map<String, dynamic>> searchHistory = [
    {'label': 'Apple', 'image': AppAssets.s_apple},
    {'label': 'orange', 'image': AppAssets.s_orange},
    {'label': 'Chilly', 'image': AppAssets.s_chilly},
    {'label': 'Lemon', 'image': AppAssets.s_lemon},
    {'label': 'Onion', 'image': AppAssets.s_onion},
    {'label': 'Pineapple', 'image': AppAssets.s_pineapple},
    {'label': 'Strawberry', 'image': AppAssets.s_strawberry},
  ];
  final List<Map<String, dynamic>> popularSearch = [
    {'label': 'Apple', 'image': AppAssets.s_apple},
    {'label': 'orange', 'image': AppAssets.s_orange},
    {'label': 'Chilly', 'image': AppAssets.s_chilly},
  ];

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Search History',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Delete',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF009444)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: searchHistory.map((item) {
                  return Chip(
                    side: BorderSide.none,
                    backgroundColor: Color(0xFFF1FFF7),
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          item['image'] ?? '',
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          item['label'],
                          style: TextStyle(color: Color(0xFF027335)),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Search History',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: popularSearch.map((item) {
                  return Chip(
                    side: BorderSide.none,
                    backgroundColor: Color(0xFFF1FFF7),
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          item['image'] ?? '',
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          item['label'],
                          style: TextStyle(color: Color(0xFF027335)),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
