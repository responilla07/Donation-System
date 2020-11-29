import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:flutter/material.dart';

class MyWishList extends StatefulWidget {
  @override
  _MyWishListState createState() => _MyWishListState();
}

class _MyWishListState extends State<MyWishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: SubPagesAppBar(
          title: "My Wish List",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}