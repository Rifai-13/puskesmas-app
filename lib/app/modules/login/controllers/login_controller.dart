import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../home/views/home_view.dart';
import '../../register/views/register_view.dart';

class LoginController extends GetxController {
  // Controller untuk input email dan password
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

  // // Fungsi untuk login menggunakan Firebase Auth
  // Future<void> login() async {
  //   try {
  //     // Mendapatkan email dan password dari controller
  //     String email = emailController.text.trim();
  //     String password = passwordController.text.trim();

  //     // Melakukan autentikasi dengan Firebase
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );

  //     // Jika login berhasil, arahkan ke halaman utama (HomeView)
  //     Get.to(() => HomeView());
  //   } catch (e) {
  //     // Jika login gagal, tampilkan pesan error
  //     Get.snackbar('Login Failed', e.toString(),
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white);
  //   }
  // }
}
