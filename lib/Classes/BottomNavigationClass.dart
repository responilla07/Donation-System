

import 'package:donation_system/Variables/global.dart';

class BottomNavigationClass {
  onTapTabBar(index) {
    if (index == 0) {
      pageTitle.value = "Charity List ";
    } else if (index == 1) {
      pageTitle.value = "Market Place";
    } else if (index == 2) {
      pageTitle.value = "Home";
    } else if (index == 3) {
      pageTitle.value = "My Orders";
    } else {
      pageTitle.value = "My Profile";
    }
  }
}