import 'package:donation_system/Models/UserModel.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class LoginClass{
  TextEditingController email = new TextEditingController(text: '');
  TextEditingController password = new TextEditingController(text: '');

  UserDetailsModel userDetailsModel = UserDetailsModel("", {});
  var emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  String message = "";

  dynamic validate(String isFor){
    bool isValid = false;

    if (email.text.trim() != '' && password.text.trim() != '' ) {
      
     if (emailRegExp.hasMatch(email.text.trim())) {
          isValid = true;
        
      }
      else {
        message = "Enter a valid email address.";
      }
    }
    else {
        message = "Fields are all required so please kindly check.";
    }
    return isFor == "fields" ? isValid : isFor == "message" ? message : "error";
  }

  Future<bool> userSignUp(BuildContext context) async {
    bool isLoggedin = false;

    try {
      await auth.signInWithEmailAndPassword(email: email.text.trim(), password: password.text.trim()).then((userCreds) async { // This will create an auth for the user
        
        var userRef = db.collection("UserDetails").doc(userCreds.user.uid);

        await userRef.get().then((doc) {
          myUserDetails.value = UserDetailsModel(doc.id, doc.data());
          isLoggedin = true;
        });

      }).catchError((onError){
        print(onError.message);
        Toast.show(onError.message, context, duration: 4, gravity: Toast.BOTTOM);
      });
    } catch (e) {
      Toast.show("Something went wrong happen.", context, duration: 4, gravity: Toast.BOTTOM);
    }
    return isLoggedin;
  }

}
