import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../navbar/views/navbar_view.dart';// Mengimpor NavbarView agar bisa memanggil Navbar

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Home',  // Menampilkan teks sederhana
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NavbarView(),
    );
  }
}
