import 'dart:io';

import 'package:donation_system/Classes/createCharityClass.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Widgets/Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CreateCharityPicture extends StatefulWidget {

  const CreateCharityPicture({
    @required this.button,
    @required this.createCharityClass,

  });

  final CustomRaisedButton button;
  final CreateCharityClass createCharityClass;

  @override
  _CreateCharityPictureState createState() => _CreateCharityPictureState();
}

class _CreateCharityPictureState extends State<CreateCharityPicture> {
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
          height: 200,
          width: double.infinity,
          child: ListView.builder(
            
            itemCount: widget.createCharityClass.imageUrl.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      widget.createCharityClass.imageUrl.removeAt(index);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 7.5),
                    width: 200.0,
                    height: 200.0,
                    decoration: new BoxDecoration(
                      color:Colors.red,
                      border: Border.all(
                        color: redSecondaryColor,
                        width: 2,
                      ),
                      image: new DecorationImage(
                      fit: BoxFit.fill,
                      image:FileImage(  File(widget.createCharityClass.imageUrl[index])),
                    ),
                    ),
                  ),
                );
              }
          ),
          
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 15),
          child: widget.button,
        )
      ],
    );
  }
}