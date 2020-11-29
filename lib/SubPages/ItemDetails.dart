import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_system/Classes/ItemDetailsClass.dart';
import 'package:donation_system/Formatter/number.dart';
import 'package:donation_system/Models/CharityModel.dart';
import 'package:donation_system/Models/ItemModel.dart';
import 'package:donation_system/SubPages/OrderPage.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ItemDetails extends StatefulWidget {
  ItemDetails({
    this.itemModel
  });
  @required ItemModel itemModel;
  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> with SingleTickerProviderStateMixin{
  ItemDetailsClass itemDetailsClass = ItemDetailsClass();
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

  bool isheart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize( 
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
                  Stack(
                    children: [
                      itemDetailsClass.carouselBanner(widget.itemModel),
                      Positioned(
                        bottom: 0,
                        left:0,
                          child: Container(
                          color:Colors.black.withOpacity(.5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                children: [
                                  Icon(widget.itemModel.ratings >= 1 ?Icons.star : Icons.star_border, size: 23, color: widget.itemModel.ratings >= 1 ? Colors.yellow : white),
                                  Icon(widget.itemModel.ratings >= 1 ?Icons.star : Icons.star_border, size: 23, color: widget.itemModel.ratings >= 2 ? Colors.yellow : white),
                                  Icon(widget.itemModel.ratings >= 1 ?Icons.star : Icons.star_border, size: 23, color: widget.itemModel.ratings >= 3 ? Colors.yellow : white),
                                  Icon(widget.itemModel.ratings >= 1 ?Icons.star : Icons.star_border, size: 23, color: widget.itemModel.ratings >= 4 ? Colors.yellow : white),
                                  Icon(widget.itemModel.ratings >= 1 ?Icons.star : Icons.star_border, size: 23, color: widget.itemModel.ratings >= 5 ? Colors.yellow : white),
                                  SizedBox(width: 5,),
                                  Text(
                                    '('+ totalCount(widget.itemModel.totalReviewer) + ')',
                                    style: TextStyle(
                                      color: white,
                                      fontSize: 14
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    
                    ],
                  ),
                  itemDetailsClass.itemDetailsButton(
                    chatCallback: () {
                      Toast.show("Chat is currently not available.", context, duration: 4, gravity: Toast.BOTTOM);
                    },
                    wishlistCallback: () {
                      Toast.show("My Wishlist is currently not available.", context, duration: 4, gravity: Toast.BOTTOM);
                    },
                    buyCallback: () {
                      Navigator.push( context, SlideLeftRoute(page: OrderPage(itemModel: widget.itemModel,)));
                    },
                  ),
                  Expanded(
                    child: ListView(
                      primary: false,
                      padding: EdgeInsets.all(5),
                      children: [
                        itemDetailsClass.itemDetails(widget.itemModel, itemDescriptionDisplay, isHidingClicker, itemDescription, isSeeMore, () {
                          setState(() {
                            if (isSeeMore) {
                              itemDescriptionDisplay = itemDescription.substring(0, itemDescription.runes.fold(5, (previousValue, element) => element * 3)) + "...";
                              isSeeMore = false;
                            } else {
                              itemDescriptionDisplay = itemDescription;
                              isSeeMore = true;
                            }
                          });
                        }),
                        SizedBox( height: 10, ),
                        widget.itemModel.beneficiaries.length > 0 ? itemDetailsClass.charitableOrgDetails(charityModel, widget.itemModel) : Container()
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
}