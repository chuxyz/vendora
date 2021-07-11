import 'package:flutter/material.dart';
import 'package:vendora/components/foot_navigation_bar.dart';
import 'package:vendora/components/search_bar.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  static String routeID = 'search_result_screen';

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new SearchBar(),
      body: Container(),
    );
  }
}
