import 'package:donation_system/Classes/RegistrationClass.dart';
import 'package:donation_system/Widgets/BackButtonRegistration.dart';
import 'package:donation_system/Widgets/Button.dart';
import 'package:donation_system/Widgets/TextField.dart';
import 'package:flutter/material.dart';

class UserDetailsRegister extends StatefulWidget {
  const UserDetailsRegister({
    @required this.regClass,
    @required this.button,
    @required this.backButton,
  });

  final RegistrationClass regClass;
  final CustomRaisedButton button;
  final BackButtonRegistration backButton;

  @override
  _UserDetailsRegisterState createState() => _UserDetailsRegisterState();
}

class _UserDetailsRegisterState extends State<UserDetailsRegister> {
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
            'Please Enter your information',
            style: TextStyle(
              fontSize: 16,
              //TODO font style 
            ),
          ),

          SizedBox(
            height: 75,
          ),

          SizedBox(
            height: 15,
          ),

          MyTextField(
            controller: null, 
            hintText: "First Name", 
            inputFormatter: null, 
            keyboardType: null
          ),

          SizedBox(
            height: 15,
          ),

          MyTextField(
            controller: null, 
            hintText: "Last Name", 
            inputFormatter: null, 
            keyboardType: null
          ),

          SizedBox(
            height: 15,
          ),

          MyTextField(
            controller: null, 
            hintText: "Contact Number", 
            inputFormatter: null, 
            keyboardType: null
          ),

          SizedBox(
            height: 15,
          ),

          MyTextField(
            controller: null, 
            hintText: "State", 
            inputFormatter: null, 
            keyboardType: null
          ),

          SizedBox(
            height: 15,
          ),

          MyTextField(
            controller: null, 
            hintText: "Street", 
            inputFormatter: null, 
            keyboardType: null
          ),

          SizedBox(
            height: 25,
          ),

          widget.button
          
        ],

      ),
    );
  }
}


