import 'package:emberald/controller/signin.controller.dart';
import 'package:emberald/utils/appcolors.dart';
import 'package:emberald/widgets/custombutton.dart';
import 'package:emberald/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final signincontroller = Get.find<Signincontroller>();

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
              Text("Welcome Back", style: textTheme.displayLarge),
              SizedBox(height: size.height * 0.01),
              Text(
                textAlign: TextAlign.center,
                "Login to your account",
                style: textTheme.bodyMedium,
              ),
              SizedBox(height: size.height * 0.1),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    DynamicTextFormField(
                      controller: signincontroller.emailcontroller,
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
                        if (signincontroller.emailError.value.isNotEmpty) {
                          return signincontroller.emailError.value;
                        }

                        return null;
                      },
                    ),

                    DynamicTextFormField(
                      controller: signincontroller.passwordcontroller,
                      labelText: "Password",
                      hintText: "Enter your password",
                      prefixIcon: Icons.lock_outline_rounded,
                      ispassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a password";
                        }
                        if (value.length < 8) {
                          return "Password must be at least 8 characters";
                        }
                        //checking from controller
                        if (signincontroller.passwordError.value.isNotEmpty) {
                          return signincontroller.passwordError.value;
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forget Password?",
                    style: textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.1),

              Obx(() {
                return Custombutton.custom(
                  context: context,
                  text: "Signin",
                  isLoading: signincontroller.isLoading.value,
                  onPressed: () async {
                    print("button clicked");
                    if (formkey.currentState!.validate()) {
                      bool isSuccess = await signincontroller.signin();

                      if (isSuccess && context.mounted) {
                        context.go('/home');
                      } else {
                        formkey.currentState!.validate();
                      }
                    }
                  },
                );
              }),

              //or continue with
              SizedBox(height: size.height * 0.02),
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
                  Custombutton.imageboxes(
                    context: context,
                    image: "assets/images/google.png",
                  ),
                  Custombutton.imageboxes(
                    context: context,
                    image: "assets/images/apple.png",
                  ),
                  Custombutton.imageboxes(
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
                  Text("Don't have an account?", style: textTheme.labelMedium),
                  SizedBox(height: size.height * 0.02),
                  InkWell(
                    onTap: () {
                      context.push('/signup');
                    },
                    child: Text(
                      " Sign Up",
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
