

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddItemClass{

  TextEditingController itemName = new TextEditingController(text: '');
  TextEditingController price = new TextEditingController(text: '');
  TextEditingController discount = new TextEditingController(text: '');
  TextEditingController stock = new TextEditingController(text: '');
  String state = "State";
  String province = "Province";
  TextEditingController street = new TextEditingController(text: '');
  String charitable = "Charitable";
  TextEditingController description = new TextEditingController(text: '');

  List<Widget> imageList = [];

  List<String> imageUrl = [];

  Future<String> getPhoto() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    return  pickedFile.path;
  }

  String message = "";

  dynamic validate(String isFor){
    bool isValid = false;

    if (itemName.text.trim() != '' && price.text.trim() != ''
    && discount.text.trim() != '' && state != '' && province != '' && 
    street.text.trim() != '' && description.text.trim() != ''
    && charitable != '') {
      
      isValid = true;
    }
    else {
        message = "Fields are all required so please kindly check.";
    }
    return isFor == "fields" ? isValid : isFor == "message" ? message : "error";
  }
}

// void takePicture() async {
//   //FirebaseStorage storage = FirebaseStorage.instance;
//   final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
  
//   File file = File(pickedFile.path);

//   String dlref;
  
//   Reference reference = storage.ref().child("sendedIMG_150x150");
//   UploadTask uploadTask = reference.putFile(file);
//   await uploadTask.then((taskSnapshot) async{
//       dlref = await taskSnapshot.ref.getDownloadURL();
//   });
  
//   print(dlref);
// }