
import 'package:donation_system/Classes/BottomNavigationClass.dart';
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
        tabs: [ //TODO IVAN change all this icons using our custom icons please do
          Tab(child: Icon( Icons.ac_unit )), 
          Tab(child: Icon( Icons.access_alarm )), 
          Tab(child: Icon( Icons.home )),
          Tab(child: Icon( Icons.card_giftcard )),
          Tab(child: Icon( Icons.person )),
        ],
      )
    );
  }
}
