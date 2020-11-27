
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void testFireStore() async {
  DocumentReference records =
      FirebaseFirestore.instance.collection('test').doc();
  await records.set({'test': 'testData'});
}


void testToast(BuildContext context) {
  Toast.show("Toast plugin app", context,
      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
}

void testUrl() async {
  const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void takePicture() async {
  FirebaseStorage storage = FirebaseStorage.instance;
  final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
  
  File file = File(pickedFile.path);

  String dlref;
  
  Reference reference = storage.ref().child("sendedIMG_150x150");
  UploadTask uploadTask = reference.putFile(file);
  await uploadTask.then((taskSnapshot) async{
      dlref = await taskSnapshot.ref.getDownloadURL();
  });
  
  print(dlref);
}



Future<void> showScanner() async {
  String cameraScanResult = await scanner.scan();
  print(cameraScanResult);
}



class DatePickers extends StatefulWidget {
  @override
  _DatePickersState createState() => _DatePickersState();
}

class _DatePickersState extends State<DatePickers> {

  var _dateTime;
  String bday;

  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
      Expanded(
          flex: 1,
          child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: GestureDetector(
            onTap: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(1, 1, 1991),
                  maxTime: DateTime.now(), onChanged: (date) {
                print('change $date');
              }, onConfirm: (date) {
                setState(() {
                  _dateTime = date;
                  
                  bday =
                      '${_dateTime.toIso8601String()[5] != '0' ? _dateTime.toIso8601String().substring(5, 7) : _dateTime.toIso8601String().substring(6, 7)}/${_dateTime.toIso8601String()[8] != '0' ? _dateTime.toIso8601String().substring(8, 10) : _dateTime.toIso8601String().substring(9, 10)}/${_dateTime.toIso8601String().substring(0, 4)}';
                  print(bday);
                });
              }, currentTime: DateTime.now(), locale: LocaleType.en);
            },
            child: Container(
              height: 60.0,
              //width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue[200]),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 8),
                  child: Text(
                    _dateTime == null ? 'Date' : 'From: $bday',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),
            ),
          ),
      ),
      ),
    ],
  );
  }
}