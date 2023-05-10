import 'package:flutter/material.dart';
import 'package:vending_app_poc/presentation/constants/constants.dart';

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
        appBar: AppBar(
          backgroundColor: kaccentGold,
          elevation: 2,
          title: const Text(
            "Are you an Admin or User?",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                textColor: Colors.white,
                tileColor: const Color.fromARGB(255, 3, 60, 159),
                onTap: () {
                  Navigator.pushNamed(context, "/admin");
                },
                title: const Text(
                  "Administrator",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                textColor: Colors.white,
                tileColor: const Color.fromARGB(255, 3, 60, 159),
                onTap: () {
                  Navigator.pushNamed(context, "/user");
                },
                title: const Text(
                  "Customer",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
