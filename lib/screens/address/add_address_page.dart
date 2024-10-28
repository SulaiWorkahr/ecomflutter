import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Address'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.04,
                right: screenWidth * 0.04,
                top: screenHeight * 0.04,
                bottom: screenHeight * 0.04),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Customer Name',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    CustomeTextField(
                      width: double.infinity,
                      hint: 'Tony Thomas',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Number',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    CustomeTextField(
                      width: double.infinity,
                      hint: '+971 9876543210',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Land Mark',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    CustomeTextField(
                      width: double.infinity,
                      hint: 'Lorem ipsum',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    CustomeTextField(
                      width: double.infinity,
                      hint:
                          'Lorem ipsum dolor sit amet consectetur. Eleifend diam ipsum tortor',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  minimumSize: WidgetStatePropertyAll(
                      Size(screenWidth * 0.9, screenHeight * 0.07)),
                  backgroundColor: WidgetStatePropertyAll(Color(0xFF027335)),
                ),
                onPressed: () {},
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )),
          ),
        ],
      ),
    );
  }
}
