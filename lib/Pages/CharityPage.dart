import 'package:donation_system/Classes/CharityPageClass.dart';
import 'package:donation_system/SubPages/CharityDetails.dart';
import 'package:donation_system/Widgets/LoaderForPagination.dart';
import 'package:donation_system/Widgets/QueueCard.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/material.dart';

class CharityPage extends StatefulWidget {
  @override
  _CharityPageState createState() => _CharityPageState();
}

class _CharityPageState extends State<CharityPage> {
  int itemLength = 13; //TODO Static lang to so baguhin nalang mamaya
  CharityPageClass charityPageClass = CharityPageClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: itemLength != 0 ? ListView.builder(
          padding: EdgeInsets.fromLTRB(15, 5, 15, 15),
          itemCount: itemLength,
          primary: false,
          itemBuilder: (context, index) {
            return (index != (itemLength - 1))
            ? Padding(
              padding: EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: () async {
                  await Navigator.push(context, SlideLeftRoute(page: CharityDetailsPage()));
                },
                child: CharityItemCard(
                  charityPageClass: charityPageClass
                )
              )
            ) 
            : LoaderForPagination(
              isPullUp: false,
              loaderHeight: 40,
              loaderWidth: 40,
            );
          },
        ) : Text("Create place holder here"), //TODO Create placeholder for this page
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
