import 'package:flutter/material.dart';

class LinkScreen extends StatelessWidget {
  const LinkScreen({super.key, required this.initialLink});
  final String initialLink;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(initialLink),
      ),
    );
  }
}
