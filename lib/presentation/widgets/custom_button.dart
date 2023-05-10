import 'package:flutter/material.dart';
import 'package:vending_app_poc/presentation/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, this.onPressed});
  final String label;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: kaccentGold,
      elevation: 2,
      focusElevation: 3,
      onPressed: onPressed,
      child: Text(
        label,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
