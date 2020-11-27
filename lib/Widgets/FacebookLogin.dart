import 'package:donation_system/Variables/color.dart';
import 'package:flutter/material.dart';

class FacebookLogin extends StatefulWidget {
  const FacebookLogin({
    @required this.title,
    @required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  _FacebookLoginState createState() => _FacebookLoginState();
}

class _FacebookLoginState extends State<FacebookLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      child: RaisedButton(
        elevation: 3,
        onPressed: widget.onTap,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0)
        ),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                 bluePrimaryColor,
                 bluePrimaryColor 
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            // constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                 Image.asset(
                    'assets/flogo.png',
                    height: 25,
                    width: 40,
                ),

                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}