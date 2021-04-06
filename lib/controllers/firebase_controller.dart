import 'package:bigbag/model/user_data.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter_app_ecommerce/model/user_data.dart';
// import 'package:flutter_app_ecommerce/views/bottom_nav_page.dart';
import 'package:get/get.dart';

class FirebaseController extends GetxController {
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPassController = TextEditingController().obs;

  final List<UserData> userDataList = <UserData>[].obs;

  // final FirebaseAuth _mAuth = FirebaseAuth.instance;
  // final DatabaseReference _databaseReference =
  //     FirebaseDatabase.instance.reference();

  @override
  void onInit() {
    super.onInit();
    //getCurrentUser();
  }

  // void getCurrentUser() {
  //   _mAuth.currentUser;
  // }

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

  void resetTextField() {
    nameController.value.text = "";
    emailController.value.text = "";
    passwordController.value.text = "";
    confirmPassController.value.text = "";
  }
}
