import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vendora/utilities/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static String routeID = 'settings_screen';

  @override
  Widget build(BuildContext context) {
    return SettingsScreenView();
  }
}

class SettingsScreenView extends StatefulWidget {
  const SettingsScreenView({Key? key}) : super(key: key);

  @override
  _SettingsScreenViewState createState() => _SettingsScreenViewState();
}

class _SettingsScreenViewState extends State<SettingsScreenView> {
  final TextStyle headerStyle = TextStyle(
    color: Colors.grey.shade800,
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
  );
  final User user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: null,
        title: Text(
          'Account Settings',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "ACCOUNT",
              style: headerStyle,
            ),
            const SizedBox(height: 10.0),
            Card(
              elevation: 0.5,
              margin: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 0,
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(''),
                    ),
                    title: Text(user.displayName!),
                    onTap: () {},
                  ),
                  _buildDivider(),
                  ListTile(
                    leading: Icon(
                      Icons.edit,
                      color: kThemeColor,
                    ),
                    title: Text('Change password'),
                    onTap: () {},
                  ),
                  _buildDivider(),
                  ListTile(
                    leading: Icon(
                      Icons.edit,
                      color: kThemeColor,
                    ),
                    title: Text('Change phone number'),
                    onTap: () {},
                  ),
                  _buildDivider(),
                  ListTile(
                    leading: Icon(
                      Icons.add_business,
                      color: kThemeColor,
                    ),
                    title: Text('Become a vendor'),
                    onTap: () {},
                  ),
                  _buildDivider(),
                  ListTile(
                    leading: Icon(
                      Icons.cancel,
                      color: kThemeColor,
                    ),
                    title: Text('Delete Account'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              "NOTIFICATIONS",
              style: headerStyle,
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0,
              ),
              child: Column(
                children: <Widget>[
                  SwitchListTile(
                    activeColor: kThemeColor,
                    value: true,
                    title: Text("Received notification"),
                    onChanged: (val) {},
                  ),
                  _buildDivider(),
                  SwitchListTile(
                    activeColor: kThemeColor,
                    value: false,
                    title: Text("Received newsletter"),
                    onChanged: null,
                  ),
                  _buildDivider(),
                  SwitchListTile(
                    activeColor: kThemeColor,
                    value: true,
                    title: Text("Received Offer Notification"),
                    onChanged: (val) {},
                  ),
                  _buildDivider(),
                  SwitchListTile(
                    activeColor: kThemeColor,
                    value: true,
                    title: Text("Received App Updates"),
                    onChanged: null,
                  ),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: kThemeColor,
                ),
                title: Text("Logout"),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 60.0),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade300,
    );
  }
}
