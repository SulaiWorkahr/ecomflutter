import 'package:flutter/material.dart';

class Orederpage extends StatefulWidget {
  const Orederpage({super.key});

  @override
  State<Orederpage> createState() => _OrederpageState();
}

class _OrederpageState extends State<Orederpage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: screenHeight * 0.02,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05),
          child: Column(
            children: [
              TextField(
                style: const TextStyle(color: Colors.black),
                cursorColor: Color(0xFF027335),
                decoration: const InputDecoration(
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
