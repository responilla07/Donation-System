import 'package:donation_system/Presentation/custom_icons_icons.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/size.dart';
import 'package:donation_system/Widgets/ProfileDetails.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        
        child: Stack(

          children: <Widget>[

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 370,
                padding: EdgeInsets.all(15),
                child: Card(
                elevation: 5,
                child: Stack(
                  children: [
                    Positioned(
                      left: 15,
                      right: 15,
                      top:15,
                      child: Column(
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
                                image: AssetImage('assets/ProfilePlaceHolder.png'),
                              ),
                            ),
                          ),
                          
                          ProfileDetails(
                            fullname: 'Christian Paul Pili',
                            email: 'christiantkoe@gmail.com',
                            contact: '639-323-265-144',
                            state: 'Laguna',
                            province: 'Calamba',
                            street: 'asdhakjsdhasjdhaskdhsdhasdjhaasdakjsdhkajsdhaksjdh',
                          )

                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        child: IconButton(
                          icon: Icon(
                            CustomIcons.edit_profile,
                            color: redSecondaryColor,
                          ), 
                          onPressed: (){}
                        ),
                      ),
                    ),
                  ],
                ),
                ),
                
              ),
            ),

            Positioned(
              top:370,
              left: 15,
              right: 15,
              bottom: 15,
              child: GridView(
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0,
                ),
                padding: EdgeInsets.all(15),
                children: [
                  FlatButton(
                        color: redSecondaryColor,
                        onPressed: (){},
                        child: Container(
                          width: 70,
                          height: 70,
                          child: Center(child: Text('Press Me!'))
                        ),
                      ),
                      FlatButton(
                        color: redSecondaryColor,
                        onPressed: (){},
                        child: Container(
                          width: 70,
                          height: 70,
                          child: Center(child: Text('Press Me!'))
                        ),
                      ),
                      FlatButton(
                        color: redSecondaryColor,
                        onPressed: (){},
                        child: Container(
                          width: 70,
                          height: 70,
                          child: Center(child: Text('Press Me!'))
                        ),
                      ),
                      FlatButton(
                        color: redSecondaryColor,
                        onPressed: (){},
                        child: Container(
                          width: 70,
                          height: 70,
                          child: Center(child: Text('Press Me!'))
                        ),
                      ),
                      FlatButton(
                        color: redSecondaryColor,
                        onPressed: (){},
                        child: Container(
                          width: 70,
                          height: 70,
                          child: Center(child: Text('Press Me!'))
                        ),
                      ),
                ],
              ),
            ),

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


