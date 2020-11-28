import 'package:cached_network_image/cached_network_image.dart';
import 'package:donation_system/Models/CharityModel.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/size.dart';
import 'package:donation_system/Widgets/CacheNetworkImagePlaceholder.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:flutter/material.dart';

class CharityDetailsPage extends StatefulWidget {
  const CharityDetailsPage({
    this.charityModel
  });
  final CharityModel charityModel;
  @override
  _CharityDetailsPageState createState() => _CharityDetailsPageState();
}

class _CharityDetailsPageState extends State<CharityDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize( 
        preferredSize: Size.fromHeight(45.0),
        child: SubPagesAppBar(
          title: "Charity Details",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 100,
                width: PhoneSize(context).width,
                decoration: BoxDecoration(
                  color: redSecondaryColorLight,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: widget.charityModel.pictures[0],
                    fit: BoxFit.cover,
                    placeholder: (context, value) {
                      return CacheNetworkImagePlaceholder();
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}