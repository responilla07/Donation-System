import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_system/Models/OrdersModel.dart';
import 'package:donation_system/Presentation/custom_icons_icons.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:flutter/material.dart';

class Tracking extends StatefulWidget {
  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {

  List<String> status = [
    'Failed',
    'Success',
    'OnGoing'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: SubPagesAppBar(
          title: "Track Your Parcel",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          //TODO Note* lalagyan nalang ng .where('itemID', isEqualTo: 'id ng item') dina nalagyan dahil hindi na aabot kakapusin na pang present lang
          stream: FirebaseFirestore.instance.collection('Orders').where('buyerId', isEqualTo: loggedUser.uid).orderBy('orderDate', descending: true).limit(6).snapshots(),
          builder: (BuildContext context,snapshot){
            if (snapshot.hasData) {
              if (snapshot.data.docs.length > 0) {
                return Container(
                  margin: EdgeInsets.only(top: 15),
                  height: double.infinity,
                  child: ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    shrinkWrap: false,
                    primary: false,
                    itemBuilder: (context, index) {
                      OrdersModel ordersModel = OrdersModel(snapshot.data.docs[index].id, snapshot.data.docs[index].data());
                      return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
                            child: Card(
                            color: redSecondaryColor,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'from',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                          ordersModel.state +" "+ ordersModel.province,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'to',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        myUserDetails.value.location.state +" "+ myUserDetails.value.location.province,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Order Date',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        ordersModel.orderDate.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'status',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            Text(
                                              index <= 2 ? status[index] : 'On going',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 30),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Total Price',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            Text(
                                              ordersModel.totalPrice.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 30),
                                        
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
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
      ),
    );
  }
}
