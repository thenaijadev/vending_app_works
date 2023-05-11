import 'package:flutter/material.dart';
import 'package:vending_app_poc/presentation/widgets/path_choice.dart';
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
        backgroundColor: kaccentGold,
        appBar: AppBar(
          backgroundColor: kaccentGold,
          centerTitle: true,
          title: Text(
            widget.title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Container(
          height: double.infinity,
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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Change action links.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Choose a button to change it's action link",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                AuthButtons(
                    onPressed: () async {
                      showSheet(0, context);
                    },
                    label: "Buy Stock",
                    color: Colors.white,
                    backgroundColor: kaccentGold),
                const SizedBox(
                  height: 60,
                ),
                AuthButtons(
                    onPressed: () async {
                      showSheet(1, context);
                    },
                    label: "Request For Credit",
                    color: Colors.white,
                    backgroundColor: kaccentGold),
                const SizedBox(
                  height: 60,
                ),
                AuthButtons(
                    onPressed: () async {
                      showSheet(2, context);
                    },
                    label: "Agent Services",
                    color: Colors.white,
                    backgroundColor: kaccentGold),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Create dynamic link",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      focusColor: kaccentGold,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      parameter = value;
                    },
                  ),
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
          ),
        ),
      ),
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
