import 'package:donation_system/Pages/MainPage.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Widgets/BackButtonRegistration.dart';
import 'package:donation_system/Widgets/Button.dart';
import 'package:donation_system/Widgets/FacebookLogin.dart';
import 'package:donation_system/Widgets/GoogleLogin.dart';
import 'package:donation_system/Widgets/ShowAlertDialogForgotPassword.dart';
import 'package:donation_system/Widgets/TextField.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'RegistrationPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            primary: false,
            children: <Widget>[
              
              Row(
                children: [
                  BackButtonRegistration(
                    onTap: (){
                      Navigator.pop(context);
                    }
                  )
                ],
              ),

              SizedBox(
                height: 15,
              ),

              Container(
                
                height: 180,
                width: 180,
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(
                height: 15,
              ),
              
              MyTextField(
                controller: null, 
                hintText: 'Email', 
                inputFormatter: null, 
                keyboardType: null
              ),

              SizedBox(
                height: 15,
              ),

              MyTextField(
                controller: null, 
                hintText: 'Password', 
                inputFormatter: null, 
                keyboardType: null
              ),

              SizedBox(
                height: 5
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => {
                      showAlertForgotPassword(context)
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle( 
                        decoration: TextDecoration.underline,
                        color: redSecondaryColor, 
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 15
              ),

              CustomRaisedButton(
                title: 'LOGIN', 
                onTap: (){
                  Navigator.pop(context);
                }
              ),

              SizedBox(
                height: 15
              ),

              FacebookLogin(
                title: 'Login with Facebook', 
                onTap: (){
                  Toast.show("Under Maintenance", context, duration: 3, gravity: Toast.BOTTOM);
                }
              ),

              SizedBox(
                height: 15
              ),

              GoogleLogin(
                title: 'Login with Google', 
                onTap: (){
                  Toast.show("Under Maintenance", context, duration: 3, gravity: Toast.BOTTOM);
                }
              ),

              SizedBox(
                height: 15
              ),
              
              Center(
                child: RichText(
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
              ),
            ],
          ),
        ),
      ), 
    );
  }
}
