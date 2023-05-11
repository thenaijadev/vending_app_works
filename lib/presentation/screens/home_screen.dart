import 'package:flutter/material.dart';
import 'package:vending_app_poc/presentation/constants/constants.dart';
import 'package:vending_app_poc/presentation/widgets/path_choice.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/home_alt.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 350,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black,
                      Colors.black,
                      Colors.black,
                      Colors.black,
                    ],
                    stops: [0, 0.5, 0, 0.4, 0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Welcome",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AuthButtons(
                      backgroundColor: kaccentGold,
                      color: Colors.white,
                      label: 'User',
                      onPressed: () {
                        Navigator.pushNamed(context, "/user");
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthButtons(
                      backgroundColor: Colors.white,
                      color: kaccentGold,
                      label: 'Admin',
                      onPressed: () {
                        Navigator.pushNamed(context, "/admin");
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
