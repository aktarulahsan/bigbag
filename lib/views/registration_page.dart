import 'package:bigbag/controllers/firebase_controller.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_app_ecommerce/main.dart';
import 'package:get/get.dart';
import '../main.dart';
import 'login_page.dart';

class RegistrationPage extends StatelessWidget {
  final firebaseController = Get.put(FirebaseController());

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
                          "Register",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Form(
                          child: Column(
                        children: [
                          TextFormField(
                            controller: firebaseController.nameController.value,
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                                labelText: "Name",
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
                            controller:
                                firebaseController.emailController.value,
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
                            controller:
                                firebaseController.passwordController.value,
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
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller:
                                firebaseController.confirmPassController.value,
                            obscureText: true,
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                                labelText: "Confirm Password",
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
                          if(firebaseController.sendingData == false){
                             firebaseController.registerUser();
                          }
                          if (firebaseController.errorMessage != null) {
                           final snackBar = SnackBar(content: Text(firebaseController.errorMessage),backgroundColor: Colors.redAccent,);
                           ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }                         
                          
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "SIGN UP",
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
                        "Already habe an account?",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => LoginPage());
                        },
                        child: Text(
                          "Login here",
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
