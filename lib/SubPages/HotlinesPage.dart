import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Pages/HomePage.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';

import 'package:flutter/material.dart';

class HotlinesPage extends StatefulWidget {
  @override
  _HotlinesPageState createState() => _HotlinesPageState();
}

class _HotlinesPageState extends State<HotlinesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize( 
        preferredSize: Size.fromHeight(45.0),
        child: SubPagesAppBar(
          title: "Emergency Hotlines",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    'NDRRMC Hotlines for Luzon',
                    style: TextStyle(
                      color: redSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                HotlineNumbers(
                  hotline:
                  '(02) 8421-1918  -  Office of Civil Defense',
                ),
                HotlineNumbers(
                  hotline:
                  '(072) 607-6528  -  OCD Region I',
                ),
                HotlineNumbers(
                  hotline:
                  '(049) 531-7266  -  OCD Region IV-A',
                ),
                HotlineNumbers(
                  hotline:
                  '(043) 723-4248  -  NDRRMC Region IV-B',
                ),
                HotlineNumbers(
                  hotline:
                  '(074) 304-2256  -  NDRRMC CAR',
                ),
                Divider(color: Colors.black,),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    'OCD Office Telephone Directory',
                    style: TextStyle(
                      color: redSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                HotlineNumbers(
                  hotline:
                  '(072) 607-6528  -  Region I',
                ),
                HotlineNumbers(
                  hotline:
                  '(078) 304-1630  -  Region II',
                ),
                HotlineNumbers(
                  hotline:
                  '(045) 455-1526  -  Region III',
                ),
                HotlineNumbers(
                  hotline:
                  '(049) 834-4344  -  Region IV-A',
                ),
                HotlineNumbers(
                  hotline:
                  '(043) 723-4248  -  Region IV-B',
                ),
                HotlineNumbers(
                  hotline:
                  '(052) 742-1176  -  Region V',
                ),
                HotlineNumbers(
                  hotline:
                  '(032) 416-5025  -  Region VII',
                ),
                Divider(color: Colors.black,),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    'Department of Social Welfare and Development',
                    style: TextStyle(
                      color: redSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                HotlineNumbers(
                  hotline:
                  '0918-912-2813  -  Text Hotline',
                ),
                HotlineNumbers(
                  hotline:
                  '(02) 8931-8101  -  Trunk line',
                ),
                HotlineNumbers(
                  hotline:
                  '(02) 8856-3665  -  Disaster Response Unit',
                ),
                Divider(color: Colors.black,),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    'Red Cross',
                    style: TextStyle(
                      color: redSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                HotlineNumbers(
                  hotline:
                  '143  -  Hotline',
                ),
                HotlineNumbers(
                  hotline:
                  '(02) 8527-0000  -  National Blood Center',
                ),
                HotlineNumbers(
                  hotline:
                  '(02) 8790-2300  -  Trunk line',
                ),
                HotlineNumbers(
                  hotline:
                  '(02) 8790-2300  -  Emergency Response Unit',
                ),
                Divider(color: Colors.black,),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    'Philippine National Police (PNP) ',
                    style: TextStyle(
                      color: redSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                HotlineNumbers(
                  hotline:
                  '117  -  Emergency Hotline',
                ),
                HotlineNumbers(
                  hotline:
                  '0917-847-5757  -  Text hotline',
                ),
                Divider(color: Colors.black,),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    'Bureau of Fire Protection (BFP)',
                    style: TextStyle(
                      color: redSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                 HotlineNumbers(
                  hotline:
                  '(02) 8426-0219  -  Direct line',
                ),
                Divider(color: Colors.black,),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    'Philippine Coast Guard',
                    style: TextStyle(
                      color: redSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                HotlineNumbers(
                  hotline:
                  '(02) 8527-8481  -  Hotline',
                ),
                HotlineNumbers(
                  hotline:
                  '(02) 8527-8482  -  Telefax',
                ),
                HotlineNumbers(
                  hotline:
                  '0918-967-4697  -  Text hotline',
                ),
                Divider(color: Colors.black,),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    'Metro Manila Development Authority',
                    style: TextStyle(
                      color: redSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                 HotlineNumbers(
                  hotline:
                  '136  -  Hotline',
                ),
                HotlineNumbers(
                  hotline:
                  '(02) 8882-4151  -  Trunk line',
                ),
                HotlineNumbers(
                  hotline:
                  '0939-922-7161  -  Viber',
                ),
              ],
            ),
          ),
        ));
  }
}
