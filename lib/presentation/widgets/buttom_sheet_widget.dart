import 'package:flutter/material.dart';
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
      height: 500,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Current link: ${widget.urlLink}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    hintText: "Enter the new action link:"),
                onChanged: widget.onChanged),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomButton(
                label: "Change action link.",
                onPressed: widget.onPressed,
              ),
            )
          ],
        ),
      ),
    );
  }
}
