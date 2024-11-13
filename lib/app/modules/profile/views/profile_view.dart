import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../edit_profile/views/edit_profile_view.dart';
import '../../navbar/views/navbar_view.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});

  final ImagePicker _picker = ImagePicker();
  final ProfileController profileController = Get.find();

  // Fungsi untuk memilih gambar dari galeri
  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Update profile image
      controller.updateProfileImage(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Pastikan controller sudah dipasang dengan benar
    Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: Container(
          width: double.infinity,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset(
                  'assets/image/logopmk.png',
                  height: 55,
                  fit: BoxFit.contain,
                ),
              ),
              const Spacer(),
              const Text(
                'Profile',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(
                  'assets/image/logopkm.png',
                  height: 55,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              print('Settings clicked');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Membungkus seluruh body dengan SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Row(
                  children: [
                    Obx(() {
                      // Gunakan profileImage.value untuk mendapatkan gambar
                      return CircleAvatar(
                        radius: 65,
                        backgroundImage: controller.profileImage.value != null
                            ? FileImage(controller
                                .profileImage.value!) // Jika gambar ada
                            : const AssetImage(
                                    'assets/image/default_profile.png')
                                as ImageProvider,
                      );
                    }),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Text(
                              'Name: ${profileController.username.value}',
                              style: TextStyle(fontSize: 16),
                            )),
                        Obx(() => Text(
                              'NIP: ${profileController.nip.value}',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            )),
                        Obx(() => Text(
                              'Dokter: ${profileController.dokter.value}',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            )),
                        Align(
                          child: TextButton(
                            onPressed: () {
                              // Navigasi ke halaman edit profil
                              Get.to(EditProfileView());
                            },
                            child: const Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Tambahkan tombol Edit Profile
              const SizedBox(height: 20),

              // Kotak dengan shadow dan konten seperti yang diminta
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tanggal dan waktu di sebelah kiri-kanan
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sabtu, 26 Maret 2024',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(Icons.access_time, size: 20),
                            SizedBox(width: 4),
                            Text('12.00'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    // Sesi dan Estimasi Pendapatan
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sesi Hari Ini',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black)),
                            SizedBox(height: 4),
                            Text('8 Jan',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Estimasi Pendapatan',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black)),
                            SizedBox(height: 4),
                            Text('Rp. 10.000.000.000',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                    Divider(color: Colors.black, height: 20),

                    // Ikon lokasi, laporan, dan jam
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Kolom untuk Lokasi
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.location_on,
                                size: 40, color: Colors.blue),
                            SizedBox(height: 4),
                            Text('Lokasi', style: TextStyle(fontSize: 14)),
                          ],
                        ),

                        // Kolom untuk Calendar dan Laporan
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.calendar_today,
                                size: 40, color: Colors.yellow),
                            SizedBox(height: 4),
                            Text('Laporan', style: TextStyle(fontSize: 14)),
                          ],
                        ),

                        // Kolom untuk Jam dan Keluar Absen
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.access_time,
                                size: 40, color: Colors.red),
                            SizedBox(height: 4),
                            Text('Keluar Absen',
                                style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // UPT Puskesmas Proppo Text
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'UPT Puskesmas Proppo',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Container for Visi and Misi
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.yellow[400],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    // Visi Text
                    Text(
                      'Visi',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Visi Description
                    Text(
                      'TERWUJUDNYA PUSKESMAS TERDEPAN DALAM PELAYANAN KESEHATAN UNTUK MENCAPAI MASYARAKAT SEHAT DI WILAYAH KERJA UPT PUSKESMAS PROPPO',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 20), // Space between Visi and Misi

                    // Misi Text
                    Text(
                      'Misi',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Misi List
                    Text(
                      '1. Memberikan Pelayanan Kesehatan Paripurna yang Bermutu\n'
                      '2. Membangun Citra Pelayanan Kesehatan dengan Memperlakukan Pengguna Layanan Sebagai Pusat Perhatian\n'
                      '3. Memberdayakan Masyarakat di Bidang Kesehatan di Wilayah Kerja UPT Puskesmas Proppo',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavbarView(),
    );
  }
}
