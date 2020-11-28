import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_system/Formatter/number.dart';
import 'package:donation_system/Methods/Style.dart';
import 'package:donation_system/Models/CharityModel.dart';
import 'package:donation_system/Models/ItemModel.dart';
import 'package:donation_system/Presentation/custom_icons_icons.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:donation_system/Variables/size.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  ItemDetails({
    this.itemModel
  });
  @required ItemModel itemModel;
  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> with SingleTickerProviderStateMixin{
  CharityModel charityModel = CharityModel('', {});
  String itemID = '';
  bool isSeeMore = false;
  String itemDescription;
  String itemDescriptionDisplay;
  bool isHidingClicker = false;

  getCharityOrg() async {
    await db.collection('Charities').doc(widget.itemModel.beneficiaries[0]).get().then((doc){
      setState(() {
        charityModel = CharityModel(doc.id, doc.data());
      });
    });
  }

  @override
  void initState() {
    getCharityOrg();
    itemID = widget.itemModel.id;
    itemDescription = widget.itemModel.itemDescription;
    if (itemDescription.length >= 135 && !isSeeMore) { //135 // 173
      itemDescriptionDisplay = itemDescription.substring(0, itemDescription.runes.fold(5, (previousValue, element) => element * 3)) + "...";
    } else {
      itemDescriptionDisplay = itemDescription;
      isHidingClicker = true;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize( //TODO Eto ang gamitin na app bar sa ibang sub pages
        preferredSize: Size.fromHeight(45.0),
        child: SubPagesAppBar(
          title: "Item Details",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('Products').doc(itemID).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            widget.itemModel = ItemModel(snapshot.data.id, snapshot.data.data());
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  carouselBanner(),
                  itemDetailsButton(),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(10),
                      children: [
                        itemDetails(),
                        SizedBox( height: 10, ),
                        widget.itemModel.beneficiaries.length > 0 ? charitableOrgDetails() : Container()
                      ],
                    ),
                  )
                ],
              ),
            ); // This trailing comma makes auto-formatting nicer for build methods.
          }else{
            return Center(child: Container(),);
          }
        },
      ),
    );
  }

  Column itemDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.itemModel.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
        Text(
          "₱ " + numberDecimalComma(widget.itemModel.price),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: bluePrimaryColorDark,
            fontSize: 18
          ),
        ),
        SizedBox( height: 5, ),
        Text(
          widget.itemModel.location.state + ', ' + widget.itemModel.location.province,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        widget.itemModel.location.street == '' ? Container() 
        : Text(
          widget.itemModel.location.street,
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
              recognizer: new TapGestureRecognizer()..onTap = (){
                setState(() {
                  if (isSeeMore) {
                    itemDescriptionDisplay = itemDescription.substring(0, itemDescription.runes.fold(5, (previousValue, element) => element * 3)) + "...";
                    isSeeMore = false;
                  } else {
                    itemDescriptionDisplay = itemDescription;
                    isSeeMore = true;
                  }
                });
              },
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
    );
  }

  Column charitableOrgDetails() {
    return Column(
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
          widget.itemModel.location.street,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Container itemDetailsButton() {
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
            onTap: (){
              print('chat item owner...');
            },
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(left: 15, right: 7.5),
              height: 40,
              child: Row(
                children: [
                  Icon(
                    CustomIcons.chat
                  ),
                  SizedBox(width: 10,),
                  Text(
                    "Chat",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              print('add to wishlist yung item...');
            },
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
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                print('add to cart yung item...');
              },
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.only(left: 35, right: 15),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CustomIcons.charity_cart
                    ),
                    SizedBox(width: 10,),
                    Text(
                      "Buy Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
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

  AspectRatio carouselBanner() {
    List<Widget> carouselItem = List<Widget>();
    for (var i = 0; i < widget.itemModel.itemPhoto.length; i++) {
      carouselItem.add( CachedNetworkImage(
        imageUrl: widget.itemModel.itemPhoto[i],
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
      aspectRatio: 16/10,
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
}
