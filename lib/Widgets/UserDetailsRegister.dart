import 'package:donation_system/Classes/RegistrationClass.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Widgets/BackButtonRegistration.dart';
import 'package:donation_system/Widgets/Button.dart';
import 'package:donation_system/Widgets/ProvincePicker.dart';
import 'package:donation_system/Widgets/TextField.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserDetailsRegister extends StatefulWidget {
  const UserDetailsRegister({
    @required this.regClass,
    @required this.button,
    @required this.backButton,
  });

  final RegistrationClass regClass;
  final CustomRaisedButton button;
  final BackButtonRegistration backButton;

  @override
  _UserDetailsRegisterState createState() => _UserDetailsRegisterState();
}

class _UserDetailsRegisterState extends State<UserDetailsRegister> {
  RegistrationClass regClass = RegistrationClass();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          widget.backButton,
          SizedBox( height: 35, ),
          Text(
            'Registration',
            style: TextStyle(
              fontSize: 40,
              //TODO font style 
            ),
          ),
          Text(
            'Please Enter your information',
            style: TextStyle(
              fontSize: 16,
              //TODO font style 
            ),
          ),
          SizedBox(height: 65, ),
          MyTextField(
            controller: widget.regClass.firstName, 
            hintText: "First Name", 
            inputFormatter: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z\-' ]")) ],
            keyboardType: null
          ),
          SizedBox(height: 15, ),
          MyTextField(
            controller: widget.regClass.lastName, 
            hintText: "Last Name", 
            inputFormatter: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z\-' ]")) ],
            keyboardType: null
          ),
          SizedBox(height: 15,),
          MyTextField(
            controller: widget.regClass.contactNumber, 
            hintText: "Contact Number", 
            inputFormatter: [FilteringTextInputFormatter.allow(RegExp("[0-9\-\(\)\+]")) ],
            keyboardType: null
          ),
          SizedBox(height: 15,),
          Container(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, SlideLeftRoute(page: ProvincePicker())).then((value){
                        setState(() {
                          widget.regClass.state = value['city'];
                          widget.regClass.province = value['province'];
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
                           widget.regClass.state,
                          style: TextStyle(
                            color: widget.regClass.state == "State" ? Colors.black54 : Colors.black,
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
                          widget.regClass.state = value['city'];
                          widget.regClass.province = value['province'];
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
                          widget.regClass.province,
                          style: TextStyle(
                            color: widget.regClass.province == "Province" ? Colors.black54 : Colors.black,
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
          SizedBox(height: 15,),
          MyTextField(
            controller: widget.regClass.completeAddress, 
            hintText: "Street", 
            inputFormatter: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z&@&/,.0-9\-\(\)\+]")) ],
            keyboardType: null
          ),
          SizedBox(height: 25,),
          widget.button
        ],

      ),
    );
  }
}


