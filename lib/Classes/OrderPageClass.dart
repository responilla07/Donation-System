import 'package:cached_network_image/cached_network_image.dart';
import 'package:donation_system/Formatter/number.dart';
import 'package:donation_system/Models/ItemModel.dart';
import 'package:donation_system/Models/OrdersModel.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:donation_system/Variables/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:toast/toast.dart';
import 'package:uuid/uuid.dart';

class OrderPageClass {
  bool isProcessing = false;
  String state = "State*";
  String province = "Province*";
  String countryValue;
  String paymentOption;

  MaskedTextController cardController = MaskedTextController(mask: '0000000000000000');
  MaskedTextController monthController = MaskedTextController(mask: '00');
  MaskedTextController yearController = MaskedTextController(mask: '0000');
  MaskedTextController cvcController = MaskedTextController(mask: '000');

  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController postal = TextEditingController();

  OrdersModel ordersModel = OrdersModel('', {});
  
  String message = '';
  
  Card itemCard(BuildContext context, ItemModel itemModel) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        width: PhoneSize(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Amount to pay: " + "₱ " + numberDecimalComma(itemModel.price),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "Transaction Fee: " + "₱ 20.00",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "Delivery Fee: " + "₱ 75.00",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "Total amount to pay: " + "₱ " + numberDecimalComma(itemModel.price + 20 + 75),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: redSecondaryColorDark
              ),
            ),

          ],
        ),
      ),
    );
  }

  var emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  dynamic checkFields(String isFor){
    bool isValid = false;

      if(fullname.text.trim() != '' && email.text.trim() != '' && phone.text.trim() != '' &&
        address1.text.trim() != '' && address2.text.trim() != '' && state != '' && province != '' &&
        postal.text.trim() != '' && countryValue != ''){
        
        if(emailRegExp.hasMatch(email.text.trim())){
          if(paymentOption == "card" && cardController.text.trim() != "" && 
          monthController.text.trim() != '' && yearController.text.trim() != ''){
            isValid = true;
          }
          else if(paymentOption == "Cash on Delivery"){
            isValid = true;
          }
          else{
            message = "Please choose a payment method and fill up the fields required";
          }
        }
        else{
          message = "Enter a valid email.";
        }

      }
      else{
        message = "All Fields are required";
      }
    return isFor == "fields" ? isValid : isFor == "message" ? message : "error";
  }

  Future<bool> createOrder(BuildContext context, ItemModel itemModel) async{
    bool success = false;
    ordersModel.fullname = fullname.text.trim();
    ordersModel.email = email.text.trim();
    ordersModel.phone = phone.text.trim();
    ordersModel.address1 = address1.text.trim();
    ordersModel.address2 = address2.text.trim();
    ordersModel.postal = postal.text.trim();
    ordersModel.country = countryValue.toString();
    ordersModel.state = state;
    ordersModel.province = province;
    
    if(paymentOption == "card"){
      ordersModel.cardNumber = cardController.text.trim().substring(0,12);
      ordersModel.expMonth = monthController.text.trim();
      ordersModel.expYear = yearController.text.trim();
    }

    ordersModel.itemID = itemModel.id;
    ordersModel.status = "onGoing";
    ordersModel.price = itemModel.price;
    ordersModel.transactionFee = 20;
    ordersModel.deliveryFee = 75;
    ordersModel.totalPrice = itemModel.price + 20 + 75;
    var uuid = Uuid();
    var temp = uuid.v4();
    try{
      var userRef = db.collection("Orders").doc(temp);

      await userRef.set(ordersModel.createOrder()).then((value) async { 
        success = true;
      });
    }
    catch (e){
      Toast.show("Something went wrong happen.", context, duration: 4, gravity: Toast.BOTTOM);
    }
    
    return success;
  }
}