import 'package:donation_system/Widgets/PagePlaceHolder.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:flutter/material.dart';

class MyWishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize( 
      preferredSize: Size.fromHeight(45.0),
      child: SubPagesAppBar(
        title: "My Wishlist",
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: PagePlaceHolder(
            image: 'assets/placeholders/nowish.png', 
            header: "No wishes", 
            details: 'No wishes listed available, try add some products you wish you have.'
          )
        ),
      ),
    );
  }
}