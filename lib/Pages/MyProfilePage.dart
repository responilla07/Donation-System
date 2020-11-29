import 'package:cached_network_image/cached_network_image.dart';
import 'package:donation_system/SubPages/MyTrackingPage.dart';
import 'package:donation_system/SubPages/MyWishlistPage.dart';
import 'package:donation_system/SubPages/TrackingPage.dart';
import 'package:donation_system/SubPages/EditProfile.dart';
import 'package:donation_system/Presentation/custom_icons_icons.dart';
import 'package:donation_system/SubPages/MyCharityList.dart';
import 'package:donation_system/SubPages/MyItems.dart';
import 'package:donation_system/SubPages/chatpage.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:donation_system/Widgets/ProfileDetails.dart';
import 'package:donation_system/transitions/slide_route.dart';
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
                height: 355,
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
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: redSecondaryColorLight,
                              borderRadius: BorderRadius.all(
                                Radius.circular(150)
                              ),
                              border: Border.all(
                                color: redSecondaryColor,
                                width: 5,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(150),
                              child: CachedNetworkImage(
                                imageUrl: myUserDetails.value.profileUrl,
                                fit: BoxFit.cover,
                                placeholder: (context, value) {
                                  return Container(
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
                                  );                                
                                },
                              ),
                            ),
                          ),
                          
                          
                          ProfileDetails(
                            fullname: myUserDetails.value.name.forename.toUpperCase() + ' ' + myUserDetails.value.name.surname.toUpperCase(),
                            email: myUserDetails.value.email,
                            contact: myUserDetails.value.contact,
                            state: myUserDetails.value.location.state,
                            province: myUserDetails.value.location.province,
                            street: myUserDetails.value.location.street,
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
                          onPressed: (){
                            Navigator.push(context, SlideLeftRoute(page: EditProfile()));
                          }
                        ),
                      ),
                    ),
                  ],
                ),
                ),
                
              ),
            ),

            Positioned(
              top: 335,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                // color: Colors.green,
                child: GridView(
                  primary: false,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.1,
                    crossAxisCount: 3,
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 15.0,
                  ),
                  padding: EdgeInsets.all(15),
                  children: [
                    ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: FlatButton(
                            onPressed: (){
                              Navigator.push(context, SlideLeftRoute(page: MyCharityList()));
                            },
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset('assets/buttons/myCharity.png'))),
                    ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: FlatButton(
                            onPressed: (){
                              Navigator.push(context, SlideLeftRoute(page: MyWishlistPage()));
                            },
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset('assets/buttons/myWishList.png'))),
                    ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: FlatButton(
                            onPressed: (){
                              Navigator.push(context, SlideLeftRoute(page: Tracking()));
                              // Toast.show("My Order is currently not available.", context, duration: 4, gravity: Toast.BOTTOM);
                            },
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset('assets/buttons/myOrder.png'))),
                    ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: FlatButton(
                            onPressed: (){
                              
                              Navigator.push(context, SlideLeftRoute(page: MyItems()));
                            },
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset('assets/buttons/myItems.png'))),
                    ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: FlatButton(
                            onPressed: (){
                              Navigator.push(context, SlideLeftRoute(page: ChatPage()));
                            },
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset('assets/buttons/chatIcon.png'))),  
                    ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: FlatButton(
                            onPressed: (){
                              Navigator.push(context, SlideLeftRoute(page: MyTrackingPage()));
                            },
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset('assets/buttons/TrackOrder.png'))),                            
                    
                  ],
                ),
              ),
            ),

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




