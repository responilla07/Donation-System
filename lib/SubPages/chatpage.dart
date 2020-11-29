import 'package:donation_system/Widgets/PagePlaceHolder.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize( 
      preferredSize: Size.fromHeight(45.0),
      child: SubPagesAppBar(
        title: "Chat List",
        onTap: () {
          Navigator.pop(context);
        },
      ),
    ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: PagePlaceHolder(
            image: 'assets/placeholders/nochat.png', 
            header: "Empty chat", 
            details: 'No current conversation available, try to chat someone you may know.'
          )
        ),
      ),
    );
  }
}