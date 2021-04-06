import 'package:bigbag/views/registration_page.dart';
import 'package:flutter/material.dart';
/* import 'package:flutter_app_ecommerce/controllers/firebase_controller.dart';
import 'package:flutter_app_ecommerce/views/registration_page.dart'; */
import 'package:get/get.dart';
import '../main.dart';

class LoginPage extends StatelessWidget {
  //final firebaseController = Get.put(FirebaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 200,
                  width: 200,
                  child: Image.asset("assets/bigbag_logo.png")),
              Card(
                elevation: 20,
                margin: EdgeInsets.only(left: 30, right: 30),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Welcome back! Please login to your account",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Form(
                          child: Column(
                        children: [
                          TextFormField(
                            //controller:
                            //firebaseController.emailController.value,
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                                labelText: "Email",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MyApp().primaryColor))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            // controller:
                            //     firebaseController.passwordController.value,
                            obscureText: true,
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                                labelText: "Password",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MyApp().primaryColor))),
                          ),
                        ],
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          //firebaseController.loginUser();
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "SIGN IN",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )),
                        ),
                        style: ElevatedButton.styleFrom(
                            elevation: 10,
                            primary: MyApp().primaryColor,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => RegistrationPage());
                        },
                        child: Text(
                          "Register here",
                          style: TextStyle(
                              color: MyApp().primaryColor, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
