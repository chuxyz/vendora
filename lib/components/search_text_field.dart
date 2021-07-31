import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    this.onTap,
    this.readOnly,
    this.autoFocus,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNode,
    required this.hintText,
  }) : super(key: key);

  final void Function()? onTap;
  final bool? readOnly;
  final bool? autoFocus;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      focusNode: focusNode ?? null,
      readOnly: readOnly ?? false,
      autofocus: autoFocus ?? false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        prefixIcon: prefixIcon ?? null,
        suffixIcon: suffixIcon ?? null,
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
