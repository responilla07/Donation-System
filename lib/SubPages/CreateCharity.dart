import 'package:donation_system/Classes/AddItemClass.dart';
import 'package:donation_system/Widgets/AddItemPicture.dart';
import 'package:donation_system/Widgets/AddItemTextField.dart';
import 'package:donation_system/Widgets/Button.dart';
import 'package:donation_system/Widgets/ProcessIndicator.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class CreateCharity extends StatefulWidget {
  @override
  _CreateCharityState createState() => _CreateCharityState();
}

class _CreateCharityState extends State<CreateCharity> {
  AddItemClass addItemClass = AddItemClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize( 
        preferredSize: Size.fromHeight(45.0),
        child: SubPagesAppBar(
          title: "Add Item ",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            ListView(
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
                      setState(() { addItemClass.isProcessing = true; });
                      if(addItemClass.validate('fields')){
                        addItemClass.addItem(context).then((success){
                          if (success) {
                            Navigator.pop(context);
                          }
                          setState(() { addItemClass.isProcessing = false; });
                        });
                      }
                      else{
                        Toast.show( addItemClass.validate('message'), context, duration: 3, gravity: Toast.BOTTOM);
                        setState(() { addItemClass.isProcessing = false; });
                      }
                    }
                  ),
                  addItemClass: addItemClass, 
                ),

              ],
            ),
            addItemClass.isProcessing ? ProcessIndicator() : Container()
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
