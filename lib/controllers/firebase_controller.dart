import 'package:bigbag/api/api.dart';
import 'package:bigbag/model/categoryModel.dart';
import 'package:bigbag/model/user_data.dart';
import 'package:bigbag/views/bottom_nav_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_app_ecommerce/model/user_data.dart';
// import 'package:flutter_app_ecommerce/views/bottom_nav_page.dart';
import 'package:get/get.dart';

import '../views/login_page.dart';

class FirebaseController extends GetxController {
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPassController = TextEditingController().obs;
  dynamic errorMessage;
  dynamic sendingData=false;

  var categorys = List<GetMenuCategory>().obs;


  final List<UserData> userDataList = <UserData>[].obs;

  // final FirebaseAuth _mAuth = FirebaseAuth.instance;
  // final DatabaseReference _databaseReference =
  //     FirebaseDatabase.instance.reference();

  @override
  void onInit() {
    super.onInit();
    getCategory();
    //getCurrentUser();
  }

  // void getCurrentUser() {
  //   _mAuth.currentUser;
  // }

  void login() async {
    // var pk = await loginUser(
    //     emailController.value.text, passwordController.value.text);
    // if(pk["authorization_token"] !=null){
    //   Get.offAll(BottomNavigation());
    // }
    // print(pk.toString());
    Get.offAll(BottomNavigation());
  }

  void getCategory()async{

    try{
      categorys.value= [];
      category().then((v) {
        // categorys.value = v.
        categorys.assignAll(v.getMenuCategory.toList());
        print(v.getMenuCategory.toList());

      });


    }catch(e){}


  }



  // void createUserAndStoreData() async {
  //   UserData userData = UserData();
  //   userData.name = nameController.value.text;
  //   userData.email = emailController.value.text;
  //   passwordController.value.text == confirmPassController.value.text
  //       ? userData.password = confirmPassController.value.text
  //       : Get.snackbar("Error", "Password didn't match");
  //   try {
  //     UserCredential userCredential =
  //         await _mAuth.createUserWithEmailAndPassword(
  //             email: userData.email, password: userData.password);
  //     Get.snackbar("Error", "Account has been created successfully");
  //     userData.id = userCredential.user.uid.toString();

  //     var myValue = {
  //       "id": userData.id,
  //       "name": userData.name,
  //       "email": userData.email,
  //       "password": userData.password
  //     };

  //     try {
  //       _databaseReference
  //           .child("users")
  //           .child(userData.id)
  //           .set(myValue)
  //           .then((value) => null);
  //       Get.snackbar("Error", "Data stored successfully");
  //       Get.off(() => BottomNavigation());
  //       resetTextField();
  //     } on FirebaseException catch (e) {
  //       Get.snackbar("Error", e.message);
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     Get.snackbar("Error", e.message);
  //   }
  // }

  // void loginUser() async {
  //   UserData userData = UserData();
  //   userData.email = emailController.value.text;
  //   userData.password = passwordController.value.text;
  //   resetTextField();
  //   try {
  //     await _mAuth.signInWithEmailAndPassword(
  //         email: userData.email, password: userData.password);

  //     Get.off(() => BottomNavigation());
  //     resetTextField();
  //   } on FirebaseAuthException catch (e) {
  //     Get.snackbar("Error", e.message);
  //   }
  // }
  

  //create new customer
  void registerUser() async{
    if(passwordController.value.text != confirmPassController.value.text){
      errorMessage='The password confirmation does not match.';
    }
    else if(passwordController.value.text.length < 8){
      errorMessage='The password must be at least 8 characters.';
    }
    else{
      errorMessage = null;
    }
    sendingData=true;
       
     var userRegister = await registerNewUser(nameController.value.text,emailController.value.text,passwordController.value.text);
     if(userRegister["authorization_token"] !=null){
       sendingData=false;
        Get.offAll(LoginPage());
        
     }
     else{
        Get.snackbar("Oops!", userRegister['errors']['email'][0],backgroundColor: Colors.redAccent,colorText: Colors.white);
        sendingData=false;
     }
     
    
     
  }


  void resetTextField() {
    nameController.value.text = "";
    emailController.value.text = "";
    passwordController.value.text = "";
    confirmPassController.value.text = "";
  }
}
