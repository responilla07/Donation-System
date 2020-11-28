import 'package:donation_system/Classes/AddItemClass.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Widgets/Button.dart';
import 'package:donation_system/Widgets/CharitablePicker.dart';
import 'package:donation_system/Widgets/ProvincePicker.dart';
import 'package:donation_system/Widgets/TextField.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/material.dart';

class AddItemTextField extends StatefulWidget {
  const AddItemTextField({
    @required this.button,
    @required this.addItemClass,

  });

  final CustomRaisedButton button;
  final AddItemClass addItemClass;
  @override
  _AddItemTextFieldState createState() => _AddItemTextFieldState();
}

class _AddItemTextFieldState extends State<AddItemTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          MyTextField(
            controller: widget.addItemClass.itemName, 
            hintText: "Item Name", 
            inputFormatter: null, 
            keyboardType: null
          ),
          SizedBox(height: 15,),
          MyTextField(
            controller: widget.addItemClass.price, 
            hintText: "Price", 
            inputFormatter: null, 
            keyboardType: null
          ),
          SizedBox(height: 15,),
          MyTextField(
            controller: widget.addItemClass.discount, 
            hintText: "Discount", 
            inputFormatter: null, 
            keyboardType: null
          ),
          SizedBox(height: 15,),
          MyTextField(
            controller: widget.addItemClass.stock, 
            hintText: "Stock", 
            inputFormatter: null, 
            keyboardType: null
          ),
          SizedBox(height: 15,),
          Container(
          height: 40,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, SlideLeftRoute(page: ProvincePicker())).then((value){
                      setState(() {
                        print(value['city']);
                        widget.addItemClass.state = value['city'];
                        widget.addItemClass.province = value['province'];
                      });
                    });
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        color: redSecondaryColor
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          widget.addItemClass.state,
                        style: TextStyle(
                          color: widget.addItemClass.state ==  "State" ? Colors.black54 : Colors.black,
                          fontSize: 16
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15,),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, SlideLeftRoute(page: ProvincePicker())).then((value){
                      setState(() {
                        widget.addItemClass.state = value['city'];
                        widget.addItemClass.province = value['province'];
                      });
                    });
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        color: redSecondaryColor
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.addItemClass.province,
                        style: TextStyle(
                          color: widget.addItemClass.province ==  "Province" ? Colors.black54 : Colors.black,
                          fontSize: 16
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15,),
        MyTextField(
          controller: widget.addItemClass.street, 
          hintText: "Street", 
          inputFormatter: null, 
          keyboardType: null
        ),
        SizedBox(height: 15,),
          GestureDetector(
            onTap: () {
              Navigator.push(context, SlideLeftRoute(page: ChartiablePicker())).then((value){
                setState(() {
                  widget.addItemClass.charitable = value['name'];
                  widget.addItemClass.benefitId = value['id'];
                });
              });
            },
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                  color: redSecondaryColor
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    widget.addItemClass.charitable,
                  style: TextStyle(
                    color:   widget.addItemClass.charitable == "Charitable" ? Colors.black54 : Colors.black,
                    fontSize: 16
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),

          TextField(
            controller: widget.addItemClass.description,
            decoration: new InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Description/Details",
            contentPadding: EdgeInsets.fromLTRB(10, 10, 40, 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: redSecondaryColor)
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: redSecondaryColor)
            ),
          ),
            maxLines: null,
            keyboardType: TextInputType.multiline,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: widget.button,
          )

        ],
      ),
    );
  }
}