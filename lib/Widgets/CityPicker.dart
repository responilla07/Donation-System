import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/location_data.dart';
import 'package:flutter/material.dart';

class CityPicker extends StatefulWidget {
  CityPicker({
    @required
    this.province
  });

  final String province;

  @override
  _CityPickerState createState() => _CityPickerState();
}

class _CityPickerState extends State<CityPicker> {

  @override
  Widget build(BuildContext context) {
    List<String> array = cityArray[widget.province];
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        title: Text(
          widget.province,
          style: TextStyle(
            color: redSecondaryColor,
            fontWeight: FontWeight.w600
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: new IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () => Navigator.pop(context)
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemBuilder: (context, position){
            return GestureDetector(
              onTap: (){
                Navigator.of(context).pop({"city": array[position], "province": widget.province});
              },
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: new Text(
                      array[position],
                      style: TextStyle(),
                    ),
                  ),
                  Divider(
                    height: 2.0,
                  ),
                ],
              ),
            );
          },
          itemCount: array.length,
        ),
      ),
    );
  }
}