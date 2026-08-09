import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Signincontroller extends GetxController {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  RxBool isLoading = false.obs;
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  @override
  void onClose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();

    super.onClose();
  }

  void clearFields() {
    emailcontroller.clear();
    passwordcontroller.clear();
    emailError.value = '';
    passwordError.value = '';
  }

  Future<bool> signin() async {
    emailError.value = '';
    passwordError.value = '';
    final email = emailcontroller.text.trim();
    final password = passwordcontroller.text.trim();
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return false;
    }

    try {
      isLoading.value = true;
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      clearFields();
      return true;
    } on FirebaseAuthException catch (err) {
      // 2. Specific Error Codes Handle Karein Aur TextField Ke Neechay Error Set Karein
      if (err.code == 'user-not-found' || err.code == 'invalid-email') {
        emailError.value = "No user found with this email.";
      } else if (err.code == 'wrong-password' || err.code == 'invalid-credential') {
        passwordError.value = "Incorrect password or user credentials.";
      } else {
     
        emailError.value = err.message ?? "Authentication failed";
      }
      return false;
    } catch (err) {
      emailError.value = err.toString();
      return false;
    } finally {
      isLoading.value = false;
    }
  }
  }

