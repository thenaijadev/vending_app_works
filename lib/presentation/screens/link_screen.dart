import 'package:flutter/material.dart';
import 'package:vending_app_poc/presentation/constants/constants.dart';

import 'dart:async';

class LinkScreen extends StatefulWidget {
  const LinkScreen({super.key, required this.initialLink});
  final String initialLink;

  @override
  State<LinkScreen> createState() => _LinkScreenState();
}

class _LinkScreenState extends State<LinkScreen> {
  double _height = 0;
  late Timer _timer;
  @override
  void initState() {
    _timer = Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _height = 300;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 60, 159),
        appBar: AppBar(
          backgroundColor: kaccentGold,
          title: const Text(
            "Agent Services",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Transaction Title",
                style: TextStyle(color: Colors.white, fontSize: 29),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Transaction id",
                style: TextStyle(color: Colors.white),
              ),
              const Text(
                "Trancaction Date",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "\$3000",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              const SizedBox(
                height: 200,
              ),
              Flexible(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: double.infinity,
                  height: _height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Flexible(
                    child: ListView(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 40.0, top: 20),
                          child: Text(
                            "Pay with card",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 60, 159),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 30.0,
                            horizontal: 30,
                          ),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 3, 60, 159),
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.credit_card,
                                      size: 30,
                                      color: Color.fromARGB(255, 3, 60, 159),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Adewale Martins",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "1222-33434-12233-23123",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: Container(
                              height: 70,
                              width: 350,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color.fromARGB(255, 0, 80, 219)),
                              child: const Center(
                                  child: Text(
                                "Pay Now",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

//  Text(initialLink.substring(initialLink.indexOf("=") + 1)),
