import 'package:flutter/material.dart';

class PlaceHolder extends StatelessWidget {
  const PlaceHolder(
      {Key key,
      @required this.image,
      @required this.header,
      @required this.details})
      : super(key: key);

  final String image;
  final String header;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          child: Image(
            image: AssetImage(
              '$image',
            ),
          ),
        ),
        Text(
          '$header',
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '$details',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
