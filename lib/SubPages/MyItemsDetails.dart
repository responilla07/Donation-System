import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_system/Classes/ItemDetailsClass.dart';
import 'package:donation_system/Models/CharityModel.dart';
import 'package:donation_system/Models/ItemModel.dart';
import 'package:donation_system/Presentation/custom_icons_icons.dart';
import 'package:donation_system/SubPages/OrderPage.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class MyItemsDetails extends StatefulWidget {
  MyItemsDetails({
    this.itemModel
  });
  @required ItemModel itemModel;
  @override
  _MyItemsDetailsState createState() => _MyItemsDetailsState();
}

class _MyItemsDetailsState extends State<MyItemsDetails> with SingleTickerProviderStateMixin{
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
          title: "My Item Details",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButton: Container(
        height: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 50, width: 50,
              decoration: BoxDecoration(
                color: redSecondaryColor,
                borderRadius: BorderRadius.all(Radius.circular(100)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.8),
                    offset: Offset(0, 2),
                    blurRadius: 3,
                    spreadRadius: 3,
                  )
                ]
              ),
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: white,
                  size: 30,
                ), 
                onPressed: (){
                  Toast.show("Edit item is not currently available.", context, duration: 4, gravity: Toast.BOTTOM);
                }
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 50, width: 50,
              decoration: BoxDecoration(
                color: redSecondaryColor,
                borderRadius: BorderRadius.all(Radius.circular(100)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.8),
                    offset: Offset(0, 2),
                    blurRadius: 3,
                    spreadRadius: 3,
                  )
                ]
              ),
              child: IconButton(
                icon: Icon(
                  CustomIcons.chat,
                  color: white,
                  size: 30,
                ), 
                onPressed: (){
                  Toast.show("available soon...", context, duration: 4, gravity: Toast.BOTTOM);
                }
              ),
            ),
          ],
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
                            children: List.generate(5, (index) {
                              num value = 4;
                                return Icon(
                                  index < value ? Icons.star : Icons.star_border,
                                  color: index <value?  Colors.yellow:Colors.white,
                                  size: 30,
                              );
                            }),
                          ),
                        ),
                      )
                    
                    ],
                  ),
                  // itemDetailsClass.itemDetailsButton(
                  //   chatCallback: () {
                  //     print('chat button clicked!');
                  //   },
                  //   wishlistCallback: () {
                  //     print('wishlist button clicked!');
                  //   },
                  //   buyCallback: () {
                  //     Navigator.push( context, SlideLeftRoute(page: OrderPage(itemModel: widget.itemModel,)));
                  //   },
                  // ),
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