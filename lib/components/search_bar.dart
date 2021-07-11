import 'package:flutter/material.dart';
import 'package:vendora/utilities/constants.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(55.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 20.0,
      title: Container(
        height: 45.0,
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 5, left: 15),
            suffixIcon: IconButton(
              color: kThemeColor,
              icon: Icon(Icons.search),
              onPressed: () {
                print('Searching...');
              },
            ),
            prefixIcon: BackButton(
              color: kThemeColor,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
    );
  }
}
