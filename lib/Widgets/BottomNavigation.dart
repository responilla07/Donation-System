
import 'package:donation_system/Classes/BottomNavigationClass.dart';
import 'package:donation_system/Presentation/custom_icons_icons.dart';
import 'package:donation_system/SubPages/LoginPage.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/material.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    @required this.tabController,
  });

  final TabController tabController;
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  BottomNavigationClass navigation = BottomNavigationClass();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: redSecondaryColor,
      child: TabBar(
        onTap: (index) async {
          if (loggedUser == null && index == 3) {
            await Navigator.pushReplacement(context, SlideLeftRoute(page: LoginPage()));
          } else {
            navigation.onTapTabBar(index);
          }
        },
        controller: widget.tabController,
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white,
        tabs: [ 
          Tab(child: Icon( CustomIcons.charitylist,size: 25,)), 
          Tab(child: Icon( CustomIcons.market,size: 25)), 
          Tab(child: Icon( CustomIcons.charity_home )),
          Tab(child: Icon( CustomIcons.profile_outlined )),
        ],
      )
    );
  }
}
