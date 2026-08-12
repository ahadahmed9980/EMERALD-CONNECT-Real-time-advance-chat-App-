import 'package:emberald/utils/appcolors.dart';
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
                  SizedBox(height: 50),

                  Container(
                    color: Colors.blue,
                    child: Row(
                      //main row
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 32,
                              // child: Image.asset(
                              //   "assets/images/google.png",
                              //   fit: BoxFit.contain,
                              // ),
                            ),
                            Positioned(
                              top: 39,
                              right: -4,
                              child: Container(
                                height: 23,
                                width: 23,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary,
                                  border: Border.all(
                                    color: AppColors.onprimary,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //column
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ahad Ahmed",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Sure let's meet at 12.",
                                style: TextStyle(
                                  // fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //time and messages
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              '10:30 AM',
                              style: TextStyle(fontSize: 12),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Color(0xFF128C7E),
                                shape: BoxShape.circle,
                              ),
                              child: const Text(
                                '2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
