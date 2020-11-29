import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:donation_system/Formatter/number.dart';
import 'package:donation_system/Models/CharityModel.dart';
import 'package:donation_system/Presentation/custom_icons_icons.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:donation_system/Variables/size.dart';
import 'package:donation_system/Widgets/CacheNetworkImagePlaceholder.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

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
      floatingActionButton: Container(
        height: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            loggedUser?.uid == null || loggedUser?.uid != widget.charityModel?.founderID ? Container():
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
                  Toast.show("Edit charity is not currently available.", context, duration: 4, gravity: Toast.BOTTOM);
                }
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
                      CustomIcons.charitylist,
                      color: white,
                      size: 30,
                    ), 
                    onPressed: (){
                      Toast.show("Can't receive direct donations right now.", context, duration: 4, gravity: Toast.BOTTOM);
                    }
                  ),
                ),
                SizedBox(width: 10,),
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
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            carouselBanner(widget.charityModel),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: currentCardChildrens(widget.charityModel)
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  AspectRatio carouselBanner(CharityModel charityModel) {
    List<Widget> carouselItem = List<Widget>();
    for (var i = 0; i < charityModel.pictures.length; i++) {
      carouselItem.add( CachedNetworkImage(
        imageUrl: charityModel.pictures[i],
        fit: BoxFit.cover,
        placeholder: (context, value){
          return CacheNetworkImagePlaceholder();
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

  currentCardChildrens(CharityModel charityModel) {
    List<Widget> charityCardChildren = [];
    List<String> charityDetailsSample = [ 
      charityModel.contact,
      (charityModel.location.state + ', ' + charityModel.location.province + (charityModel.location.street == '' ? ('') : (', ' + charityModel.location.street)) ),
      charityModel.description,
    ];

    charityCardChildren.add(
      Row(
        children: [
          Text( //Charity name
            "Current funds: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: bluePrimaryColor
            ),
          ),
          Text( //Charity name
              "₱ " + numberDecimalComma(widget.charityModel.totalDonationGranted),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: bluePrimaryColor
            ),
            overflow: TextOverflow.ellipsis,
            // maxLines: 1,
          ),
        ],
      ),
    );
    
    charityCardChildren.add( Text( //Charity name
      charityModel.name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    ),);
    
    for (int detail = 0; detail < 3; detail++) {
      charityCardChildren.add( detail == 2 ? SizedBox(height: 5,) : Container());
      charityCardChildren.add( Text(
        charityDetailsSample[detail],
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: detail != 2 ? FontStyle.italic : null
        ),
      ),);
    }

    return charityCardChildren;
  }
}