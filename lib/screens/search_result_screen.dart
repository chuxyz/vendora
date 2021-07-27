import 'package:flutter/material.dart';
import 'package:vendora/bloc/login_modal_bloc/modal_bloc.dart';
import 'package:vendora/components/foot_navigation_bar.dart';
import 'package:vendora/components/search_bar.dart';

class SearchResultScreen extends StatelessWidget {
  SearchResultScreen({Key? key}) : super(key: key);

  static String routeID = 'search_result_screen';

  @override
  Widget build(BuildContext context) {
    Map<String, int> _args =
        ModalRoute.of(context)!.settings.arguments as Map<String, int>;
    return Scaffold(
      appBar: SearchBar(),
      body: Container(
        child: Text(_args['vendorCategoryId'].toString()),
      ),
      bottomNavigationBar: FootNavigationBar(
        navBarIndex: 0,
        bloc: ModalBloc(),
      ),
    );
  }
}
