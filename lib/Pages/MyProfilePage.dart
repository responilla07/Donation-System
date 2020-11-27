import 'package:donation_system/Presentation/custom_icons_icons.dart';
import 'package:donation_system/Variables/color.dart';
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
                padding: EdgeInsets.all(15),
                child: Card(
                elevation: 5,
                child: Column(
                  
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(
                              CustomIcons.edit_profile,
                              color: redSecondaryColor,
                            ), 
                            onPressed: (){}
                          )
                        ],
                      ),
                      
                      SizedBox(
                        height: 5,
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 5),
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
                      
                      SizedBox(
                        height: 15,
                      ),
                      
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ProfileDetails(
                              icon: CustomIcons.profile,
                              detail: 'Christian Paul Pili',
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ProfileDetails(
                              icon: CustomIcons.info,
                              detail: 'test@test.com',
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ProfileDetails(
                              icon: CustomIcons.contact,
                              detail: '09xxxxxxxxxxx',
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ProfileDetails(
                              icon: CustomIcons.editprofile_outlined,
                              detail: 'asdgasuydgaysudauysdgausdgajdajsdhghaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasj',
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),

                    ],

                  ),
                ),
                
              ),
            ),

            Positioned(
              top: 470,
              left: 0,
              bottom:0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 4,
                  children: <Widget>[
                    FlatButton(
                        onPressed: (){
                          
                        },
                        child: Text('Pressme')
                      ),
                    FlatButton(
                        onPressed: (){

                        },
                        child: Text('Pressme')
                      ),
                    FlatButton(
                        onPressed: (){

                        },
                        child: Text('Pressme')
                      ),
                    FlatButton(
                        onPressed: (){

                        },
                        child: Text('Pressme')
                      ),
                      
                  ],
                ),
              ),
            )

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


