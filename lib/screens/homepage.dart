import 'package:emberald/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController searchcontroller = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.03),
            //header column
            SizedBox(
              // height: size.height * 0.2,
              
              width: double.infinity,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //profilepic
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: size.height * 0.03,
                          child: Image.asset(
                            "assets/images/mainlogo.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Icon(Icons.notifications_none_outlined, size: 35),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  //name
                  Text("Hello, Ahad 👋", style: textTheme.headlineLarge),
                  SizedBox(height: size.height * 0.02),
                  dynamicSearchBar(
                    hinttext: "Search chats or contatcs...",
                    searchcontroller: searchcontroller,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
