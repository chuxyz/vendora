import 'package:flutter/material.dart';
import 'package:vendora/utilities/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.buttonColor,
    required this.buttonLabel,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final Color? buttonColor;
  final void Function()?
      onPressed; // Can also use -> final VoidCallback onPressed;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 10.0,
        onPrimary: Colors.white,
        primary: this.buttonColor ?? kThemeColor,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: this.onPressed,
      child: Text('${buttonLabel}'),
    );
  }
}
