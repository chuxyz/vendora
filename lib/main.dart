import 'package:flutter/material.dart';
import 'package:vendora/screens/register_screen.dart';
import 'package:vendora/screens/start_screen.dart';
import 'package:vendora/screens/search_result_screen.dart';
import 'package:vendora/utilities/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext _) {
    return MaterialApp(
      title: '$kAppName',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: StartScreen.routeID,
      routes: {
        StartScreen.routeID: (context) => StartScreen(),
        SearchResultScreen.routeID: (context) => SearchResultScreen(),
        RegisterScreen.routeID: (context) => RegisterScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
