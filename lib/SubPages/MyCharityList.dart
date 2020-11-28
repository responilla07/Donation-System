import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_system/Classes/MyCharityClass.dart';
import 'package:donation_system/Models/CharityModel.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Widgets/CharityItemCard.dart';
import 'package:donation_system/Widgets/LoaderForPagination.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/material.dart';

import 'CharityDetails.dart';

class MyCharityList extends StatefulWidget {
  @override
  _MyCharityListState createState() => _MyCharityListState();
}

class _MyCharityListState extends State<MyCharityList> {
  MyCharityListClass charityPageClass = MyCharityListClass();
  StreamSubscription<QuerySnapshot> subsOfMyOrders;

  notifier() {  }
  scrollNotifier() {
    if (!charityPageClass.isFetching.value && !charityPageClass.isEnd.value && !charityPageClass.isDispose.value) {
      if (charityPageClass.scrollController.position.atEdge) {
        if (charityPageClass.scrollController.position.pixels != 0) {
          charityPageClass.isPullUp.value = true;
          setState(() {});
        }
      }
    }
  }

  startSnapshot(){
    subsOfMyOrders = FirebaseFirestore.instance.collection('Charities').orderBy('dateCreated', descending: false).snapshots().listen((doc){
      if(!charityPageClass.isStart.value){
        for(DocumentChange doc in doc.docChanges){
          if(doc.type == DocumentChangeType.added){
            //Nothing will happen
          }else if(doc.type == DocumentChangeType.modified) {
            int index = charityPageClass.findeCharityPosition(doc.doc.id);
            CharityModel charityModel = CharityModel(doc.doc.id, doc.doc.data());

            if (charityPageClass.myListOfCharity.value[index].id == charityModel.id) {
              charityPageClass.myListOfCharity.value[index] = charityModel;
            }
            if(!charityPageClass.isDispose.value){
              setState(() {});
            }
          }else if(doc.type == DocumentChangeType.removed) {
            int index = charityPageClass.findeCharityPosition(doc.doc.id);
            CharityModel charityModel = CharityModel(doc.doc.id, doc.doc.data());
            if (charityPageClass.myListOfCharity.value[index].id == charityModel.id) {
              charityPageClass.myListOfCharity.value.removeAt(index);
            }
            if(!charityPageClass.isDispose.value){
              setState(() {});
            }
          }
        }
              setState(() {});
      }else{
        charityPageClass.isStart.value = false;
      }
    });
  }

  @override
  void initState() {
    charityPageClass.isEnd.addListener(notifier);
    charityPageClass.isStart.addListener(notifier);
    charityPageClass.isPullUp.addListener(notifier);
    charityPageClass.isDispose.addListener(notifier);
    charityPageClass.isFetching.addListener(notifier);
    charityPageClass.myListOfCharity.addListener((){setState(() {});});
    charityPageClass.scrollController.addListener(scrollNotifier);
    startSnapshot();
    super.initState();
  }

  @override
  void dispose() {
    if (subsOfMyOrders != null) {
      subsOfMyOrders.cancel();
    }
    charityPageClass.isEnd.removeListener(() { });
    charityPageClass.isStart.removeListener(() { });
    charityPageClass.isPullUp.removeListener(() { });
    charityPageClass.isDispose.removeListener(() { });
    charityPageClass.isFetching.removeListener(() { });
    charityPageClass.myListOfCharity.removeListener(() { });
    charityPageClass.scrollController.removeListener(() { });
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize( 
        preferredSize: Size.fromHeight(45.0),
        child: SubPagesAppBar(
          title: "My Charity",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButton: Container(
        height: 50, width: 50,
        decoration: BoxDecoration(
          color: redSecondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(100))
        ),
        child: IconButton(
          icon: Icon(
            Icons.add,
            color: white,
            size: 30,
          ), 
          onPressed: null
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: charityPageClass.getDataFromFirestore(charityPageClass.controllerOfSearch.text.toLowerCase()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting){
              if (charityPageClass.isFetching.value) {
                return Column(
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
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.done ){ charityPageClass.isFetching.value = false; }

            return charityPageClass.myListOfCharity.value.length != 0 ? new ListView.builder(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 15),
              itemCount: charityPageClass.myListOfCharity.value.length + 1,
              primary: false,
              controller: charityPageClass.scrollController,
              itemBuilder: (context, index) {
                return (index == (charityPageClass.myListOfCharity.value.length))
                ? LoaderForPagination(
                  isPullUp: charityPageClass.isPullUp.value,
                  loaderHeight: 40,
                  loaderWidth: 40,
                )
                : Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () async {
                      await Navigator.push(context, SlideLeftRoute(page: CharityDetailsPage(charityModel: charityPageClass.myListOfCharity.value[index])));
                    },
                    child: CharityItemCard(charityModel: charityPageClass.myListOfCharity.value[index],)
                  )
                );
              },
            ) : Text("Create place holder here"); //TODO Create placeholder for this page
          }
        ),
      ),
    );
  }
}
