import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void login() async {
    print('Email: ${emailController.text}');
    print('Password: ${passwordController.text}');
    // Get.offNamed('/dashboard');
    try {
      final response = await http.post(
        Uri.parse('https://dummyjson.com/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': emailController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        // const SizedBox(height: 16);
        Get.snackbar('Login Berhasil', 'Selamat Datang!',
            backgroundColor: const Color.fromARGB(255, 54, 244, 92),
            snackPosition: SnackPosition.BOTTOM);
        Get.offNamed('/dashboard');
      } else {
        // const SizedBox(height: 16);
        final responseData = jsonDecode(response.body);
        Get.snackbar('Login Gagal', responseData['message'],
            
            backgroundColor: const Color.fromARGB(255, 244, 216, 54),
            snackPosition: SnackPosition.BOTTOM);
            
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred. Please try again.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
  void goToRegister() {
    Get.toNamed('/register');
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
} 

// class LoginController 