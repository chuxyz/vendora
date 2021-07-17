import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.onChanged,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.obscureText,
    this.errorText,
    this.textInputAction,
    Key? key,
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final bool? obscureText;
  final String? errorText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: TextFormField(
        onChanged: this.onChanged,
        textInputAction: textInputAction ?? null,
        focusNode: this.focusNode,
        obscureText: this.obscureText ?? false,
        decoration: InputDecoration(
          hintText: this.hintText,
          labelText: this.labelText,
          errorText: this.errorText ?? null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black38,
              width: 1.5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueAccent,
              width: 2.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}
