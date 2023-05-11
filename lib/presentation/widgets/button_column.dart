import 'package:flutter/material.dart';
import 'package:vending_app_poc/presentation/constants/constants.dart';
import 'package:vending_app_poc/presentation/widgets/path_choice.dart';
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AuthButtons(
            onPressed: () async {
              final URLlauncher launcher = URLlauncher(urlLink: link_1);
              await launcher.launch();
            },
            label: "Buy Stock",
            color: Colors.white,
            backgroundColor: kaccentGold),
        AuthButtons(
            onPressed: () async {
              final URLlauncher launcher = URLlauncher(urlLink: link_2);
              await launcher.launch();
            },
            label: "Request For Credit",
            color: Colors.white,
            backgroundColor: kaccentGold),
        AuthButtons(
            onPressed: () async {
              final URLlauncher launcher = URLlauncher(urlLink: link_3);
              await launcher.launch();
            },
            label: "Agent Service",
            color: Colors.white,
            backgroundColor: kaccentGold),
        AuthButtons(
            onPressed: () async {
              await LaunchApp.isAppInstalled(
                  androidPackageName: 'team.opay.pay.merchant.service');
              await LaunchApp.openApp(
                androidPackageName: 'team.opay.pay.merchant.service',
              );
            },
            label: "Launch Opay",
            color: Colors.white,
            backgroundColor: kaccentGold),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
