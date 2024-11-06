import 'dart:async';

import 'package:e_commerce/screens/onboarding/onboarding_page_second.dart';
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import 'screens/address/add_address_page.dart';
import 'screens/address/myaddress.dart';
import 'screens/Filter/search_filter.dart';
import 'Location/location_allow.dart';
import 'screens/auth/login_page.dart';
import 'screens/auth/otp_verification_page.dart';
import 'screens/auth/registor.dart';
import 'screens/cancelbooking/cancel_booking.dart';
import 'screens/cart/addto_cartpage.dart';
import 'screens/cart/shoppingcartpage.dart';
import 'screens/cart/fruitslist/fruits_list.dart';
import 'controllers/base_controller.dart';

import 'package:flutter/material.dart';

import 'constants/constants.dart';
import 'screens/home/category_list.dart';
import 'screens/home/homepage.dart';
import 'maincontainer/maincontainer.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/search/search_product.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BaseController baseCtrl = Get.put(BaseController());

  runApp(MyApp());
}

class MyApp extends StatefulWidget with WidgetsBindingObserver {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  BaseController baseCtrl = Get.put(BaseController());

  _MyAppState() {
    print('baseCtrl ${baseCtrl.isDarkModeEnabled.value}');
    baseCtrl.isDarkModeEnabled.listen((value) {
      refresh();
    });
  }

  refresh() {
    setState(() {
      isDarkModeEnabled = baseCtrl.isDarkModeEnabled.value;
      AppColors();
    });
  }

  bool isDarkModeEnabled = false;
  var position;

  toggleDarkMode() {
    setState(() {
      isDarkModeEnabled = !isDarkModeEnabled;
      AppColors();
      print('color ${AppColors.dark}');
      print('isDarkModeEnabled ${AppColors.dark}');
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  bool isDebugMode() {
    bool isDebug = false;
    if (!kReleaseMode && (kDebugMode || kProfileMode)) {
      isDebug = true;
    }
    return isDebug;
  }

  @override
  void dispose() async {
    super.dispose();
  }

  @override
  void deactivate() async {
    print('page deactivate');
    super.deactivate();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {});
    } else if (state == AppLifecycleState.inactive) {
      // checkuserlog("-close");
    } else if (state == AppLifecycleState.paused) {
      // checkuserlog("-pause");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: MaterialApp(
        title: AppConstants.appTitle,
        debugShowCheckedModeBanner: false,
        theme: isDarkModeEnabled ? AppTheme.darkTheme : AppTheme.lightTheme,
        home: ProfileScreen(),
      ),
    );
  }
}
