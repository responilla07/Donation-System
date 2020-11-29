
import 'package:donation_system/Classes/RegistrationClass.dart';
import 'package:donation_system/Pages/MainPage.dart';
import 'package:donation_system/Widgets/BackButtonRegistration.dart';
import 'package:donation_system/Widgets/Button.dart';
import 'package:donation_system/Widgets/LoginDetailsRegistrations.dart';
import 'package:donation_system/Widgets/ProcessIndicator.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:donation_system/Widgets/UserDetailsRegister.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  RegistrationClass regClass = RegistrationClass();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            GestureDetector(
              onTap: ()=> FocusScope.of(context).requestFocus(new FocusNode()),
              child: Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: ListView(
                      primary: false,
                      children: [
                        Center(
                          child: regClass.pageInt == 1 ?  LoginDetailsRegistrations(
                            regClass: regClass,
                            button: CustomRaisedButton(
                              title: "Next",
                              onTap: (){
                                setState(() {
                                  regClass.pageInt = 2;
                                });
                              },
                            ),
                            backButton: BackButtonRegistration(
                              onTap: (){
                                Navigator.pop(context);
                              }
                            ),
                          ) 
                          : UserDetailsRegister(
                            regClass: regClass,
                            button: CustomRaisedButton(
                              onTap: (){
                                setState(() { regClass.isProcessing = true; });
                                if (regClass.validate("fields")) {
                                  regClass.processRegistration(context).then((isRegistered){
                                    if (isRegistered) {
                                      Navigator.pop(context);
                                      Navigator.pushReplacement(context, SlideRightRoute(page: MainPage()));
                                      setState(() { regClass.isProcessing = false; });
                                    }
                                  });
                                } 
                                else{
                                  Toast.show(regClass.validate('message'), context, duration: 3, gravity: Toast.BOTTOM);
                                  setState(() { regClass.isProcessing = false; });
                                }
                              },
                              title: "REGISTER",
                            ),
                            backButton: BackButtonRegistration(
                              onTap: (){
                                setState(() {
                                  regClass.pageInt = 1;
                                });
                              }
                            ),
                          ) 
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              'Page ${regClass.pageInt} out of 2'
                            ),
                          ),
                        ),
                        SizedBox( height: 15, )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            regClass.isProcessing ? ProcessIndicator() : Container()
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}



