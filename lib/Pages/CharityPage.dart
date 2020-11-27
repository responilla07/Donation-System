import 'package:flutter/material.dart';

class CharityPage extends StatefulWidget {
  @override
  _CharityPageState createState() => _CharityPageState();
}

class _CharityPageState extends State<CharityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Use this for adding new pages',
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
