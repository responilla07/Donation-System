import 'package:donation_system/Variables/color.dart';
import 'package:flutter/material.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({
    @required this.fullname,
    @required this.email,
    @required this.contact,
    @required this.state,
    @required this.province,
    @required this.street,

  });
  final String fullname;
  final String email;
  final String contact;
  final String state;
  final String province;
  final String street;
  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            widget.fullname,
            style: TextStyle(
              fontSize: 22,
              color: redSecondaryColor,
            )
          ),
          Text(
            widget.email,
            style: TextStyle(
              fontSize: 14,
            )
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            widget.contact,
            style: TextStyle(
              fontSize: 14,
            )
          ),
          
          Text(
            '${widget.province} ${widget.state}',
            style: TextStyle(
              fontSize: 14,
            )
          ),
          
          Text(
            widget.street,
            style: TextStyle(
              fontSize: 14,
            )
          ),
        ],
      ),
    );
  }
}