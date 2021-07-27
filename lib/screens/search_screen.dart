import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendora/bloc/vendor_search_bloc/vendor_search_bloc.dart';
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

class VendorSearchDelegate extends SearchDelegate<Vendor> {
  final Bloc<VendorSearchEvents, VendorSearchStates> bloc;
  final String searchFieldLabel;
  final BuildContext context;
  VendorSearchDelegate({required this.bloc, required this.context})
      : this.searchFieldLabel = 'Search for vendors',
        super();

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
          //backgroundColor: kThemeColor,
          ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 1.0,
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 1.0,
            color: Colors.black,
          ),
        ),
      ),
      // inputDecorationTheme: InputDecorationTheme(
      //   fillColor: Colors.white,
      //   filled: true,
      // ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return <Widget>[
      // if (query.isEmpty)
      //   IconButton(
      //     onPressed: () {},
      //     icon: Icon(Icons.mic),
      //   )
      // else
      //   IconButton(
      //     onPressed: () {
      //       query = '';
      //       showSuggestions(context);
      //     },
      //     icon: Icon(Icons.clear),
      //   )
    ];
    //throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          this.close(context, Vendor(query));
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
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

  @override
  Widget buildPrefix(BuildContext context) {
    return IconButton(
      onPressed: () {
        this.close(context, Vendor(query));
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildSuffix(BuildContext context) {
    return (query.isEmpty)
        ? IconButton(
            onPressed: () {},
            icon: Icon(Icons.tune),
          )
        : IconButton(
            onPressed: () {
              query = '';
              showSuggestions(context);
            },
            icon: Icon(Icons.clear),
          );
  }
}
