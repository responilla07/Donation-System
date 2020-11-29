import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_system/Models/CharityModel.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:flutter/material.dart';

class MyCharityListClass {
  
  DocumentSnapshot lastDocument;

  QuerySnapshot querySnapshot;
  ValueNotifier<List<CharityModel>> myListOfCharity = ValueNotifier<List<CharityModel>>(List<CharityModel>());
  
  String searchingText = "";
  bool isTextChanged = false;
  ValueNotifier<bool> isEnd = ValueNotifier<bool>(false);
  ValueNotifier<bool> isStart = ValueNotifier<bool>(true);
  ValueNotifier<bool> isPullUp = ValueNotifier<bool>(false);
  ValueNotifier<bool> isDispose = ValueNotifier<bool>(false);
  ValueNotifier<bool> isFetching = ValueNotifier<bool>(false);
  

  ScrollController scrollController = ScrollController();
  TextEditingController controllerOfSearch = TextEditingController();

  Future<dynamic> getDataFromFirestore(String query) async {
    try {
      if(lastDocument != null){
        if (isPullUp.value) {
          querySnapshot = await FirebaseFirestore.instance.collection("Charities").where('founderID', isEqualTo: loggedUser.uid).orderBy('dateCreated', descending: false).limit(6).startAfterDocument(lastDocument).get();
          if (querySnapshot.docs.length > 0) {
            List<CharityModel> listChar = List<CharityModel>();
            for (var i = 0; i < querySnapshot.docs.length; i++) {
              listChar.add(CharityModel(querySnapshot.docs[i].id, querySnapshot.docs[i].data()));
            }
            lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
            myListOfCharity.value.addAll(listChar);
          }
          whenCompleteFetchingInPullUp();
        }
      } else {
        isFetching.value = true;
        myListOfCharity.value.clear();
        querySnapshot = await FirebaseFirestore.instance.collection("Charities").where('founderID', isEqualTo: loggedUser.uid).orderBy('dateCreated', descending: false).limit(6).get();
        List<CharityModel> listChar = List<CharityModel>();
        for (var i = 0; i < querySnapshot.docs.length; i++) {
          listChar.add(CharityModel(querySnapshot.docs[i].id, querySnapshot.docs[i].data()));
        }
        myListOfCharity.value = listChar;
        if (querySnapshot.docs.length > 0) {
          lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1]; 
        }
      }
    } catch (e) {
      print(e);
    }
    return myListOfCharity.value ?? List<dynamic>();
  }

  int findeCharityPosition(id){
    int findCharityPosition = 0;
    for(int itemList = 0; itemList < myListOfCharity.value.length; itemList++){
      var docID = myListOfCharity.value[itemList].id;
      if(docID == id){
        findCharityPosition = itemList;
        break;
      }
    }
    return findCharityPosition;
  }

  ////THIS IS FOR THE [CARDS OF THE CHARITY]
  currentQueuCardChildrens(CharityModel charityModel) {
    List<Widget> charityCardChildren = [];
    List<String> charityDetailsSample = [ 
      charityModel.contact,
      (charityModel.location.state + ', ' + charityModel.location.province + (charityModel.location.street == '' ? ('') : (', ' + charityModel.location.street)) ),
      charityModel.description,
    ];
    
    charityCardChildren.add( Text( //Charity name
      charityModel.name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Colors.white,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    ),);
    
    for (int detail = 0; detail < 3; detail++) {
      charityCardChildren.add( detail == 2 ? SizedBox(height: 5,) : Container());
      charityCardChildren.add( Text(
        charityDetailsSample[detail],
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontStyle: detail == 2 ? FontStyle.italic : null
        ),
        maxLines: detail == 0 || detail == 1 ? 1 : 2,
        overflow: TextOverflow.ellipsis,
      ),);
    }

    return charityCardChildren;
  }

  ///THIS FOR DONE FETCHING DATA AFTER [PULL UP]
  Future<dynamic> whenCompleteFetchingInPullUp() {
    isPullUp.value = false;
    return null;
  }
  
}