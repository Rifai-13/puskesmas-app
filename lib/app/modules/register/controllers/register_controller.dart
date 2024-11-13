import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // final nameController = TextEditingController();
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  // final confirmPasswordController = TextEditingController();

  // void register() async {
  //   if (passwordController.text == confirmPasswordController.text) {
  //     try {
  //       await _auth.createUserWithEmailAndPassword(
  //         email: emailController.text.trim(),
  //         password: passwordController.text.trim(),
  //       );

  //       Get.snackbar('Success', 'Registration successful!');
  //       Get.toNamed('/login'); // Navigate to login page
  //     } catch (e) {
  //       Get.snackbar('Error', e.toString());
  //     }
  //   } else {
  //     Get.snackbar('Error', 'Passwords do not match');
  //   }
  // }
}