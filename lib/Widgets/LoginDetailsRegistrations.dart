import 'package:donation_system/Classes/RegistrationClass.dart';
import 'package:donation_system/Widgets/BackButtonRegistration.dart';
import 'package:donation_system/Widgets/Button.dart';
import 'package:donation_system/Widgets/TextField.dart';
import 'package:flutter/material.dart';

class LoginDetailsRegistrations extends StatefulWidget {
  const LoginDetailsRegistrations({
    @required this.regClass,
    @required this.button,
    @required this.backButton,
  });

  final RegistrationClass regClass;
  final CustomRaisedButton button;
  final BackButtonRegistration backButton;

  @override
  _LoginDetailsRegistrationsState createState() => _LoginDetailsRegistrationsState();
}

class _LoginDetailsRegistrationsState extends State<LoginDetailsRegistrations> {
  RegistrationClass regClass = RegistrationClass();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
        children: <Widget>[
        
        widget.backButton,

        SizedBox(
            height: 35,
        ),

          Text(
            'Registration',
            style: TextStyle(
              fontSize: 40,
              //TODO font style 
            ),
          ),

          Text(
            'Please Enter your email and password',
            style: TextStyle(
              fontSize: 16,
              //TODO font style 
            ),
          ),

          SizedBox(
            height: 75,
          ),

          MyTextField(
            controller: null, 
            hintText: "Email", 
            inputFormatter: null, 
            keyboardType: null
          ),

          SizedBox(
            height: 15,
          ),

          MyTextField(
            controller: null, 
            hintText: "Password", 
            inputFormatter: null, 
            keyboardType: null
          ),

          SizedBox(
            height: 15,
          ),

          MyTextField(
            controller: null, 
            hintText: "Confirm Password", 
            inputFormatter: null, 
            keyboardType: null
          ),

          SizedBox(
            height: 25,
          ),

          widget.button,
          
        ],

      ),
    );
  }
}
