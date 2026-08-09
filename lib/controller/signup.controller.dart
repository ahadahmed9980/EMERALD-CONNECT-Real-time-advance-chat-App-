

import 'package:emberald/model/usermodel.dart';
import 'package:emberald/utils/golbal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signupcontroller extends GetxController {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  Global golbal = Global();
  //using for signup button
  RxBool isLoading = false.obs;
  RxString emailError = ''.obs;

  @override
  void onClose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    confirmpasswordcontroller.dispose();
    super.onClose();
  }

  void clearFields() {
    namecontroller.clear();
    emailcontroller.clear();
    passwordcontroller.clear();
    confirmpasswordcontroller.clear();
    emailError.value = '';
  }

  Future<bool> signup() async {
    emailError.value = '';
    final email = emailcontroller.text.trim();
    final name = namecontroller.text.trim();
    final password = passwordcontroller.text.trim();
    final confirmPassword = confirmpasswordcontroller.text.trim();

    if (email.isEmpty || name.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return false;
    }

    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match");
      return false;
    }

    try {
      isLoading.value = true;
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      golbal.globaluid = userCredential.user!.uid;

      UserModel userModel = UserModel(name: name, email: email);

      await FirebaseFirestore.instance
          .collection("Users")
          .doc(golbal.globaluid)
          .set(userModel.toMap());
      clearFields();

      return true;
    } on FirebaseAuthException catch (err) {
      // 👈 Here is the Signup Error Handling:
      if (err.code == 'email-already-in-use') {
        emailError.value =
            "This email is already registered. Please login instead.";
      } else if (err.code == 'invalid-email') {
        emailError.value = "The email address is badly formatted.";
      } else {
        emailError.value = err.message ?? "Registration failed. Try again.";
      }
      return false;
    } catch (err) {
      Get.snackbar("Error", err.toString());
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
