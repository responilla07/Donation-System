import 'package:cached_network_image/cached_network_image.dart';
import 'package:donation_system/Formatter/number.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
    @required this.rating,
  }) : super(key: key);

  final int rating;

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
                  imageUrl: 'http://ph-test-11.slatic.net/p/6c5cdb8ded861ff4224d5128a27a52df.jpg_340x340q80.jpg_.webp',
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
            )
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Philippines eyes portfolio of potential vaccines vs COVID-19",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text( 
                  "₱ " + "22,000",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: bluePrimaryColorDark,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, size: 15, color: rating >= 1 ? Colors.yellow : Colors.grey),
                    Icon(Icons.star, size: 15, color: rating >= 2 ? Colors.yellow : Colors.grey),
                    Icon(Icons.star, size: 15, color: rating >= 3 ? Colors.yellow : Colors.grey),
                    Icon(Icons.star, size: 15, color: rating >= 4 ? Colors.yellow : Colors.grey),
                    Icon(Icons.star, size: 15, color: rating >= 5 ? Colors.yellow : Colors.grey),
                    SizedBox(width: 5,),
                    Text(
                      '('+ totalCount(832654) + ')',
                      style: TextStyle(
                        fontSize: 12
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 10,),
                // Row(
                //   children: [
                //     // Expanded(child: Container()),
                //     // Icon(
                //     //   Icons.adb
                //     // ),
                //     // SizedBox(width: 5,),
                //     // Icon(
                //     //   Icons.chat_bubble
                //     // ),
                //     SizedBox(width: 10,),
                //     Container(
                //       alignment: Alignment.center,
                //       height: 30,
                //       decoration: BoxDecoration(
                //         color: hexColor(successColor),
                //         borderRadius: BorderRadius.all(Radius.circular(5)),
                //       ),
                //       child: Padding(
                //         padding: const EdgeInsets.only(left: 30, right: 30),
                //         child: Text(
                //           "BUY",
                //           style: TextStyle(
                //             color: white,
                //             fontWeight: FontWeight.bold
                //           ),
                //         ),
                //       ),
                //     )
                //   ],
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
