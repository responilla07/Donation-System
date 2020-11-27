import 'package:donation_system/Methods/Style.dart';
import 'package:donation_system/SubPages/InfoPage.dart';
import 'package:donation_system/SubPages/LoginPage.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: ()=> Navigator.push(context, SlideLeftRoute(page: InfoPage())),
            child: Icon(
              Icons.info_outline,
              color: redSecondaryColorDark, //TODO IVAN papaltan nalang ng kulay saka icon
            ),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(bottom: 5,),
            child: Container(
              height: 40,
              padding: EdgeInsets.only(left: 70, right: 70, top: 10),
              decoration: BoxDecoration(
                color: redSecondaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(300, 100),
                  bottomRight: Radius.elliptical(300, 100)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  pageTitle.value,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    height: 0.1
                  ),
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          GestureDetector(
            onTap: ()=> Navigator.pushReplacement(context, SlideLeftRoute(page: LoginPage())),
            child: Icon(
              Icons.arrow_forward_ios,
              color: redSecondaryColorDark, //TODO IVAN papaltan nalang ng kulay saka icon
            ),
          ),
        ],
      ),
    );
  }
}