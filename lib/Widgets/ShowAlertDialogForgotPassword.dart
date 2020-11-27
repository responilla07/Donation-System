import 'package:donation_system/Variables/color.dart';
import 'package:flutter/material.dart';


import 'TextField.dart';

Future showAlertForgotPassword(BuildContext context) {
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
                controller: null,
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
                    onPressed: (){}, 
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