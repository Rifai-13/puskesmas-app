import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../login/controllers/auth_controller.dart'; // Import AuthController
import '../../login/views/login_view.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final AuthController authController =
      Get.put(AuthController()); // Access AuthController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green.shade500,
              Colors.white
            ], // Gradiant from green to white
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SingleChildScrollView(
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
                        'Welcome',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => LoginView());
                        },
                        child: const Text(
                          'Sign up now to continue',
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
                      Colors.yellow.shade300,
                      Colors.white
                    ], // Gradiant from yellow to white
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: TextField(
                  controller: authController
                      .nameController, // Use authController for nameController
                  decoration: const InputDecoration(
                    labelText: 'Enter your name',
                    prefixIcon: Icon(Icons.person),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Colors.yellow.shade300,
                      Colors.white
                    ], // Gradiant from yellow to white
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: TextField(
                  controller: authController
                      .emailController, // Use authController for emailController
                  decoration: const InputDecoration(
                    labelText: 'Enter your email',
                    prefixIcon: Icon(Icons.email),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Colors.yellow.shade300,
                      Colors.white
                    ], // Gradiant from yellow to white
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: TextField(
                  controller: authController
                      .passwordController, // Use authController for passwordController
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
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Colors.yellow.shade300,
                      Colors.white
                    ], // Gradiant from yellow to white
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: TextField(
                  controller: authController
                      .confirmPasswordController, // Use authController for confirmPasswordController
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm your password',
                    prefixIcon: Icon(Icons.lock),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  ),
                ),
              ),
              const SizedBox(height: 30),
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
                    onPressed: () {
                      String email = authController.emailController.text;
                      String password = authController.passwordController.text;
                      String username = authController.nameController.text;

                      if (email.isNotEmpty &&
                          password.isNotEmpty &&
                          username.isNotEmpty) {
                        authController.registerUser(email, password, username);
                      } else {
                        Get.snackbar(
                          'Error',
                          'All fields are required',
                          backgroundColor: Colors.red,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .transparent, // Make button background transparent
                      shadowColor: Colors.transparent, // Remove button shadow
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
