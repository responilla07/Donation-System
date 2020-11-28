import 'package:donation_system/Variables/color.dart';
import 'package:flutter/material.dart';

class CacheNetworkImagePlaceholder extends StatelessWidget {
  const CacheNetworkImagePlaceholder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(redSecondaryColor)
        ),
      ],
    );
  }
}
