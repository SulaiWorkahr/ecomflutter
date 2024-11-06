import 'package:e_commerce/constants/app_assets.dart';
import 'package:e_commerce/widgets/heading_widget.dart';
import 'package:e_commerce/widgets/sub_heading_widget.dart';
import 'package:flutter/material.dart';

class OrderConfirmationPage extends StatefulWidget {
  @override
  _OrderConfirmationPageState createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  int _selectedRating = 0;

  void _setRating(int rating) {
    setState(() {
      _selectedRating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeadingWidget(title: 'Order Confirmation'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Confirmation section
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFF027335),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                  SizedBox(height: 20),
                  HeadingWidget(
                    title: 'Total: AED 27.00',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF027335),
                  ),
                  SizedBox(height: 8),
                  SubHeadingWidget(
                      title: 'Order ID#0012345', color: Colors.black),
                ],
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF027335),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Image.asset(
                  AppAssets.shoopingbag,
                  height: 40,
                  width: 40,
                ),
                // Icon(Icons.shopping_bag_outlined,
                //     color: Colors.white, size: 40),
                SizedBox(height: 12),
                HeadingWidget(
                  title: 'Hey Benny Dayal !',
                  color: Colors.white,
                ),
                SizedBox(
                  height: 1,
                ),
                HeadingWidget(
                    title: 'Thank you for your purchase.', color: Colors.white),
                SizedBox(height: 20),
                HeadingWidget(title: 'Rate us', color: Colors.white),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return IconButton(
                      onPressed: () => _setRating(index + 1),
                      icon: Icon(
                        Icons.star,
                        color: index < _selectedRating
                            ? Colors.yellow
                            : Colors.white,
                      ),
                    );
                  }),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.white,
                      // onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: SubHeadingWidget(
                      title: 'Done',
                      color: Colors.black,
                    ),
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
