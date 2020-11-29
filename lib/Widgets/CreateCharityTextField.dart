import 'package:donation_system/Classes/createCharityClass.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Widgets/Button.dart';
import 'package:donation_system/Widgets/ProvincePicker.dart';
import 'package:donation_system/Widgets/TextField.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


class CreateCharityTextField extends StatefulWidget {
  const CreateCharityTextField({
    @required this.button,
    @required this.createCharityClass,

  });

  final CustomRaisedButton button;
  final CreateCharityClass createCharityClass;
  @override
  _CreateCharityTextFieldState createState() => _CreateCharityTextFieldState();
}

class _CreateCharityTextFieldState extends State<CreateCharityTextField> {
  var _dateTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          MyTextField(
            controller: widget.createCharityClass.itemName, 
            hintText: "Charity Name", 
            inputFormatter: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z\-' ]")) ],
            keyboardType: null
          ),
          SizedBox(height: 15,),
          MyTextField(
            controller: widget.createCharityClass.contact, 
            hintText: "Contact", 
             inputFormatter: [FilteringTextInputFormatter.allow(RegExp("[0-9\-\(\)\+]")) ],	
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
                        widget.createCharityClass.state = value['city'];
                        widget.createCharityClass.province = value['province'];
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
                          widget.createCharityClass.state,
                        style: TextStyle(
                          color: widget.createCharityClass.state ==  "State" ? Colors.black54 : Colors.black,
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
                        widget.createCharityClass.state = value['city'];
                        widget.createCharityClass.province = value['province'];
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
                        widget.createCharityClass.province,
                        style: TextStyle(
                          color: widget.createCharityClass.province ==  "Province" ? Colors.black54 : Colors.black,
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
          controller: widget.createCharityClass.street, 
          hintText: "Street", 
          inputFormatter: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z&@&/,.0-9\-\(\)\+]")) ], 
          keyboardType: null
        ),
        SizedBox(height: 15,),
        GestureDetector(
          onTap: () {
            DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime(1, 1, 1991),
                maxTime: DateTime.now(), onChanged: (date) {
              
            }, onConfirm: (date) {
              setState(() {
                _dateTime = date;
                widget.createCharityClass.date =
                    '${_dateTime.toIso8601String()[5] != '0' ? _dateTime.toIso8601String().substring(5, 7) : _dateTime.toIso8601String().substring(6, 7)}/${_dateTime.toIso8601String()[8] != '0' ? _dateTime.toIso8601String().substring(8, 10) : _dateTime.toIso8601String().substring(9, 10)}/${_dateTime.toIso8601String().substring(0, 4)}';
                 //print(widget.createCharityClass.date);
              });
            }, currentTime: DateTime.now(), locale: LocaleType.en);
          },
          child: Container(
            height: 40.0,
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color:redSecondaryColor),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _dateTime == null ? 'Date' : widget.createCharityClass.date,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 15,),
          TextField(
            controller: widget.createCharityClass.description,
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