import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../profile/controllers/profile_controller.dart';

class EditProfileController extends GetxController {
  final ProfileController profileController = Get.find();  // Mendapatkan instance ProfileController

  final TextEditingController fullNameController = TextEditingController();  // Controller untuk nama lengkap
  final TextEditingController nipController = TextEditingController();  // Controller untuk NIP
  final TextEditingController jenisDokterController = TextEditingController();  // Controller untuk dokter

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi input dengan nilai dari profil saat ini
    fullNameController.text = profileController.username.value ?? '';  // Isi dengan username
    nipController.text = profileController.nip.value ?? '';  // Isi dengan NIP
    jenisDokterController.text = profileController.dokter.value ?? '';  // Isi dengan dokter
  }

  // Fungsi untuk menyimpan perubahan
  void saveProfileChanges() {
    final newUsername = fullNameController.text;  // Ambil nilai baru dari input
    final newNip = nipController.text;  // Ambil nilai baru dari input
    final newDokter = jenisDokterController.text;  // Ambil nilai baru dari input

    // Pastikan data yang dimasukkan valid
    if (newUsername.isNotEmpty && newNip.isNotEmpty && newDokter.isNotEmpty) {
      profileController.updateProfileData(newUsername, newNip, newDokter);  // Memperbarui data profil
      // Feedback sukses untuk user
      Get.snackbar(
        'Success',
        'Profile updated successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      // Feedback jika ada field yang kosong
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    nipController.dispose();
    jenisDokterController.dispose();
    super.onClose();
  }
}
