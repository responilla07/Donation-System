

import 'dart:io';

import 'package:donation_system/Methods/CreateSearchKey.dart';
import 'package:donation_system/Models/ItemModel.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
import 'package:uuid/uuid.dart';

class AddItemClass{

  var batch = db.batch();

  String benefitId = "";
  TextEditingController itemName = new TextEditingController(text: '');
  TextEditingController price = new TextEditingController(text: '');
  TextEditingController discount = new TextEditingController(text: '');
  TextEditingController stock = new TextEditingController(text: '');
  String state = "State";
  String province = "Province";
  TextEditingController street = new TextEditingController(text: '');
  String charitable = "Charitable";
  TextEditingController description = new TextEditingController(text: '');

  List<String> convert = [];

  List<String> imageUrl = [];

  ItemModel itemModel = ItemModel("",{});

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
    && charitable != '' && imageUrl.length != 0) {
      
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

    

    itemModel.ownerID = myUserDetails.value.id;
    itemModel.name = itemName.text.trim();
    itemModel.price = int.parse(price.text.trim());
    itemModel.discounted = int.parse(discount.text.trim());
    itemModel.stock = int.parse(stock.text.trim());
    itemModel.location.province = province.trim();
    itemModel.location.state = state.trim();
    itemModel.location.street = street.text.trim();
    itemModel.beneficiaries = [benefitId];
    itemModel.itemDescription = description.text.trim();
    itemModel.ratings = 0;
    itemModel.isArchive = false;
    itemModel.totalReviewer = 0;
    itemModel.searchKey = SearchKey().createSearchKey(itemModel.name = itemName.text.trim());

    var temp = uuid.v4();
    var userRef;
    
    itemModel.itemPhoto.add(await uploadFiles(imageUrl[0], temp));
    


    userRef = db.collection("Products").doc(temp);

    await userRef.set(itemModel.createItem()).then((value) async { 
      isRegistered = true;
    });
      
    return isRegistered;
  }
}


Future<String> uploadFiles(String imageUrl, String docName) async {
  var uuid = Uuid();
  
  String dlRef ="";

    File file = File(imageUrl);
    Reference reference = storage.ref().child('Item_Pictures/$docName/${uuid.v4()}');
    UploadTask uploadTask = reference.putFile(file);
     await uploadTask.then((taskSnapshot) async{
        dlRef = await taskSnapshot.ref.getDownloadURL();
    });
  return dlRef;
}