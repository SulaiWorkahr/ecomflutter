import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
              right: screenWidth * 0.05),
          child: Column(
            children: [
              TextField(
                style: const TextStyle(color: Colors.black),
                cursorColor: Color(0xFF027335),
                decoration: InputDecoration(
                    suffix: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Search',
                        style: TextStyle(
                          color: Color(0xFF027335),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: Color(0xFFB0B0B0),
                    ),
                    hintText: 'Search Beverage for foods',
                    hintStyle: TextStyle(color: Color(0xFFB0B0B0)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    )),
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
