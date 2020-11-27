
import 'package:flutter/material.dart';

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({
    @required this.title,
    @required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  _GoogleLoginState createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
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
                 Colors.white, 
                 Colors.white 
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            //constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                 Image.asset(
                    'assets/newGoogleLogo.png',
                    height: 20,
                    width: 35,
                ),

                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}