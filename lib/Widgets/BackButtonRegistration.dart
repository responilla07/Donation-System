import 'package:donation_system/Variables/color.dart';
import 'package:flutter/material.dart';

class BackButtonRegistration extends StatelessWidget {
 const BackButtonRegistration({
    @required this.onTap,
  });

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: redSecondaryColor,
          ),
          Text('Back'),
        ],
      )
    );
  }
}