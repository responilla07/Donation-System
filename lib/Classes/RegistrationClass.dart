import 'package:donation_system/Models/UserModel.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class RegistrationClass{

  int pageInt = 1;

  TextEditingController email = new TextEditingController(text: '');
  TextEditingController password = new TextEditingController(text: '');
  TextEditingController confirmPassword = new TextEditingController(text: '');
  TextEditingController firstName = new TextEditingController(text: '');
  TextEditingController lastName = new TextEditingController(text: '');
  TextEditingController contactNumber = new TextEditingController(text: '');
  String state = "State";
  String province = "Province";
  TextEditingController completeAddress = new TextEditingController(text: '');
  bool isProcessing = false;


  UserDetailsModel userDetailsModel = UserDetailsModel("", {});
  var emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  String message = "";

  dynamic validate(String isFor){
    bool isValid = false;

    if (email.text.trim() != '' && password.text.trim() != '' && confirmPassword.text.trim() != '' 
      && firstName.text.trim() != '' && lastName.text.trim() != '' && contactNumber.text.trim() != ''
     &&completeAddress.text.trim() != '' && state != 'State' && province != 'Province') {
      
     if (emailRegExp.hasMatch(email.text.trim())) {
        if (password.text.trim() == confirmPassword.text.trim()) {
          isValid = true;
        } else {
          message = "Password does not match.";
        }
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

  Future<bool> processRegistration(BuildContext context) async {
    auth.signOut();
    myUserDetails.value = UserDetailsModel('', {});
    bool isRegistered = false;

    userDetailsModel.profileUrl= "";
    userDetailsModel.email = email.text.trim();
    userDetailsModel.name.forename = firstName.text.trim();
    userDetailsModel.name.surname = lastName.text.trim();
    userDetailsModel.contact = contactNumber.text.trim();
    userDetailsModel.location.state = state;
    userDetailsModel.location.province = province;
    userDetailsModel.location.street = completeAddress.text.trim();
    
    try {
      await auth.createUserWithEmailAndPassword(email: email.text.trim(), password: password.text.trim()).then((userCreds) async { // This will create an auth for the user
        await messaging.getToken().then((token) async { //This will get the messaging token of a user who is login that will be use for sending notifications, messages, and etc.

          var userRef = db.collection("UserDetails").doc(userCreds.user.uid);
          userDetailsModel.messagingToken = token;
          userDetailsModel.id = userCreds.user.uid;

          await userRef.set(userDetailsModel.setUserDetails()).then((value) async { //It will create data in firestore of a user details
            isRegistered = true;
            loggedUser = (await auth.signInWithEmailAndPassword(email: email.text.trim(), password: password.text.trim())).user;
            loggedUser = auth.currentUser;
            myUserDetails.value = userDetailsModel;
          });
        });
      }).catchError((onError){
        print(onError.message);
        Toast.show(onError.message, context, duration: 4, gravity: Toast.BOTTOM);
      });
    } catch (e) {
      Toast.show("Something went wrong happen.", context, duration: 4, gravity: Toast.BOTTOM);
    }
    return isRegistered;
  }

}