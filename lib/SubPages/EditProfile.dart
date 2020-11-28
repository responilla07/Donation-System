import 'dart:io';

import 'package:donation_system/Classes/EditProfileClass.dart';
import 'package:donation_system/Presentation/custom_icons_icons.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:donation_system/Widgets/Button.dart';
import 'package:donation_system/Widgets/EditProfileWidget.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
   EditProfileClass editProfileClass = EditProfileClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize( 
        preferredSize: Size.fromHeight(45.0),
        child: SubPagesAppBar(
          title: "Edit Profile",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        primary: false,
        children: [
      
          Center(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black
                ),
                children: [
                  TextSpan(
                    text: 'UserDetail',
                    style: editProfileClass.pageNum == 1 ?  selectedText() : unselectedText(),
                    recognizer: TapGestureRecognizer().. onTap = () {
                      setState(() {
                        editProfileClass.pageNum = 1;
                      });
                    } ,
                  ),
                  TextSpan(
                    text: ' / ',
                  ),
                  TextSpan(
                    text: 'Password',
                    style: editProfileClass.pageNum == 2 ?  selectedText() : unselectedText(),
                    recognizer: TapGestureRecognizer().. onTap = (){
                      setState(() {
                        editProfileClass.pageNum = 2;
                        print(myUserDetails.value.setUserDetails());
                      });
                    }
                  ),
                ]
              ),
            ),
          ),
          
          Container(
            padding: EdgeInsets.all(15),
            child: Card(
            elevation: 5,
            child: Column(
              children: [
                
                GestureDetector(
                  onTap: () async {
                    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
                    setState((){
                     editProfileClass.profilePlaceHolder = pickedFile.path;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Stack(
                      children: [
                        Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: new BoxDecoration(
                            border: Border.all(
                              color: redSecondaryColor,
                              width: 5,
                            ),
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: editProfileClass.profilePlaceHolder != "" ? FileImage( new File(editProfileClass.profilePlaceHolder)) :
                              editProfileClass.profileUrl != "" ? NetworkImage(editProfileClass.profileUrl) :
                              
                              AssetImage('assets/ProfilePlaceHolder.png') , 
                            ),
                          ),
                        ),
                        Positioned(
                          top: 40,
                          left:0,
                          right: 0,
                          child:Icon(
                            CustomIcons.add_a_photo,
                            color: Colors.grey.withOpacity(0.9),
                            size:  70,
                          )
                        )
                      ],
                    ),
                  ),
                ),
                
              EditProfileWidget(
                  editProfileClass: editProfileClass,
                  button: CustomRaisedButton(
                    onTap: (){
                      if(editProfileClass.validate('fields',editProfileClass.profilePlaceHolder)){
                        editProfileClass.updateUserDetails(context,editProfileClass.profilePlaceHolder).then((isUpdated){
                          if (isUpdated) {
                            Toast.show("Successfully Updated", context, duration: 3, gravity: Toast.BOTTOM);
                            Navigator.pop(context);
                          }
                        });
                      }
                      else{
                        Toast.show(editProfileClass.validate('message',editProfileClass.profilePlaceHolder), context, duration: 3, gravity: Toast.BOTTOM);
                      }
                    },
                    title: 'Save',
                  ),
              ),

              ],
            ),
            ),
            
          ),
        ],
      ),
    );
  }

  TextStyle unselectedText() => TextStyle(decoration: TextDecoration.underline,color: Colors.black);

  TextStyle selectedText() => TextStyle(decoration: TextDecoration.underline,color: redSecondaryColor,fontWeight: FontWeight.bold,fontSize: 20);
}