import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puskesmas/app/modules/login/views/login_view.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  RxBool isLoading = false.obs;

  // Fungsi untuk registrasi pengguna
  Future<void> registerUser(String email, String password, String username) async {
    try {
      isLoading.value = true;
      // Buat akun dengan email dan password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // Dapatkan UID dari user yang baru terdaftar
        String uid = userCredential.user!.uid;

        // Simpan username ke Firestore dengan UID sebagai dokumen
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'username': username,
          'email': email,
        });

        // Registrasi berhasil, tampilkan pesan sukses
        Get.snackbar('Success', 'Registration successful',
            backgroundColor: Colors.green);

        // Beralih ke halaman Login setelah registrasi berhasil
        Get.off(() => LoginView());
      }
    } on FirebaseAuthException catch (error) {
      // Tangani error FirebaseAuthException khususnya
      String errorMessage;
      if (error.code == 'weak-password') {
        errorMessage = 'Password terlalu lemah.';
      } else if (error.code == 'email-already-in-use') {
        errorMessage = 'Email sudah terdaftar.';
      } else {
        errorMessage = 'Registrasi gagal: ${error.message}';
      }
      Get.snackbar('Error', errorMessage, backgroundColor: Colors.red);
    } catch (error) {
      // Tangani error umum lainnya
      Get.snackbar('Error', 'Registration failed: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  // Fungsi untuk login pengguna
  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      // Masuk dengan email dan password
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Login berhasil, arahkan ke halaman utama
      Get.snackbar('Success', 'Login successful',
          backgroundColor: Colors.green);
      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (error) {
      // Tangani error FirebaseAuthException khususnya
      String errorMessage;
      if (error.code == 'user-not-found') {
        errorMessage = 'Pengguna tidak ditemukan.';
      } else if (error.code == 'wrong-password') {
        errorMessage = 'Password salah.';
      } else {
        errorMessage = 'Login gagal: ${error.message}';
      }
      Get.snackbar('Error', errorMessage, backgroundColor: Colors.red);
    } catch (error) {
      // Tangani error umum lainnya
      Get.snackbar('Error', 'Login failed: $error',
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
    @override
    void onClose() {
      nameController.dispose();
      emailController.dispose();
      passwordController.dispose();
      confirmPasswordController.dispose();
      super.onClose();
    }
  }
}
