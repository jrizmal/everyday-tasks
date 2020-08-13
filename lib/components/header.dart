import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String text;
  const CustomHeader({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}
