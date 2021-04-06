import 'package:bigbag/views/registration_page.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_app_ecommerce/views/login_page.dart';
// import 'package:flutter_app_ecommerce/views/registration_page.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Container(
                height: 50, child: Image.asset("assets/bigbag_logo.png")),
          ),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          SizedBox(
            height: 30,
          ),
          drawerTile("Home", () {
            Get.snackbar("Home", "You have selected home");
          }),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          drawerTile("Shop", () {
            Get.snackbar("Shop", "You have selected shop");
          }),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          drawerTile("Top Products", () {
            Get.snackbar("Top Products", "You have selected top products");
          }),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          drawerTile("Best Deal", () {
            Get.snackbar("Best Deal", "You have selected best deal");
          }),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          ExpansionTile(
            title: Text("Customers",
                style: TextStyle(fontSize: 18, color: Colors.black)),
            children: [
              drawerTile("Login", () {
                Get.to(LoginPage());
              }),
              Divider(
                height: 2,
                color: Colors.grey,
              ),
              drawerTile("Register", () {
                Get.to(RegistrationPage());
              }),
            ],
          )
        ],
      ),
    ));
  }

  Widget drawerTile(String name, Function onTap) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
      onTap: onTap,
    );
  }
}
