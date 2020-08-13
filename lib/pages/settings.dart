import 'package:flutter/material.dart';
import 'package:tasks/components/custom_button.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(
        child: CustomButton(
          text: "Give notification",
          onPressed: () {
          },
        ),
      ),
    );
  }

  
}
