import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_system/SubPages/HotlinesPage.dart';
import 'package:donation_system/SubPages/NewsPage.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/size.dart';
import 'package:donation_system/Widgets/Button.dart';
import 'package:donation_system/Widgets/CarouselBanner.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int position = 0;

  homeTabView(int index) {
    setState(() {
      position = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: 185, bottom: 0, left: 0, right: 0,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  child: Stack(
                    children: [
                      Positioned(
                        right: 15,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black
                            ),
                            children: [
                              TextSpan(
                                text: position == 0 ? 'more news >' : 'view more >',
                                style: TextStyle( 
                                  decoration: TextDecoration.underline,
                                  color: redSecondaryColorDark.withOpacity(.75),
                                  fontWeight: FontWeight.bold
                                ),
                                recognizer: TapGestureRecognizer().. onTap = () 
                                  => position == 0 ? Navigator.push( context, SlideLeftRoute(page: NewsPage()))
                                    : Navigator.push( context, SlideLeftRoute(page: HotlinesPage())),
                              ),
                            ]
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20, bottom: 0, left: 0, right: 0,
                        child: Card(
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: redSecondaryColorLight,
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: 'https://sa.kapamilya.com/absnews/abscbnnews/media/2020/tvpatrol/11/25/vaccine.jpg',
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
                                    ),
                                  ),
                                )
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Philippines eyes portfolio of potential vaccines vs COVID-19",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    Text( "Davinci Maru, ABS-CBN News", ),
                                    Row(
                                      children: [
                                        Text(
                                          "Posted at Nov 27 05:06 PM",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 30,
                                          color: redSecondaryColorDark.withOpacity(.8),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Read More",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ),
            Positioned(
              left: 0, right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CarouselBanner(),
                  homeTabs()
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //////////////////////////////////////// [METHODS] //////////////////////////////////////// 

  Container homeTabs() {
    return Container(
      color: redSecondaryColor,
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => homeTabView(0),
              child: Text(
                'News',
                style: TextStyle(
                  color: white,
                  fontSize: position == 0 ? 22 : 16,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
            ),
            customDivider(),
            GestureDetector(
              onTap: () => homeTabView(1),
              child: Text(
                'Emergency Hotlines',
                style: TextStyle(
                  color: white,
                  fontSize: position == 1 ? 22 : 16,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center customDivider() {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15,),
        width: 33,
        height: 35,
        child: Divider(
          thickness: 25,
          color: white,
        )
      ),
    );
  }
}