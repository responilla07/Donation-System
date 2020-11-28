import 'package:donation_system/Widgets/AddItemPicture.dart';
import 'package:donation_system/Widgets/Button.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:donation_system/Widgets/TextField.dart';
import 'package:flutter/material.dart';

class CreateCharity extends StatefulWidget {
  @override
  _CreateCharityState createState() => _CreateCharityState();
}

class _CreateCharityState extends State<CreateCharity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize( 
        preferredSize: Size.fromHeight(45.0),
        child: SubPagesAppBar(
          title: "Create Charity ",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: ListView(

          children: <Widget>[     
            Container(height:300),
            Padding(
              padding: const EdgeInsets.only(left:10.0,right:10.0),
              child: CustomRaisedButton(
                  title: "Add Photo", 
                  onTap: () async {
                  }
                ),
            ), 
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MyTextField(controller: null, hintText: 'Name of Charity', inputFormatter: null, keyboardType: null),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MyTextField(controller: null, hintText: 'Founder', inputFormatter: null, keyboardType: null),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MyTextField(controller: null, hintText: 'Description', inputFormatter: null, keyboardType: null),
            ),
            Row(children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.fromLTRB(10,10,5,10),
                child: MyTextField(controller: null, hintText: 'Contact', inputFormatter: null, keyboardType: null),
              )),
            Expanded(child: Padding(
              padding: const EdgeInsets.fromLTRB(5,10,10,10),
              child: MyTextField(controller: null, hintText: 'Date Founded', inputFormatter: null, keyboardType: null),
            )),
            ],
            ),
             Row(children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.fromLTRB(10,10,5,10),
                child: MyTextField(controller: null, hintText: 'State', inputFormatter: null, keyboardType: null),
              )),
            Expanded(child: Padding(
              padding: const EdgeInsets.fromLTRB(5,10,10,10),
              child: MyTextField(controller: null, hintText: 'Province', inputFormatter: null, keyboardType: null),
            )),
            ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MyTextField(controller: null, hintText: 'Complete Address', inputFormatter: null, keyboardType: null),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0, right:10.0),
              child: CustomRaisedButton(
                  title: "Submit", 
                  onTap: (){}
                ),
            ),
            
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}