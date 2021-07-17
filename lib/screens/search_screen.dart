import 'package:flutter/material.dart';
import 'package:vendora/utilities/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List vendorsList;

  _SearchScreenState()
      : vendorsList = [],
        super();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class VendorSearchDelegate extends SearchDelegate<String> {
  VendorSearchDelegate() : super();

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return ThemeData(
      primaryColor: kThemeColor,
    );
    //return super.appBarTheme(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return <Widget>[];
    //throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return Container();
    //throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
    //throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
    //throw UnimplementedError();
  }
}
