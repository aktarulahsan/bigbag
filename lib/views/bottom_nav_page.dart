import 'dart:ui';

import 'package:bigbag/controllers/firebase_controller.dart';
import 'package:bigbag/views/home_page.dart';
import 'package:bigbag/views/profile_page.dart';
import 'package:bigbag/views/wish_list_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_app_ecommerce/views/cart_page.dart';
// import 'package:flutter_app_ecommerce/views/home_page.dart';
// import 'package:flutter_app_ecommerce/views/profile_page.dart';
// import 'package:flutter_app_ecommerce/views/wish_list_page.dart';

import 'cart_page.dart';
import 'drawer.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final Color appBarColor = Color(0xfffbf2f2);
  final Color primaryColor = Color(0xFFdc3545);

  final cont = Get.put(FirebaseController());
  int _currentIndex = 0;
  final tabs = [
    HomePage(),
    WishListPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    cont.getCategory();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: appBarColor,
      //   centerTitle: true,
      //   iconTheme: IconThemeData(color: Colors.black),
      //   title: Container(
      //       width: 120,
      //       child: Image.asset(
      //         "assets/bigbag_logo.png",
      //       )),
      //   leading: Padding(
      //     padding: const EdgeInsets.only(left: 20),
      //     child: Builder(
      //       builder: (context) {
      //         return SizedBox(
      //           height: 40,
      //           width: 40,
      //           child: FloatingActionButton(
      //             elevation: 0,
      //             onPressed: () {
      //               Scaffold.of(context).openDrawer();
      //             },
      //             child: Icon(
      //               Icons.menu_sharp,
      //               color: Colors.black,
      //             ),
      //             backgroundColor: Colors.white,
      //           ),
      //         );
      //       },
      //     ),
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 10),
      //       child: SizedBox(
      //         height: 40,
      //         width: 40,
      //         child: FloatingActionButton(
      //           elevation: 0,
      //           onPressed: () {},
      //           child: Icon(
      //             Icons.search,
      //             color: Colors.black,
      //           ),
      //           backgroundColor: Colors.white,
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(right: 20),
      //       child: Center(
      //         child: Stack(
      //           children: [
      //             SizedBox(
      //               height: 40,
      //               width: 40,
      //               child: CircleAvatar(
      //                 radius: 10,
      //                 backgroundColor: Colors.white,
      //                 child: Icon(Icons.shopping_cart, color: Colors.black),
      //               ),
      //
      //               /*  FloatingActionButton(
      //                 elevation: 0,
      //                 onPressed: () {},
      //                 child: Icon(
      //                   Icons.shopping_cart,
      //                   color: Colors.black,
      //                 ),
      //                 backgroundColor: Colors.white,
      //               ),*/
      //             ),
      //             Positioned(
      //                 right: 2,
      //                 top: -5,
      //                 child: Text(
      //                   "0",
      //                   style: TextStyle(
      //                       color: primaryColor,
      //                       fontSize: 18,
      //                       fontWeight: FontWeight.bold),
      //                 )),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      drawer: MyDrawer(),
      body: tabs[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.transparent,
        buttonBackgroundColor: Colors.red,
        backgroundColor: Colors.white,
        height: 55,
        index: _currentIndex,
        items: [

          Icon(
            Icons.home,
            size: 30,
            color: _currentIndex == 0 ? Colors.white : Colors.grey,
          ),
          Icon(
            Icons.favorite,
            size: 30,
            color: _currentIndex == 1 ? Colors.white : Colors.grey,
          ),
          Icon(
            Icons.shopping_basket,
            size: 30,
            color: _currentIndex == 2 ? Colors.white : Colors.grey,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: _currentIndex == 3 ? Colors.white : Colors.grey,
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
