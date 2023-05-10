import 'package:flutter/material.dart';
import 'package:vending_app_poc/bloc/uri_bloc.dart';
import 'package:vending_app_poc/presentation/constants/constants.dart';
import '../widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/buttom_sheet_widget.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'dart:developer';
import '../../utilities/services/dynamic_link_provider.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key, required this.title});

  final String title;

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  String dynamicLink = "";
  @override
  void initState() {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      log(dynamicLinkData.link.path);
    }).onError((error) {
      // Handle errors
    });
    super.initState();
  }

  String link = "";
  @override
  Widget build(BuildContext context) {
    String? urlString;
    String parameter = "";
    String initialLink = "";
    final uriBlock = BlocProvider.of<UriBloc>(context);

    void showSheet(int index, BuildContext context) {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<UriBloc, UriState>(
            builder: (context, state) {
              if (state is UriInitial) {
                return ButtomSheetWidget(
                    onChanged: (value) {
                      urlString = value;
                    },
                    onPressed: () {
                      if (urlString!.isNotEmpty) {
                        uriBlock.add(ChangeLinkEvent(
                          urlString!,
                          index,
                          state.getLinks,
                        ));
                      }
                      Navigator.of(context).pop();
                    },
                    urlLink: state.getLinks[index]);
              } else if (state is NewUriState) {
                return ButtomSheetWidget(
                    onChanged: (value) {
                      urlString = value;
                    },
                    onPressed: () {
                      if (urlString!.isNotEmpty) {
                        uriBlock.add(ChangeLinkEvent(
                          urlString!,
                          index,
                          state.getLinks,
                        ));
                        Navigator.of(context).pop();
                      }
                    },
                    urlLink: state.getLinks[index]);
              } else {
                return Container();
              }
            },
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: kaccentGold,
            centerTitle: true,
            title: Text(
              widget.title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Change action links.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Choose a button to change it's action link",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    textColor: Colors.white,
                    tileColor: const Color.fromARGB(255, 3, 60, 159),
                    onTap: () async {
                      showSheet(0, context);
                    },
                    title: const Text(
                      "Buy Stock",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    textColor: Colors.white,
                    tileColor: const Color.fromARGB(255, 3, 60, 159),
                    onTap: () async {
                      showSheet(1, context);
                    },
                    title: const Text(
                      "Request For Credit",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    textColor: Colors.white,
                    tileColor: const Color.fromARGB(255, 3, 60, 159),
                    onTap: () async {
                      showSheet(1, context);
                    },
                    title: const Text(
                      "Agent Services",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Create dynamic link",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    parameter = value;
                  },
                ),
                CustomButton(
                  label: "Create",
                  onPressed: () async {
                    displayParameters(parameter);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SelectableText(
                  link,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  cursorColor: Colors.red,
                  showCursor: true,
                )
              ],
            ),
          )),
    );
  }

  void displayParameters(String parameter) {
    DynamicLinksProvider.createLinks(parameter).then((value) {
      setState(() {
        link = value;
      });
      log("This is the link: $link");
    });
  }
}
