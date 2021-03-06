import 'package:donation_system/Models/UserModel.dart';
import 'package:donation_system/Pages/MainPage.dart';
import 'package:donation_system/SubPages/LoginPage.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  bool isDisposed = false;
  
  navigateToDesignatedPage() async {
    await Future.delayed(const Duration(milliseconds: 5000), null);
    myUserDetails.addListener(() {
      if(!isDisposed){
        setState(() {});
      }
    });
    
    loggedUser = auth.currentUser;

    if (loggedUser == null) {
      await Navigator.pushReplacement(context, SlideLeftRoute(page: LoginPage()));
    } else {
      var userRef = db.collection("UserDetails").doc(loggedUser.uid);

        await userRef.get().then((doc) {
          myUserDetails.value = UserDetailsModel(doc.id, doc.data());
        });

      await Navigator.pushReplacement(context, SlideLeftRoute(page: MainPage()));
    }

  }

  @override
  void initState() {
    navigateToDesignatedPage();
    super.initState();
  }

  @override
  void dispose() {
    isDisposed = true;
    myUserDetails.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 75.0, right: 75.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: Column(
                    children: <Widget>[
                      CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(redSecondaryColor))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
