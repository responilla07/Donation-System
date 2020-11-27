
import 'package:donation_system/Classes/RegistrationClass.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Widgets/Button.dart';
import 'package:donation_system/Widgets/LoginDetailsRegistrations.dart';
import 'package:donation_system/Widgets/UserDetailsRegister.dart';
import 'package:flutter/material.dart';

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
                        setState(() {
                          regClass.pageInt = 1;
                        });
                      },
                      title: "Next",
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

class BackButtonRegistration extends StatelessWidget {
 const BackButtonRegistration({
    @required this.onTap,
  });

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: redSecondaryColor,
          ),
          Text('Back'),
        ],
      )
    );
  }
}

