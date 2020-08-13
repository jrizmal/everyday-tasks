import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double sidePadding;

  CustomButton({this.onPressed, this.text, this.sidePadding: 50});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
      onPressed: onPressed,
      color: Colors.orange[600],
      padding: EdgeInsets.fromLTRB(sidePadding, 16, sidePadding, 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    );
  }
}
