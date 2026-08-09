import 'package:emberald/utils/appcolors.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            //header column
            Container(
              height: size.height * 0.2,
              width: double.infinity,
              color: Colors.blue,

              child: Column(children: [

        ],),
            ),
          ],
        ),
      ),
    );
  }
}
