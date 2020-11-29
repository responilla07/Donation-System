import 'package:donation_system/Widgets/PagePlaceHolder.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:flutter/material.dart';

class MyTrackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize( 
      preferredSize: Size.fromHeight(45.0),
      child: SubPagesAppBar(
        title: "Tracking Order",
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: PagePlaceHolder(
            image: 'assets/placeholders/Nodelivery.png', 
            header: "Empty order", 
            details: 'No current order available, you can buy products at market place.'
          )
        ),
      ),
    );
  }
}