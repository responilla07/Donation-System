import 'package:donation_system/Classes/EditProfileClass.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Widgets/Button.dart';
import 'package:donation_system/Widgets/TextField.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ProvincePicker.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({
    @required this.editProfileClass,
    @required this.button,
  });

  final EditProfileClass editProfileClass;
  final CustomRaisedButton button;

  
  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyTextField(
            controller: widget.editProfileClass.firstName, 
            hintText: 'First Name', 
            inputFormatter: null, 
            keyboardType: null
          ),
          SizedBox(height: 15),
          MyTextField(
            controller: widget.editProfileClass.lastName, 
            hintText: 'Last Name', 
            inputFormatter: null, 
            keyboardType: null
          ),
          SizedBox(height: 15),
          MyTextField(
            controller: widget.editProfileClass.contacts, 
            hintText: 'Contact Number', 
            inputFormatter: null, 
            keyboardType: null
          ),
          SizedBox(height: 15),
          Container(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, SlideLeftRoute(page: ProvincePicker())).then((value){
                        setState(() {
                          widget.editProfileClass.state = value['city'];
                          widget.editProfileClass.province = value['province'];
                        });
                      });
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          color: redSecondaryColor
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            widget.editProfileClass.state,
                          style: TextStyle(
                            color: widget.editProfileClass.state == "" ? Colors.black54 : Colors.black,
                            fontSize: 16
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, SlideLeftRoute(page: ProvincePicker())).then((value){
                        setState(() {
                          widget.editProfileClass.state = value['city'];
                          widget.editProfileClass.province = value['province'];
                        });
                      });
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          color: redSecondaryColor
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.editProfileClass.province,
                          style: TextStyle(
                            color: widget.editProfileClass.province == "" ? Colors.black54 : Colors.black,
                            fontSize: 16
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          MyTextField(
            controller: widget.editProfileClass.street, 
            hintText: 'Street', 
            inputFormatter: null, 
            keyboardType: null
          ),
          SizedBox(height: 15),
          widget.button
        ],
      ),
    );
  }
}