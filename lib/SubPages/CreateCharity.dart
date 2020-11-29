
import 'package:donation_system/Classes/createCharityClass.dart';
import 'package:donation_system/Widgets/Button.dart';
import 'package:donation_system/Widgets/CreateCharityAddPicture.dart';
import 'package:donation_system/Widgets/CreateCharityTextField.dart';
import 'package:donation_system/Widgets/ProcessIndicator.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class CreateCharity extends StatefulWidget {
  @override
  _CreateCharityState createState() => _CreateCharityState();
}

class _CreateCharityState extends State<CreateCharity> {
  CreateCharityClass createCharityClass1 = CreateCharityClass();

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
                    
                    CreateCharityPicture(
                      createCharityClass: createCharityClass1,
                      button: CustomRaisedButton(
                        title: "Add Photo", 
                        onTap: () async {
                          if(createCharityClass1.imageUrl.length != 3){
                            String temp = await createCharityClass1.getPhoto();
                            setState(()  {
                              createCharityClass1.imageUrl.add(temp);
                            });
                          }
                        }
                      ), 
                      
                    ),
    
                    CreateCharityTextField(
                      createCharityClass: createCharityClass1,
                  button:  CustomRaisedButton(
                    title: "Submit", 
                    onTap: (){
                      setState(() { createCharityClass1.isProcessing = true; });
                      if(createCharityClass1.validate('fields')){
                        createCharityClass1.addItem(context).then((success){
                          if (success) {
                            Navigator.pop(context);
                          }
                          setState(() { createCharityClass1.isProcessing = false; });
                        });
                        Toast.show("wprds", context, duration: 3, gravity: Toast.BOTTOM);
                      }
                      else{
                        Toast.show( createCharityClass1.validate('message'), context, duration: 3, gravity: Toast.BOTTOM);
                        setState(() { createCharityClass1.isProcessing = false; });
                      }
                    }
                  ),
                  
                ),

              ],
            ),
            createCharityClass1.isProcessing ? ProcessIndicator() : Container()
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
