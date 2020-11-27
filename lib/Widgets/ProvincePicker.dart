import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/location_data.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/material.dart';

import 'CityPicker.dart';

class ProvincePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        title: Text(
          'Province',
          style: TextStyle(
            color: redSecondaryColor,
            fontWeight: FontWeight.w600
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: new IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () => Navigator.pop(context) //Navigator.push(context, MaterialPageRoute(builder: (home)=> MainNavigationPage())),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemBuilder: (context, position){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, SlideLeftRoute(page: CityPicker(province: provinceArray[position]))
                ).then((value){
                  if(value != null){
                    Navigator.of(context).pop(value);
                  }
                });
              },
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: new Text(
                      provinceArray[position],
                      style: TextStyle(),
                    ),
                  ),
                  Divider(
                    height: 2.0,
                  ),
                ],
              ),
            );
          },
          itemCount: provinceArray.length,
        ),
      ),
    );
  }
}