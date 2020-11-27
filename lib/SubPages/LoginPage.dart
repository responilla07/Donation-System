import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'RegistrationPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black
                ),
                children: [
                  TextSpan(
                    text: 'Don\'t have an account? ',
                  ),
                  TextSpan(
                    text: 'Sign up here!',
                    style: TextStyle(decoration: TextDecoration.underline,color: redSecondaryColor,fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer().. onTap = () => Navigator.push( context, SlideRightRoute(page: RegistrationPage())),
                  ),
                ]
              ),
            ),


          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
