import 'package:flutter/material.dart';

class AuthButtons extends StatelessWidget {
  const AuthButtons({
    super.key,
    required this.onPressed,
    required this.label,
    required this.color,
    required this.backgroundColor,
  });
  final void Function() onPressed;
  final String label;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          side: const BorderSide(
            color: Colors.white,
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
