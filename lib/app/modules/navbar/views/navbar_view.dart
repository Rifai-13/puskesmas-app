import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/navbar_controller.dart';

class NavbarView extends StatelessWidget {
  const NavbarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavbarController controller = Get.put(NavbarController());

    return Obx(() {
      return BottomNavigationBar(
        backgroundColor: Colors.green, // Background navbar menjadi hijau
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [Colors.orange, Colors.purple], // Gradasi warna kucing
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: const Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [Colors.orange, Colors.purple], // Gradasi warna kucing
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: const Icon(Icons.person),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: controller.currentIndex.value,
        selectedItemColor: Colors.white, // Warna ikon yang dipilih
        unselectedItemColor: Colors.grey, // Warna ikon yang tidak dipilih
        onTap: (index) {
          controller.currentIndex.value = index; // Update currentIndex
          switch (index) {
            case 0:
              Get.off(() => HomeView());
              break;
            case 1:
              Get.off(() => ProfileView());
              break;
          }
        },
      );
    });
  }
}
