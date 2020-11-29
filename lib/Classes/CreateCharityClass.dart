

import 'dart:io';

import 'package:donation_system/Methods/CreateSearchKey.dart';
import 'package:donation_system/Models/CharityModel.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
import 'package:uuid/uuid.dart';

class CreateCharityClass{

  bool isProcessing = false;
  var batch = db.batch();

  String date = "";
  String benefitId = "";
  TextEditingController itemName = new TextEditingController(text: '');
  TextEditingController contact = new TextEditingController(text: '');
  String state = "State";
  String province = "Province";
  TextEditingController street = new TextEditingController(text: '');
  TextEditingController description = new TextEditingController(text: '');

  List<String> convert = [];

  List<String> imageUrl = [];

  CharityModel charityModel = CharityModel("",{});

  Future<String> getPhoto() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    return  pickedFile.path;
  }

  String message = "";

  dynamic validate(String isFor){
    bool isValid = false;

    if (itemName.text.trim() != '' && contact.text.trim() != ''
    &&  state != '' && province != '' && date != '' &&
    street.text.trim() != '' && description.text.trim() != ''
    &&  imageUrl.length != 0) {
      
      isValid = true;
    }
    else {
        message = "Fields are all required and a minimum of one picture.";
    }
    return isFor == "fields" ? isValid : isFor == "message" ? message : "error";
  }

  Future<bool> addItem(BuildContext context) async{
    bool isRegistered = false;
    var uuid = Uuid();
    charityModel.founderID = myUserDetails.value.id;
    charityModel.name = itemName.text.trim();
    charityModel.contact = contact.text.trim();
    charityModel.location.province = province.trim();
    charityModel.location.state = state.trim();
    charityModel.location.street = street.text.trim();
    charityModel.description = description.text.trim();
    charityModel.dateFounded = date;
    charityModel.searchKey = SearchKey().createSearchKey(charityModel.name = itemName.text.trim());

    charityModel.totalDonationGranted = 0;
    charityModel.totalNotif = 0;

    var temp = uuid.v4();
    var userRef;
    
    try{
    
      if(imageUrl.length == 3){
        charityModel.pictures.add(await uploadFiles(imageUrl[0], temp));
        charityModel.pictures.add(await uploadFiles(imageUrl[1], temp));
        charityModel.pictures.add(await uploadFiles(imageUrl[2], temp));
      }
      else if(imageUrl.length == 2){
        charityModel.pictures.add(await uploadFiles(imageUrl[0], temp));
        charityModel.pictures.add(await uploadFiles(imageUrl[1], temp));
      }
      else if(imageUrl.length == 1){
        charityModel.pictures.add(await uploadFiles(imageUrl[0], temp));
      }

      userRef = db.collection("Charities").doc(temp);

      await userRef.set(charityModel.createCharity()).then((value) async { 
        isRegistered = true;
      });
    }
    catch (e){
      Toast.show("Something went wrong happen.", context, duration: 4, gravity: Toast.BOTTOM);
    }
      
    return isRegistered;
  }
}


Future<String> uploadFiles(String imageUrl, String docName) async {
  var uuid = Uuid();
  
  String dlRef ="";

    File file = File(imageUrl);
    Reference reference = storage.ref().child('Charity_Pictures/$docName/${uuid.v4()}');
    UploadTask uploadTask = reference.putFile(file);
     await uploadTask.then((taskSnapshot) async{
        dlRef = await taskSnapshot.ref.getDownloadURL();
    });
  return dlRef;
}