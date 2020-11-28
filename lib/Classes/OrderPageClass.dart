import 'package:cached_network_image/cached_network_image.dart';
import 'package:donation_system/Formatter/number.dart';
import 'package:donation_system/Models/ItemModel.dart';
import 'package:donation_system/Models/OrdersModel.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class OrderPageClass {
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
}