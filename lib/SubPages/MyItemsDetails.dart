import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_system/Classes/ItemDetailsClass.dart';
import 'package:donation_system/Formatter/number.dart';
import 'package:donation_system/Methods/Style.dart';
import 'package:donation_system/Models/CharityModel.dart';
import 'package:donation_system/Models/ItemModel.dart';
import 'package:donation_system/Models/OrdersModel.dart';
import 'package:donation_system/Presentation/custom_icons_icons.dart';
import 'package:donation_system/SubPages/OrderPage.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
                  Expanded(
                    child: ListView(
                      primary: false,
                      shrinkWrap: false,
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
                        widget.itemModel.beneficiaries.length > 0 ? itemDetailsClass.charitableOrgDetails(charityModel, widget.itemModel) : Container(),
                        SizedBox( height: 10, ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            children: [
                              Text(
                                'List of orders',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: redSecondaryColorDark
                                ),
                              ),
                              Expanded(child: Container()),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.black
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'view more >',
                                      style: TextStyle( 
                                        decoration: TextDecoration.underline,
                                        color: redSecondaryColorDark.withOpacity(.75),
                                        fontWeight: FontWeight.bold
                                      ),
                                      recognizer: TapGestureRecognizer().. onTap = () 
                                        => Toast.show("under maintenance", context, duration: 4, gravity: Toast.BOTTOM),
                                    ),
                                  ]
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        StreamBuilder<QuerySnapshot>(
                          //TODO Note* lalagyan nalang ng .where('itemID', isEqualTo: 'id ng item') dina nalagyan dahil hindi na aabot kakapusin na pang present lang
                          stream: FirebaseFirestore.instance.collection('Orders').orderBy('orderDate', descending: true).limit(2).snapshots(),
                          builder: (BuildContext context,snapshot){
                            if (snapshot.hasData) {
                              if (snapshot.data.docs.length > 0) {
                                return Container(
                                  height: 310,
                                  child: ListView.builder(
                                    itemCount: snapshot.data.docs.length,
                                    shrinkWrap: false,
                                    primary: false,
                                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    itemBuilder: (context, index) {
                                      OrdersModel ordersModel = OrdersModel(snapshot.data.docs[index].id, snapshot.data.docs[index].data());
                                      return Padding(
                                        padding: const EdgeInsets.only(bottom: 15),
                                        child: orderCard(context, snapshot, index, ordersModel),
                                      );
                                    },
                                  ),
                                );
                              }
                              else{
                                return Center(
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                                    child: Text(
                                      'Buyer list is empty.',
                                      style: TextStyle(
                                        fontSize:MediaQuery.of(context).size.width/25.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey
                                      ),
                                    ),
                                  ),
                                );
                              }
                            }
                            else{
                              return Container();
                            }
                          },
                        ),
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

  GestureDetector orderCard(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot, int index, OrdersModel ordersModel) {
    return GestureDetector(
      onTap: () async {
        Toast.show("under maintenance", context, duration: 4, gravity: Toast.BOTTOM);
      },
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: 130,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: redSecondaryColorLight,
                        borderRadius: BorderRadius.all(
                          Radius.circular(150)
                        ),
                        border: Border.all(
                          color: redSecondaryColor,
                          width: 2,
                        ),
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/ProfilePlaceHolder.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tracking #' + (snapshot.data.docs[index].data()['orderDate'] as Timestamp).microsecondsSinceEpoch.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: bluePrimaryColor
                            ),
                          ),
                          Text(
                            ordersModel.fullname.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            ordersModel.address1 + ', ' + ordersModel.state + ', ' + ordersModel.province + ', ' + ordersModel.postal,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            DateFormat("MMMM dd, yyyy").format((ordersModel.orderDate)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: hexColor(failedColor),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(50)
                        )
                      ),
                      height: 30,
                      child: Center(
                        child: Text(
                          'DECLINE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: white,
                            fontSize: 16
                          ),
                        ),
                      ),
                    )
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: hexColor(successColor),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomRight: Radius.circular(10)
                        )
                      ),
                      height: 30,
                      child: Center(
                        child: Text(
                          'ACCEPT',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: white,
                            fontSize: 16
                          ),
                        ),
                      ),
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}