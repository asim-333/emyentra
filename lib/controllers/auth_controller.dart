import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/firebase_service.dart';
import '../routes/app_routes.dart';

class AuthController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();
  final isLoading = false.obs;
  final obscurePassword = true.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> signUp() async {
    if (nameController.text.trim().isEmpty || emailController.text.trim().isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    try {
      isLoading.value = true;
      final result = await _firebaseService.signUp(email: emailController.text.trim(), password: passwordController.text, name: nameController.text.trim());
      if (result['success']) {
        Get.snackbar('Success', result['message'], snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.snackbar('Error', result['message'], snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login() async {
    if (emailController.text.trim().isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    try {
      isLoading.value = true;
      final result = await _firebaseService.login(email: emailController.text.trim(), password: passwordController.text);
      if (result['success']) {
        Get.snackbar('Success', result['message'], snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.snackbar('Error', result['message'], snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await _firebaseService.logout();
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.onClose();
  }
}
