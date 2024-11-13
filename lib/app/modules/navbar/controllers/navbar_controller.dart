import 'package:get/get.dart';

class NavbarController extends GetxController {
  //TODO: Implement NavbarController

  var currentIndex = 0.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
