import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    Key? key,
    required this.indicatorLabel,
  }) : super(key: key);

  final String indicatorLabel;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      children: [
        Center(
          child: SizedBox(
            child: CircularProgressIndicator(),
          ),
        ),
        Center(
            child: Text(
          this.indicatorLabel,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        )),
      ],
    );
  }
}
