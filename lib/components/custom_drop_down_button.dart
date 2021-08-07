import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  CustomDropDownButton({
    Key? key,
    this.value,
    this.onChanged,
    required this.items,
    required this.hintText,
  }) : super(key: key);

  final String? value;
  final void Function(String?)? onChanged;
  final List<String> items;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        hint: Text(hintText),
        value: value,
        icon: const Icon(
          Icons.arrow_downward,
          color: Colors.deepPurpleAccent,
        ),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10.0, 18.0, 10.0, 18.0),
        ),
      ),
    );
  }
}
