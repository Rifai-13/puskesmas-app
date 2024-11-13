import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puskesmas/app/modules/register/views/register_view.dart'; // Mengimpor RegisterView
import '../controllers/auth_controller.dart'; // Mengimpor AuthController

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Menggunakan GetX untuk menghubungkan dengan AuthController
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      body: Container(
        // Mengubah background utama menjadi gradasi
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellow.shade200,
              Colors.white
            ], // Gradasi kuning ke putih
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SingleChildScrollView(
          // Membuat seluruh body bisa digulir
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome,',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {
                          // Mengarahkan ke halaman RegisterView jika belum memiliki akun
                          Get.to(() => RegisterView());
                        },
                        child: const Text(
                          'Login in now to continue',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset('assets/image/logopmk.png',
                            width: 60, height: 60),
                        const SizedBox(width: 8),
                        Image.asset('assets/image/logopkm.png',
                            width: 60, height: 60),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: Image.asset('assets/image/logoproppo.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.width * 0.6),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Colors.yellow.shade200,
                      Colors.green
                    ], // Gradasi kuning ke putih
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: TextField(
                  controller: authController
                      .emailController, // Menggunakan emailController dari AuthController
                  decoration: const InputDecoration(
                    labelText: 'Enter your email',
                    prefixIcon: Icon(Icons.email),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Colors.yellow.shade200,
                      Colors.green
                    ], // Gradasi kuning ke putih
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: TextField(
                  controller: authController
                      .passwordController, // Menggunakan passwordController dari AuthController
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Enter your password',
                    prefixIcon: Icon(Icons.lock),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      colors: [
                        Colors.green.shade700, // Darker green at the top
                        Colors.green.shade400, // Lighter green in the middle
                        Colors.white, // White at the bottom
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () => authController.loginUser(
                      authController.emailController.text,
                      authController.passwordController.text,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.transparent, // Transparent button background
                      shadowColor: Colors.transparent, // Remove button shadow
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),
              // Teks "or login with"
              Center(
                child: Text(
                  'or login with:',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 25),
              // Ikon sosial media
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon:
                            Icon(Icons.facebook, color: Colors.blue, size: 30),
                        onPressed: () {
                          // Logika login dengan Facebook
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.camera_alt,
                            color: Colors.pink, size: 30), // Instagram Icon
                        onPressed: () {
                          // Logika login dengan Instagram
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.business_center,
                            color: Colors.blueAccent,
                            size: 30), // LinkedIn Icon
                        onPressed: () {
                          // Logika login dengan LinkedIn
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.chat_bubble,
                            color: Colors.lightBlue, size: 30), // Twitter Icon
                        onPressed: () {
                          // Logika login dengan Twitter
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
