
import 'package:donation_system/Classes/BottomNavigationClass.dart';
import 'package:donation_system/Presentation/custom_icons_icons.dart';
import 'package:donation_system/Variables/color.dart';
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
        onTap: (index) => navigation.onTapTabBar(index),
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
