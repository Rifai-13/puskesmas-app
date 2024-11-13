import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  Rx<File?> profileImage = Rx<File?>(null); // Reactive variable for image
  // RxString username = 'John Doe'.obs; // Observable username
  // RxString nip = '12345678900000'.obs; // Observable NIP
  // RxString dokter = 'dokter umum'.obs; // Observable dokter type

  var username = ''.obs;
  var nip = ''.obs;
  var dokter = ''.obs;
  // var profileImage = File('').obs;

  @override
  void onInit() {
    super.onInit();
    _loadProfileImage(); // Load image from SharedPreferences when app starts
    _loadProfileData(); // Load username, NIP, and dokter type when app starts
  }

  // Fungsi untuk memperbarui gambar profil
  void updateProfileImage(File newImage) async {
    profileImage.value = newImage; // Update the reactive variable
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('profile_image_path', newImage.path); // Save image path
  }

  // Fungsi untuk memperbarui data profil (username, NIP, dan jenis dokter)
  void updateProfileData(String newUsername, String newNip, String newDokter) async {
    username.value = newUsername;
    nip.value = newNip;
    dokter.value = newDokter;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', newUsername);
    prefs.setString('nip', newNip);
    prefs.setString('dokter', newDokter);

    update(); 
    Get.snackbar(
      'Success',
      'Profile updated successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  // Fungsi untuk memuat gambar profil dari SharedPreferences
  Future<void> _loadProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('profile_image_path');
    if (imagePath != null) {
      profileImage.value = File(imagePath); // Load image if path exists
    }
  }

  // Fungsi untuk memuat data profil dari SharedPreferences
  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString('username') ?? 'John Doe';
    nip.value = prefs.getString('nip') ?? '12345678900000';
    dokter.value = prefs.getString('dokter') ?? 'dokter umum';
    update(); // Notify listeners to update the UI
  }
}
