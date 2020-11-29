
import 'dart:io';

import 'package:donation_system/Models/UserModel.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

class EditProfileClass{
  bool isProcessing = false;

  TextEditingController firstName = new TextEditingController(text: myUserDetails.value.name.forename);
  TextEditingController lastName = new TextEditingController(text: myUserDetails.value.name.surname);
  TextEditingController contacts = new TextEditingController(text: myUserDetails.value.contact);
  String state = myUserDetails.value.location.state;
  String province = myUserDetails.value.location.province;
  TextEditingController street = new TextEditingController(text: myUserDetails.value.location.street);
  String profileUrl =  myUserDetails.value.profileUrl;
  String profilePlaceHolder =  '';

  UserDetailsModel userDetailsModel = UserDetailsModel("", {});

  int pageNum = 1;

  String message ="";

  dynamic validate(String isFor, String path){
    bool isValid = false;

    if (firstName.text.trim() == myUserDetails.value.name.forename && lastName.text.trim() == myUserDetails.value.name.surname
    && contacts.text.trim() == myUserDetails.value.contact && state == myUserDetails.value.location.state &&
    province == myUserDetails.value.location.province && street.text.trim() == myUserDetails.value.location.street) {

      if(path != ''){
        isValid = true;
      }
      else{
        message = "Nothing to save";
      }
  
    }
    else {
      if( firstName.text.trim() != '' && lastName.text.trim() != '' && contacts.text.trim() != ''
        &&street.text.trim() != '' && state != '' && province != ''){
          isValid = true;
      }
      else{
          message = "Please fill out all the fields";
      }
    
    }
    return isFor == "fields" ? isValid : isFor == "message" ? message : "error";
  }

  Future<bool> updateUserDetails(BuildContext context,String path) async {
    bool isUpdated = false;

    

    if(path == ""){
      userDetailsModel.profileUrl = myUserDetails.value.profileUrl;
    }
    else{
      userDetailsModel.profileUrl = await savePicture(path);
    }

    userDetailsModel.email = myUserDetails.value.email;
    userDetailsModel.name.forename = firstName.text.trim();
    userDetailsModel.name.surname = lastName.text.trim();
    userDetailsModel.contact = contacts.text.trim();
    userDetailsModel.location.state = state;
    userDetailsModel.location.province = province;
    userDetailsModel.location.street = street.text.trim();
    userDetailsModel.messagingToken = myUserDetails.value.messagingToken;
    userDetailsModel.id = myUserDetails.value.id;
    
    try {
      var userRef = db.collection("UserDetails").doc(loggedUser.uid);

      await userRef.update(userDetailsModel.setUserDetails()).then((value) async { //It will create data in firestore of a user details
        isUpdated = true;
        myUserDetails.value = userDetailsModel;
      });
    } 
    catch (e) {
      Toast.show("Something went wrong happen.", context, duration: 4, gravity: Toast.BOTTOM);
    }

    
    return isUpdated;
  }

  Future<String> savePicture(String path) async {
    
    File file = File(path);

    String dlref;
    
    Reference reference = storage.ref().child("Profile_Pictures/${myUserDetails.value.id}");
    UploadTask uploadTask = reference.putFile(file);
    await uploadTask.then((taskSnapshot) async{
        dlref = await taskSnapshot.ref.getDownloadURL();
    });
    
    return dlref;
  }

  TextEditingController newPassword = new TextEditingController(text:'');
  TextEditingController confirmpassword = new TextEditingController(text:'');

  dynamic changePassword(String isFor){
    bool success = false;
    if(newPassword.text.trim() != '' &&
      confirmpassword.text.trim() != ''){
      if( newPassword.text.length >= 6){
        if(newPassword.text.trim() == confirmpassword.text.trim()){
          loggedUser.updatePassword(newPassword.text.trim());
          success = true;
        }
        else{
          print(newPassword.text.trim());
          print(confirmpassword.text.trim());
          message = "New and Confirm Password do not match";  
        }
      }
      else{
        message = "New passworkd should be longer then 6 characters";
      }
    }
    else{
      message = "All fields are required";
    }
    return isFor == "fields" ? success : isFor == "message" ? message : "error";
  }
  
}