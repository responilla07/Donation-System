import 'package:flutter/material.dart';

class HotlinesPage extends StatefulWidget {
  @override
  _HotlinesPageState createState() => _HotlinesPageState();
}

class _HotlinesPageState extends State<HotlinesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotlines HERE'),
        centerTitle: true,
      ),
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
