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
      body: SafeArea(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  child: Image(
                    image: AssetImage(
                      'assets/placeholders/noNewsfound.png',
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'OOPS!',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'There are no recent convo',
            ),
            Text(
              'Don\t be lonely, start a convo!!!',
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
        ),
    );
  }
}