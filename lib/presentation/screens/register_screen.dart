import 'package:flutter/material.dart';
import 'package:vending_app_poc/bloc/registration_bloc.dart/bloc/registration_form_bloc.dart';
import '../widgets/registration_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  void initState() {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      Navigator.pushNamed(context, "/link",
          arguments: dynamicLinkData.link.toString());
    }).onError((error) {
      print(error);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => RegistrationFormBloc(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 20),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        size: 25,
                      ),
                      Text(
                        " Lagos, Nigeria. ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    "Create an account to continue!",
                    style: TextStyle(
                        color: Color.fromARGB(255, 137, 137, 137),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: RegistrationForm(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
