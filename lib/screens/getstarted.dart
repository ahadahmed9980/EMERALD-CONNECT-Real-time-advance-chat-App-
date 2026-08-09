import 'package:emberald/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Getstarted extends StatelessWidget {
  const Getstarted({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SizedBox(height: size.height * 0.23),
              Image.asset(
                "assets/images/mainlogo.png",
                height: size.height * 0.25,
              ),
              Text("Emerald Connect", style: textTheme.displayLarge),
              SizedBox(height: size.height * 0.01),
              Text(
                textAlign: TextAlign.center,
                "Stay connected, wherever\nyou are. Chat, share and\n connect with people easily ",
                style: textTheme.bodyMedium,
              ),
              Spacer(),
              Custombutton.custom(
                context: context,
                text: 'Get Started',
                onPressed: () {
                  context.push('/signup');
                },
                isLoading: false,
              ),

              SizedBox(height: size.height * 0.02),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: textTheme.labelMedium,
                  ),
                  SizedBox(height: size.height * 0.01),
                  InkWell(
                    onTap: () {
                      context.push('/login');
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
              SizedBox(height: size.height * 0.08),
            ],
          ),
        ),
      ),
    );
  }
}
