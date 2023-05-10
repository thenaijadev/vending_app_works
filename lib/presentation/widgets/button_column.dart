import 'package:flutter/material.dart';
import '../../../utilities/services/launch_url.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

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
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            textColor: Colors.white,
            tileColor: const Color.fromARGB(255, 3, 60, 159),
            onTap: () async {
              final URLlauncher launcher = URLlauncher(urlLink: link_1);
              await launcher.launch();
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
              final URLlauncher launcher = URLlauncher(urlLink: link_2);
              await launcher.launch();
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
              final URLlauncher launcher = URLlauncher(urlLink: link_3);
              await launcher.launch();
            },
            title: const Text(
              "Agent Services",
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
              await LaunchApp.isAppInstalled(
                  androidPackageName: 'team.opay.pay.merchant.service');
              await LaunchApp.openApp(
                androidPackageName: 'team.opay.pay.merchant.service',
              );
            },
            title: const Text(
              "Launch Opay",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
