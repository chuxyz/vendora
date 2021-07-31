import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.onChanged,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.obscureText,
    this.errorText,
    this.maxLine,
    this.keyboardType,
    this.textInputAction,
    Key? key,
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final bool? obscureText;
  final String? errorText;
  final int? maxLine;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: TextFormField(
        maxLines: maxLine ?? null,
        autocorrect: true,
        keyboardType: keyboardType ?? TextInputType.visiblePassword,
        onChanged: this.onChanged,
        textInputAction: textInputAction ?? null,
        focusNode: this.focusNode,
        obscureText: this.obscureText ?? false,
        decoration: InputDecoration(
          hintText: this.hintText,
          labelText: this.labelText,
          errorText: this.errorText ?? null,
        ),
      ),
    );
  }
}
