import 'package:bigbag/views/bottom_nav_page.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_app_ecommerce/views/bottom_nav_page.dart';
// import 'package:flutter_app_ecommerce/views/login_page.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main(List<String> args) async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color primaryColor = Color(0xFFdc3545);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: primaryColor, accentColor: primaryColor),
      title: "BigBag",
      home: BottomNavigation(),
    );
  }
}
