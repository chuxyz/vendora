import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vendora/components/theme_data.dart';
import 'package:vendora/screens/register_vendor_screen.dart';
import 'package:vendora/screens/settings_screen.dart';
import 'package:vendora/screens/register_screen.dart';
import 'package:vendora/screens/start_screen.dart';
import 'package:vendora/screens/search_result_screen.dart';
import 'package:vendora/utilities/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await FirebaseAuth.instance.useAuthEmulator('127.0.0.1', 9101);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext _) {
    return MaterialApp(
      title: '$kAppName', // App name
      theme: lightTheme,
      initialRoute: RegisterVendorScreen.routeID,
      // Define routes
      routes: {
        StartScreen.routeID: (context) => StartScreen(),
        SearchResultScreen.routeID: (context) => SearchResultScreen(),
        RegisterScreen.routeID: (context) => RegisterScreen(),
        SettingsScreen.routeID: (context) => SettingsScreen(),
        RegisterVendorScreen.routeID: (context) => RegisterVendorScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
