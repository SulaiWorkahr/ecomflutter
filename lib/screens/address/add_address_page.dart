import 'package:e_commerce/constants/app_colors.dart';
import 'package:e_commerce/widgets/button_widget.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:e_commerce/widgets/heading_widget.dart';
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
                    HeadingWidget(
                      title: "Customer Name",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomeTextField(
                      borderColor: AppColors.e_grey3,
                      onTap: () {},
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
                    HeadingWidget(
                      title: "Contact Number",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomeTextField(
                      borderColor: AppColors.e_grey3,
                      onTap: () {},
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
                    HeadingWidget(
                      title: "Land Mark",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomeTextField(
                      borderColor: AppColors.e_grey3,
                      onTap: () {},
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
                    HeadingWidget(
                      title: "Address",
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomeTextField(
                      borderColor: AppColors.e_grey3,
                      onTap: () {},
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
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: ButtonWidget(
                title: 'Submit',
                width: screenWidth * 1,
                color: AppColors.e_primary,
                onTap: () {},
              )),
        ],
      ),
    );
  }
}
