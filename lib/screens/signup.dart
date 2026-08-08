import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.04,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: const FaIcon(FontAwesomeIcons.chevronLeft, size: 25),
            onPressed: () => context.pop(),
          ),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
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
          ],
        ),
      ),
    );
  }
}
