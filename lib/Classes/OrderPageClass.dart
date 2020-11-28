import 'package:cached_network_image/cached_network_image.dart';
import 'package:donation_system/Formatter/number.dart';
import 'package:donation_system/Models/ItemModel.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class OrderPageClass {
  String state = "State";
  String province = "Province";
  String countryValue;

  final MaskedTextController cardController = MaskedTextController(mask: '0000000000000000');
  final MaskedTextController monthController = MaskedTextController(mask: '00');
  final MaskedTextController yearController = MaskedTextController(mask: '0000');
  final MaskedTextController cvcController = MaskedTextController(mask: '000');
  
  Card itemCard(BuildContext context, ItemModel itemModel) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: PhoneSize(context).width,
        child: Stack(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: redSecondaryColorLight,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: itemModel.itemPhoto.length > 0 ? itemModel.itemPhoto[0] : '',
                  fit: BoxFit.cover,
                  placeholder: (context, value){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(redSecondaryColorLight)),
                      ],
                    );
                  },
                ),
              ),
            ),
            Positioned(
              left: 130,
              right: 10,
              bottom: 15,
              top: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemModel.name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    itemModel.location.state + ', ' + itemModel.location.province,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text( 
                    "₱ " + numberDecimalComma(itemModel.price),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: bluePrimaryColorDark,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, size: 15, color: itemModel.ratings >= 1 ? Colors.yellow : Colors.grey),
                      Icon(Icons.star, size: 15, color: itemModel.ratings >= 2 ? Colors.yellow : Colors.grey),
                      Icon(Icons.star, size: 15, color: itemModel.ratings >= 3 ? Colors.yellow : Colors.grey),
                      Icon(Icons.star, size: 15, color: itemModel.ratings >= 4 ? Colors.yellow : Colors.grey),
                      Icon(Icons.star, size: 15, color: itemModel.ratings >= 5 ? Colors.yellow : Colors.grey),
                      SizedBox(width: 5,),
                      Text(
                        '('+ totalCount(itemModel.totalReviewer) + ')',
                        style: TextStyle(
                          fontSize: 12
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}