import 'package:donation_system/Widgets/Button.dart';
import 'package:donation_system/Widgets/TextField.dart';
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
              'Edit',
            ),

            MyTextField(
              controller: null, 
              hintText: "Text", 
              inputFormatter: null, 
              keyboardType: null
            ),
            
            CustomRaisedButton(
              onTap : (){},
              title: "Sample",
            ),

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
