import 'package:flutter/material.dart';
import 'package:vending_app_poc/bloc/uri_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vending_app_poc/presentation/constants/constants.dart';
import '../widgets/button_column.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kaccentGold,
        appBar: AppBar(
          backgroundColor: kaccentGold,
          title: const Text(
            "What action do you want to take",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Container(
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
          child: BlocBuilder<UriBloc, UriState>(
            builder: (context, state) {
              if (state is UriInitial) {
                final link_1 = state.getLinks[0];
                final link_2 = state.getLinks[1];
                final link_3 = state.getLinks[2];
                return ButtonColumn(
                  link_1: link_1,
                  link_2: link_2,
                  link_3: link_3,
                );
              } else if (state is NewUriState) {
                final link_1 = state.getLinks[0];
                final link_2 = state.getLinks[1];
                final link_3 = state.getLinks[2];
                return ButtonColumn(
                  link_1: link_1,
                  link_2: link_2,
                  link_3: link_3,
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
