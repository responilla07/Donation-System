import 'package:donation_system/Classes/AddItemClass.dart';
import 'package:donation_system/Widgets/AddItemPicture.dart';
import 'package:donation_system/Widgets/AddItemTextField.dart';
import 'package:donation_system/Widgets/Button.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  AddItemClass addItemClass = AddItemClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize( //TODO Eto ang gamitin na app bar sa ibang sub pages
        preferredSize: Size.fromHeight(45.0),
        child: SubPagesAppBar(
          title: "Add Item ",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            
            AddItemPicture(
              button: CustomRaisedButton(
                title: "Add Photo", 
                onTap: () async {
                  if(addItemClass.imageUrl.length != 3){
                    String temp = await addItemClass.getPhoto();
                    setState(()  {
                      addItemClass.imageUrl.add(temp);
                    });
                  }
                }
              ), 
              addItemClass: addItemClass
            ),

            AddItemTextField(
              button:  CustomRaisedButton(
                title: "Submit", 
                onTap: (){
                  if(addItemClass.validate('fields')){
                    
                  }
                  else{
                    Toast.show( addItemClass.validate('message'), context, duration: 3, gravity: Toast.BOTTOM);
                  }
                }
              ),
              addItemClass: addItemClass, 
            ),

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
