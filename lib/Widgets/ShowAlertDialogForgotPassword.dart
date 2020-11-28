import 'package:donation_system/Variables/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:donation_system/Variables/global.dart';



import 'TextField.dart';

Future<void> resetPassword(String email) async {
        // await _firebaseAuth.sendPasswordResetEmail(email: email);
}

 



Future showAlertForgotPassword(BuildContext context) {
  String email = "";
  final myController = TextEditingController();
  return showDialog(
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: Center(
          child: Text(
            "Forgot Password",
            style: TextStyle(
              color: redSecondaryColor,
            ),
          )
        ),
        content: Container(
          height: 170,
          child: Column(
            children: [
              Text("Enter your email and we will give",style: TextStyle(fontSize: 14),),
              Text("you a password reset link",style: TextStyle(fontSize: 14),),
              SizedBox(height: 20,),
              MyTextField(
                controller: myController,
                hintText: "Email",
                keyboardType: null,
                inputFormatter: [],
              ),
              SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    onPressed: (){
                        Navigator.of(context).pop();
                    }, 
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: (){
                      auth.sendPasswordResetEmail(email: myController.text);
                    }, //TODO PILI CAtcher
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 16,
                        color: redSecondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  );
}