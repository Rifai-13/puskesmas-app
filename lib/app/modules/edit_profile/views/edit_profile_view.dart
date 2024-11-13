import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // Register the controller once
    final EditProfileController controller = Get.put(EditProfileController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow, // Warna kuning pada AppBar
        title: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Mengatur posisi agar ada jarak antara teks dan gambar
          children: [
            // Menempatkan teks di sebelah kiri
            const Text('Edit Profile'),
            // Menempatkan gambar di pojok kanan atas
            Flexible(
              child: Image.asset(
                'assets/image/logoproppo.png', // Pastikan path gambar sudah benar
                height: 60, // Mengatur tinggi gambar sesuai kebutuhan
                width: 60, // Mengatur lebar gambar sesuai kebutuhan
                fit: BoxFit
                    .contain, // Mengatur gambar agar tetap proporsional dan tidak terpotong
              ),
            ),
          ],
        ),
      ),
      body: Container(
        // Membuat container untuk mengisi seluruh layar
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellow,
              Colors.white
            ], // Gradasi dari kuning ke putih
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              TextField(
                controller: controller.fullNameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  // Border saat input tidak aktif
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 4), // Border abu-abu saat tidak aktif
                  ),
                  // Border saat input dalam keadaan fokus
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 4), // Border hijau saat fokus
                  ),
                  fillColor: Colors.yellow, // Background kuning untuk input
                  filled: true, // Mengaktifkan warna background
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.nipController,
                decoration: InputDecoration(
                  labelText: 'NIP',
                  // Border saat input tidak aktif
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 4), // Border abu-abu saat tidak aktif
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 4), // Garis hijau saat fokus
                  ),
                  fillColor: Colors.yellow, // Background kuning untuk input
                  filled: true, // Mengaktifkan warna background
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.jenisDokterController,
                decoration: InputDecoration(
                  labelText: 'Jenis Dokter',
                 // Border saat input tidak aktif
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 4), // Border abu-abu saat tidak aktif
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 4), // Garis hijau saat fokus
                  ),
                  fillColor: Colors.yellow, // Background kuning untuk input
                  filled: true, // Mengaktifkan warna background
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: controller.saveProfileChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.green, // Mengatur warna latar belakang tombol
                    foregroundColor: Colors.white, // Mengatur warna teks tombol
                    minimumSize: Size(150, 50), // Ukuran tombol
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Sudut tombol membulat
                    ),
                    side: BorderSide(
                        color: Colors.green,
                        width: 2), // Garis hijau pada tombol
                  ),
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
