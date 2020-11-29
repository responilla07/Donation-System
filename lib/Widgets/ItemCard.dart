import 'package:cached_network_image/cached_network_image.dart';
import 'package:donation_system/Formatter/number.dart';
import 'package:donation_system/Models/ItemModel.dart';
import 'package:donation_system/SubPages/ItemDetails.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:flutter/material.dart';

import 'CacheNetworkImagePlaceholder.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
    @required this.itemModel,
  }) : super(key: key);

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
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
                    return CacheNetworkImagePlaceholder();
                  },
                ),
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.all(10),
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
                  maxLines: 1,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
