
import 'package:donation_system/TestFolder/testFile.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test File'),
      ),
      body: SafeArea(
        child: Container(

          child: Center(
            child: Column(

              children: [
                
                Container(
                        margin: EdgeInsets.only(left: 5),
                        width: 150.0,
                        height: 150.0,
                        decoration: new BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 5,
                          ),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.8),
                          //     spreadRadius: 2,
                          //     blurRadius: 5,
                          //     offset: Offset(0, 3),
                          //   ),
                          // ],
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/googlelogo.png'),
                          ),
                        ),
                      ),

                FlatButton(
                  color: Colors.red,
                  onPressed: (){
                    showScanner();
                  }, 
                  child: Text('Press me!'),
                ),

                //datePicker(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}