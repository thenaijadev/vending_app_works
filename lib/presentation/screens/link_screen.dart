import 'package:flutter/material.dart';
import 'package:vending_app_poc/bloc/bloc/stocks_bloc.dart';
import 'package:vending_app_poc/data/providers/buy_stock_transaction_provider.dart';
import 'package:vending_app_poc/presentation/constants/constants.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'dart:async';
import '../../utilities/services/launch_url.dart';

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
    BuyStockTransactionProvider().getBuyStockTransactionDetails();
    super.initState();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final stockBloc = BlocProvider.of<StocksBloc>(context);
    stockBloc.add(GetStockTransaction());
    return BlocBuilder<StocksBloc, StocksState>(
      builder: (context, state) {
        if (state is StocsIsLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is StockTransactionIsLoaded) {
          return Scaffold(
              backgroundColor: const Color.fromARGB(255, 3, 60, 159),
              appBar: AppBar(
                backgroundColor: kaccentGold,
                title: const Text(
                  "Buy Stocks",
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
                      "Make Payment",
                      style: TextStyle(color: Colors.white, fontSize: 29),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Id: ${state.getTransaction.transactionId}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${state.getTransaction.transactionName}",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "\$${state.getTransaction.transactionAmount}",
                      style: const TextStyle(color: Colors.white, fontSize: 25),
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
                                      color:
                                          const Color.fromARGB(255, 3, 60, 159),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Icon(
                                            Icons.credit_card,
                                            size: 30,
                                            color:
                                                Color.fromARGB(255, 3, 60, 159),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${state.getTransaction.merchant}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text(
                                            "1222-33434-12233-23123",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  try {
                                    await BuyStockTransactionProvider
                                        .updateTransactionStatus(state
                                            .getTransaction.transactionId!);
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            color: kaccentGold,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Center(
                                                  child: Text(
                                                      "Payment Successfull",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 25)),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Colors.green),
                                                  child: TextButton(
                                                    onPressed: () async {
                                                      final URLlauncher
                                                          launcher =
                                                          URLlauncher(
                                                              urlLink:
                                                                  "https://payment.nubiaville.com/");
                                                      await launcher.launch();
                                                    },
                                                    child: const Text(
                                                        "View History",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        });
                                  } catch (e) {
                                    print(e);
                                  }
                                  setState(() {
                                    isLoading = false;
                                  });
                                },
                                child: Center(
                                  child: Container(
                                    height: 50,
                                    width: 350,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color.fromARGB(
                                            255, 0, 80, 219)),
                                    child: Center(
                                      child: isLoading
                                          ? const CircularProgressIndicator()
                                          : const Text(
                                              "Pay Now",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
        } else {
          return const Scaffold(
            body: Center(
              child: Text("There has been an error"),
            ),
          );
        }
      },
    );
  }
}

//  Text(initialLink.substring(initialLink.indexOf("=") + 1)),
