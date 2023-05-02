import 'package:flutter/material.dart';
import "./custom_button.dart";
import '../../../utilities/services/launch_url.dart';

class ButtonColumn extends StatelessWidget {
  const ButtonColumn({
    super.key,
    required this.link_1,
    required this.link_2,
    required this.link_3,
  });

  final String link_1;
  final String link_2;
  final String link_3;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            "What action do you want to take",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        CustomButton(
          label: "Buy Stock",
          onPressed: () async {
            final URLlauncher launcher = URLlauncher(urlLink: link_1);
            await launcher.launch();
          },
        ),
        const SizedBox(
          height: 30,
        ),
        CustomButton(
          label: "Request For Credit",
          onPressed: () async {
            final URLlauncher launcher = URLlauncher(urlLink: link_2);
            await launcher.launch();
          },
        ),
        const SizedBox(
          height: 30,
        ),
        CustomButton(
          label: "Agent Services",
          onPressed: () async {
            final URLlauncher launcher = URLlauncher(urlLink: link_3);
            await launcher.launch();
          },
        )
      ],
    );
  }
}
