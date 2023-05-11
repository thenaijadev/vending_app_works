import 'package:flutter/material.dart';
import 'package:vending_app_poc/presentation/constants/constants.dart';
import '../widgets/custom_button.dart';

class ButtomSheetWidget extends StatefulWidget {
  const ButtomSheetWidget(
      {super.key,
      required this.urlLink,
      required this.onPressed,
      this.onChanged});
  final String urlLink;
  final void Function()? onPressed;
  final void Function(String)? onChanged;

  @override
  State<ButtomSheetWidget> createState() => _ButtomSheetWidgetState();
}

class _ButtomSheetWidgetState extends State<ButtomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kaccentGold,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Container(
        height: 500,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Current link: ${widget.urlLink}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "Enter the new action link:"),
                  onChanged: widget.onChanged),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: CustomButton(
                  label: "Change action link.",
                  onPressed: widget.onPressed,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
