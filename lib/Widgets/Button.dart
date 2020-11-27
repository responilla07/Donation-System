import 'package:donation_system/Variables/color.dart';
import 'package:flutter/material.dart';

class CustomRaisedButton extends StatefulWidget {
  const CustomRaisedButton({
    @required this.title,
    @required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  _CustomRaisedButtonState createState() => _CustomRaisedButtonState();
}

class _CustomRaisedButtonState extends State<CustomRaisedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      child: RaisedButton(
        onPressed: widget.onTap,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0)
        ),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                 redSecondaryColor, // TODO check kung ayus na
                 redSecondaryColorLight // TODO check kung ayus na
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            // constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}