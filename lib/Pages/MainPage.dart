import 'package:donation_system/Classes/MainPageClass.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:donation_system/Widgets/BottomNavigation.dart';
import 'package:donation_system/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';

import 'CharityPage.dart';
import 'HomePage.dart';
import 'MarketPage.dart';
import 'MyOrderPage.dart';
import 'MyProfilePage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  MainPageClass homePageClass = MainPageClass();

  @override
  void initState() {
    pageTitle.addListener(() {
      if (!homePageClass.isDispose) {
        setState(() {});
      }
    });
    homePageClass.tabController = TabController(length: 5, vsync: this, initialIndex: 2);
    super.initState();
  }

  @override
  void dispose() {
    homePageClass.isDispose = true;
    pageTitle.removeListener(() {});
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(0.0), child: AppBar(
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: true,
        )),
        bottomNavigationBar: BottomNavigation(
          tabController: homePageClass.tabController,
        ),
        body: SafeArea(
          child: Container(
            color: white,
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                CustomAppBar(),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [CharityPage(), MarketPage(), HomePage(), MyOrdersPage(), ProfilePage()],
                    controller: homePageClass.tabController,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
