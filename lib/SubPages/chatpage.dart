import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: SubPagesAppBar(
          title: "Chat Page",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}