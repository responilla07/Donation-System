import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:donation_system/Formatter/number.dart';
import 'package:donation_system/Methods/Style.dart';
import 'package:donation_system/Models/CharityModel.dart';
import 'package:donation_system/Models/ItemModel.dart';
import 'package:donation_system/Presentation/custom_icons_icons.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ItemDetailsClass {
  
  Column itemDetails(ItemModel itemModel, String itemDescriptionDisplay, bool isHidingClicker, String itemDescription, bool isSeeMore, VoidCallback onTap ) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(15,15,15,5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                itemModel.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
              Text(
                "₱ " + numberDecimalComma(itemModel.price),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: bluePrimaryColorDark,
                  fontSize: 18
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, size: 23, color: itemModel.ratings >= 1 ? Colors.yellow : Colors.grey),
                  Icon(Icons.star, size: 23, color: itemModel.ratings >= 2 ? Colors.yellow : Colors.grey),
                  Icon(Icons.star, size: 23, color: itemModel.ratings >= 3 ? Colors.yellow : Colors.grey),
                  Icon(Icons.star, size: 23, color: itemModel.ratings >= 4 ? Colors.yellow : Colors.grey),
                  Icon(Icons.star, size: 23, color: itemModel.ratings >= 5 ? Colors.yellow : Colors.grey),
                  SizedBox(width: 5,),
                  Text(
                    '('+ totalCount(itemModel.totalReviewer) + ')',
                    style: TextStyle(
                      fontSize: 14
                    ),
                  ),
                ],
              ),
              SizedBox( height: 5, ),
              Text(
                itemModel.location.state + ', ' + itemModel.location.province,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              itemModel.location.street == '' ? Container() 
              : Text(
                itemModel.location.street,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox( height: 10, ),
              Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: redSecondaryColorDark
                ),
              ),
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(children: <InlineSpan>[
                  TextSpan(
                    text: itemDescriptionDisplay,
                    style: TextStyle(
                      color: hexColor('393939'),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    )
                  ),

                  isHidingClicker ? TextSpan(text: '') : TextSpan(
                    recognizer: new TapGestureRecognizer()..onTap = onTap,
                    text: !isSeeMore ? " See More" : " See Less",
                    style: TextStyle(
                      color: bluePrimaryColorDark.withOpacity(0.8),
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column charitableOrgDetails(CharityModel charityModel, ItemModel itemModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(15,0,15,0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Charitable Organization',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: redSecondaryColorDark
                ),
              ),
              Text(
                charityModel.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                charityModel.location.state + ', ' + charityModel.location.province,
                style: TextStyle(
                  fontSize: 14
                ),
              ),
              charityModel.location.street == '' ? Container() 
              : Text(
                itemModel.location.street,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container itemDetailsButton({VoidCallback chatCallback, VoidCallback wishlistCallback, VoidCallback buyCallback}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/item_details_button_background.png'),
          fit: BoxFit.cover
        )
      ),
      height: 40,
      child: Row(
        children: [
          GestureDetector(
            onTap: chatCallback,
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(left: 15, right: 7.5),
              height: 40,
              child: Row(
                children: [
                  Icon(
                    CustomIcons.chat,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    "Chat",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: wishlistCallback,
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(left: 15, right: 15),
              height: 40,
              child: Row(
                children: [
                  Icon(
                    CustomIcons.wishlist,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    "Wishlist",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: buyCallback,
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.only(left: 35, right: 15),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CustomIcons.charity_cart,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      "Buy Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AspectRatio carouselBanner(ItemModel itemModel) {
    List<Widget> carouselItem = List<Widget>();
    for (var i = 0; i < itemModel.itemPhoto.length; i++) {
      carouselItem.add( CachedNetworkImage(
        imageUrl: itemModel.itemPhoto[i],
        fit: BoxFit.cover,
        placeholder: (context, value){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(redSecondaryColor)),
            ],
          );
        },
      ),);
    }
    return AspectRatio(
      aspectRatio: 16/8,
      child: Container(
        child: ClipRRect(
          child: Carousel(
            boxFit: BoxFit.cover,
            autoplay: true,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 1000),
            showIndicator: false,
            images: carouselItem,
          ),
        ),
      )
    );
  }

  
  Future showBuyDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 230,
            child: Column(
              children: [
                Text(
                  'Buy now or add to cart?',
                  style: TextStyle(
                    color: redSecondaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Row(
                  children: [
                    Card(
                      elevation: 8.0,
                      child: IconButton(
                        color: Colors.black12,
                        icon: Icon(Icons.add), 
                        onPressed: () {
                        }
                      ),
                    )
                  ],
                )

              ],
            ),
          ),
        );
      },
    );
  }
}