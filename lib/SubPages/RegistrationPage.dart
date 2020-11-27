
import 'package:donation_system/Classes/RegistrationClass.dart';
import 'package:donation_system/Pages/MainPage.dart';
import 'package:donation_system/Widgets/BackButtonRegistration.dart';
import 'package:donation_system/Widgets/Button.dart';
import 'package:donation_system/Widgets/LoginDetailsRegistrations.dart';
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
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: ListView(
              primary: false,
              children: [
                Center(
                  
                  child: regClass.pageInt == 1 ? 
                  
                  
                  LoginDetailsRegistrations(
                    regClass: regClass,
                    button: CustomRaisedButton(
                      onTap: (){
                        setState(() {
                          regClass.pageInt = 2;
                        });
                      },
                      title: "Next",
                    ),
                    backButton: BackButtonRegistration(
                      onTap: (){
                        Navigator.pop(context);
                      }
                    ),
                  ) 
                  
                  
                  
                  :UserDetailsRegister(
                    regClass: regClass,
                    button: CustomRaisedButton(
                      onTap: (){
                        // setState(() {
                        //   regClass.pageInt = 1;
                        // });
                        if (regClass.validate("fields")) {
                            
                           regClass.processRegistration(context).then((isRegistered){
                              if (isRegistered) {
                                print("User created........");
                                Navigator.pop(context);
                                Navigator.pushReplacement(context, SlideRightRoute(page: MainPage()));
                              }
                            });
                        } 
                        else{
                          Toast.show(regClass.validate('message'), context, duration: 3, gravity: Toast.BOTTOM);
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

                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),

         

        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  
}



