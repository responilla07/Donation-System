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
          SizedBox(height: 35,),
          Text(
            'Registration',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          Text(
            'Please Enter your email and password',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 65,),
          MyTextField(
            controller: widget.regClass.email, 
            hintText: "Email", 
            inputFormatter: null, 
            keyboardType: null
          ),
          SizedBox(height: 15,),
          MyTextField(
            controller: widget.regClass.password, 
            hintText: "Password", 
            inputFormatter: null, 
            keyboardType: null
          ),
          SizedBox(height: 15,),
          MyTextField(
            controller: widget.regClass.confirmPassword, 
            hintText: "Confirm Password", 
            inputFormatter: null, 
            keyboardType: null
          ),
          SizedBox( height: 25, ),
          widget.button,
        ],
      ),
    );
  }
}
