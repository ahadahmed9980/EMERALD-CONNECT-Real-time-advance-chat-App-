import 'package:emberald/controller/signup.controller.dart';
import 'package:emberald/utils/appcolors.dart';
import 'package:emberald/widgets/custombutton.dart';
import 'package:emberald/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:go_router/go_router.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final signupcontroller = Get.find<Signupcontroller>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        toolbarHeight: size.height * 0.04,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/mainlogo.png",
                height: size.height * 0.1,
              ),
              Text("Create Account", style: textTheme.displayLarge),
              SizedBox(height: size.height * 0.01),
              Text(
                textAlign: TextAlign.center,
                "Sign up to get started with\nEmerald Connect",
                style: textTheme.bodyMedium,
              ),
              SizedBox(height: size.height * 0.018),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    DynamicTextFormField(
                      controller: signupcontroller.namecontroller,
                      labelText: "Full Name",
                      hintText: "Enter your full name",
                      prefixIcon: Icons.person_2_outlined,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter your full name";
                        }

                        if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value.trim())) {
                          return "Name can only contain letters";
                        }

                        if (value.trim().length < 3) {
                          return "Name must be at least 3 characters";
                        }

                        return null;
                      },
                    ),
                    DynamicTextFormField(
                      controller: signupcontroller.emailcontroller,
                      labelText: "Email",
                      hintText: "Enter your email",
                      prefixIcon: Icons.email_outlined,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter your email";
                        }

                        if (!RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                        ).hasMatch(value.trim())) {
                          return "Please enter a valid email";
                        }

                        return null;
                      },
                    ),
                    DynamicTextFormField(
                      controller: signupcontroller.passwordcontroller,
                      labelText: "Password",
                      hintText: "Create a password",
                      prefixIcon: Icons.lock_outline_rounded,
                      ispassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a password";
                        }

                        if (value.length < 8) {
                          return "Password must be at least 8 characters";
                        }

                        if (!RegExp(r'[A-Z]').hasMatch(value)) {
                          return "Password must contain an uppercase letter";
                        }

                        if (!RegExp(r'[a-z]').hasMatch(value)) {
                          return "Password must contain a lowercase letter";
                        }

                        if (!RegExp(r'[0-9]').hasMatch(value)) {
                          return "Password must contain a number";
                        }

                        if (!RegExp(
                          r'[!@#$%^&*(),.?":{}|<>_\-]',
                        ).hasMatch(value)) {
                          return "Password must contain a special character";
                        }

                        return null;
                      },
                    ),
                    DynamicTextFormField(
                      controller: signupcontroller.confirmpasswordcontroller,
                      labelText: "Confirm Password",
                      hintText: "Confirm your password",
                      prefixIcon: Icons.lock_outline_rounded,
                      ispassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please confirm your password";
                        }

                        if (value != signupcontroller.passwordcontroller.text) {
                          return "Passwords do not match";
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Obx(() {
                return Custombutton.custom(
                  context: context,
                  text: "Sign Up",
                  isLoading: signupcontroller.isLoading.value,
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      bool isSuccess = await signupcontroller.signup();
                      if (isSuccess && context.mounted) {
                        context.go('/home');
                      }
                    }
                  },
                );
              }),
              SizedBox(height: size.height * 0.02),
              //or continue with
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 2,
                    width: size.width / 3.5,
                    color: const Color(0xFFE5E8EB),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    " or continue with ",
                    style: textTheme.bodySmall,
                  ),
                  Container(
                    height: 2,
                    width: size.width / 3.5,
                    color: const Color(0xFFE5E8EB),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  imageboxes(
                    context: context,
                    image: "assets/images/google.png",
                  ),
                  imageboxes(
                    context: context,
                    image: "assets/images/apple.png",
                  ),
                  imageboxes(
                    context: context,
                    image: "assets/images/facebook.png",
                  ),
                ],
              ),
              //or login with
              SizedBox(height: size.height * 0.02),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: textTheme.labelMedium,
                  ),
                  SizedBox(height: size.height * 0.02),
                  InkWell(
                    onTap: () {
                      print('login clicked');
                      context.push("/login");
                    },
                    child: Text(
                      " Login",
                      style: textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
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

//image boxes
Widget imageboxes({required BuildContext context, required String image}) {
  final size = MediaQuery.of(context).size;
  return Container(
    padding: const EdgeInsets.all(5.0),
    alignment: Alignment.center,
    height: size.height * 0.07,
    width: 70,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25), // 15% opacity
          blurRadius: 10,
          spreadRadius: 2,
          offset: const Offset(0, 4),
        ),
      ],
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),

    child: Image.asset(image),
  );
}
