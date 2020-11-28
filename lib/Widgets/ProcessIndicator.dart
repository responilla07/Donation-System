
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/size.dart';
import 'package:flutter/material.dart';

class ProcessIndicator extends StatefulWidget {
  @override
  _ProcessIndicatorState createState() => _ProcessIndicatorState();
}

class _ProcessIndicatorState extends State<ProcessIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: PhoneSize(context).width,
      color: Colors.black38,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(redSecondaryColor)
          ),
          SizedBox(
            height: 20.0,
          ),
          new Text(
            "Loading...",
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          )
        ],
      ),
    );
  }
}
