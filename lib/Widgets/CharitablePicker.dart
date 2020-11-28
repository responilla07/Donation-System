import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_system/Classes/CharitablePickerClass.dart';
import 'package:donation_system/Models/CharityModel.dart';
import 'package:donation_system/Models/ItemModel.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:flutter/material.dart';

class ChartiablePicker extends StatefulWidget {
  @override
  _ChartiablePickerState createState() => _ChartiablePickerState();
}

class _ChartiablePickerState extends State<ChartiablePicker> {
  CharitablePickerClass charitableClass = CharitablePickerClass();
  StreamSubscription<QuerySnapshot> subsOfMyOrders;

  notifier() {  }
  scrollNotifier() {
    if (!charitableClass.isFetching.value && !charitableClass.isEnd.value && !charitableClass.isDispose.value) {
      if (charitableClass.scrollController.position.atEdge) {
        if (charitableClass.scrollController.position.pixels != 0) {
          charitableClass.isPullUp.value = true;
          setState(() {});
        }
      }
    }
  }

  startSnapshot(){
    subsOfMyOrders = FirebaseFirestore.instance.collection('Charities').orderBy('dateCreated', descending: true).snapshots().listen((doc){
      if(!charitableClass.isStart.value){
        for(DocumentChange doc in doc.docChanges){
          if(doc.type == DocumentChangeType.added){
            //Nothing will happen
          }else if(doc.type == DocumentChangeType.modified) {
            int index = charitableClass.findeCharityPosition(doc.doc.id);
            CharityModel listofCharity = CharityModel(doc.doc.id, doc.doc.data());

            if (charitableClass.listofCharity.value[index].id == listofCharity.id) {
              charitableClass.listofCharity.value[index] = listofCharity;
            }
            if(!charitableClass.isDispose.value){
              setState(() {});
            }
          }else if(doc.type == DocumentChangeType.removed) {
            int index = charitableClass.findeCharityPosition(doc.doc.id);
            ItemModel itemModel = ItemModel(doc.doc.id, doc.doc.data());
            if (charitableClass.listofCharity.value[index].id == itemModel.id) {
              charitableClass.listofCharity.value.removeAt(index);
            }
            if(!charitableClass.isDispose.value){
              setState(() {});
            }
          }
        }
              setState(() {});
      }else{
        charitableClass.isStart.value = false;
      }
    });
  }

  @override
  void initState() {
    charitableClass.isEnd.addListener(notifier);
    charitableClass.isStart.addListener(notifier);
    charitableClass.isPullUp.addListener(notifier);
    charitableClass.isDispose.addListener(notifier);
    charitableClass.isFetching.addListener(notifier);
    charitableClass.listofCharity.addListener(notifier);
    charitableClass.scrollController.addListener(scrollNotifier);
    charitableClass.textController.addListener(() { setState(() {}); });
    startSnapshot();
    super.initState();
  }

  @override
  void dispose() {
    if (subsOfMyOrders != null) {
      subsOfMyOrders.cancel();
    }
    charitableClass.isEnd.removeListener(() { });
    charitableClass.isStart.removeListener(() { });
    charitableClass.isPullUp.removeListener(() { });
    charitableClass.isDispose.removeListener(() { });
    charitableClass.isFetching.removeListener(() { });
    charitableClass.listofCharity.removeListener(() { });
    charitableClass.textController.removeListener(() { });
    charitableClass.scrollController.removeListener(() { });
    
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize( 
        preferredSize: Size.fromHeight(45.0),
        child: SubPagesAppBar(
          title: "Choose Charitable",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: ()=> FocusScope.of(context).requestFocus(new FocusNode()),
        child: Container(
          color: white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding( // Search field 
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      height: 40,
                      child: new TextFormField(
                        controller: charitableClass.textController,
                        onChanged: (value) {
                          charitableClass.querySnapshot = null;
                          charitableClass.isFetching.value = true;
                          charitableClass.lastDocument = null;
                          charitableClass.listofCharity.value = List<dynamic>(); 
                          charitableClass.isTextChanged = true;

                          // if (value.length > 0) {
                          //   // isInMainSearchService = true;
                          // } else {
                          //   // isInMainSearchService = false;
                          //   charitableClass.whenCompleteFetching();
                          // }
                          setState(() {});
                        },
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'search',
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
                      ),
                    ),
                  ),
                ),
                FutureBuilder(
                  future: charitableClass.getDataFromFirestore(charitableClass.textController.text.toLowerCase()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting){
                      if (charitableClass.isFetching.value) {
                        return Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(redSecondaryColor)
                              ),
                              SizedBox(height: 15,),
                              Text(
                                'Loading...',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 8
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    }

                    if (snapshot.connectionState == ConnectionState.done ){ charitableClass.isFetching.value = false; }

                    return charitableClass.listofCharity.value.length != 0 ? Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, position){
                          return GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop({'name' : charitableClass.listofCharity.value[position].name, 'id' :charitableClass.listofCharity.value[position].id });
                            },
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: new Text(
                                    charitableClass.listofCharity.value[position].name,
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
                        itemCount: charitableClass.listofCharity.value.length,
                      ),
                    ) : Text("Create place holder here"); //TODO Create placeholder for this page
                  }
                ),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}