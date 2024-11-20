import 'package:e_commerce/widgets/heading_widget.dart';
import 'package:e_commerce/widgets/sub_heading_widget.dart';
import 'package:flutter/material.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: HeadingWidget(
            title: 'My Profile',
            fontSize: 24,
          ),
         
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppAssets.profileimg,
                      height: 72,
                      width: 72,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        child: Container(
                            // height: 70,
                            // width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                                color: Color(0xFFCCEADA),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  HeadingWidget(
                                    title: 'Tony Thomas',
                                    color: Color(0xFF009444),
                                  ),
                                  // SizedBox(width: 30),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      // Add your edit profile functionality here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                    ),
                                    icon: Icon(
                                      Icons.edit_outlined,
                                      color: Color(0xFF009444),
                                    ),
                                    label: Text(
                                      'Edit',
                                      style: TextStyle(
                                        color: Color(0xFF009444),
                                      ),
                                    ),
                                  )
                                ]))),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Image.asset(
                          AppAssets.genderal,
                          height: 50,
                          width: 50,
                        ),
                        SubHeadingWidget(
                          title: 'General',
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ]),
                      Icon(Icons.expand_more),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(children: [
                      Image.asset(
                        AppAssets.profileorderhistroy,
                        height: 72,
                        width: 72,
                      ),
                      SubHeadingWidget(
                        title: 'Order history',
                        color: Colors.black,
                      )
                    ]),
                    Column(children: [
                      Image.asset(
                        AppAssets.profileaddress,
                        height: 72,
                        width: 72,
                      ),
                      SubHeadingWidget(
                        title: 'Address',
                        color: Colors.black,
                      ),
                    ]),
                    Column(children: [
                      Image.asset(
                        AppAssets.profilepayment,
                        height: 72,
                        width: 72,
                      ),
                      SubHeadingWidget(
                        title: 'Payment',
                        color: Colors.black,
                      ),
                    ]),
                    Column(children: [
                      Image.asset(
                        AppAssets.profilesettings,
                        height: 72,
                        width: 72,
                      ),
                      SubHeadingWidget(
                        title: 'Settings',
                        color: Colors.black,
                      ),
                    ]),
                  ],
                ),
                SizedBox(height: 20),
                _buildListTile(Icons.favorite_border, 'Favorite', () {}),
                SizedBox(height: 20),
                _buildListTile(
                    Icons.receipt_long, 'Transaction History', () {}),
                SizedBox(height: 20),
                _buildListTile(Icons.lock_outline, 'Password Manager', () {}),
                SizedBox(height: 20),
                _buildListTile(Icons.logout, 'Log out', () {}),
              ],
            ),
          ),
        ));
  }

  Widget _buildListTile(IconData icon, String text, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: SubHeadingWidget(
        title: text,
        color: Colors.black,
        fontSize: 20,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Color(0xFF009444),
      ),
      onTap: onTap,
    );
  }
}
