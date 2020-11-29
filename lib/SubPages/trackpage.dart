import 'package:donation_system/Presentation/custom_icons_icons.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:flutter/material.dart';

class Tracking extends StatefulWidget {
  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50, left: 15),
              child: Row(
                children: [
                  Icon(CustomIcons.qr),
                  SizedBox(width: 10),
                  Text(
                    'CB12312324234',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Card(
                color: redSecondaryColor,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(13),
                      child: Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'from',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Philippines, Makati',
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
                                  'Cabuyao, Laguna',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
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
                                'In Transit',
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
                                'type',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Rider',
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
                                'Weight',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '900 g',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text('History',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Icon(Icons.radio_button_unchecked),
                  SizedBox(width: 20,),
                  Text('Estimated Delivery Date is December 2'),
                ],
              ),
            ),
            SizedBox(height:20 ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Icon(Icons.radio_button_checked),
                  SizedBox(width: 20,),
                  Text('Arrived at Logistic Sorting Center'),
                ],
              ),
            ),
            SizedBox(height:20 ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Icon(Icons.radio_button_unchecked),
                  SizedBox(width: 20,),
                  Text('Sent to Sorting Center'),
                ],
              ),
            ),
            SizedBox(height:20 ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Icon(Icons.radio_button_unchecked),
                  SizedBox(width: 20,),
                  Text('Picked up by Logistic parter'),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
