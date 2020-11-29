import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_system/Models/CharityModel.dart';
import 'package:flutter/material.dart';

class CharityPageClass {
  
  DocumentSnapshot lastDocument;

  QuerySnapshot querySnapshot;
  ValueNotifier<List<CharityModel>> listOfCharity = ValueNotifier<List<CharityModel>>(List<CharityModel>());
  
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
      if (controllerOfSearch.text.length > 0) {
        if(lastDocument != null && isTextChanged){
          if (isPullUp.value) {
            querySnapshot = await FirebaseFirestore.instance.collection("Charities").where("searchKey", arrayContains: query).orderBy('dateCreated', descending: false).limit(6).startAfterDocument(lastDocument).get();
            if (querySnapshot.docs.length > 0) {
              List<CharityModel> listChar = List<CharityModel>();
              for (var i = 0; i < querySnapshot.docs.length; i++) {
                listChar.add(CharityModel(querySnapshot.docs[i].id, querySnapshot.docs[i].data()));
              }
              listOfCharity.value.addAll(listChar);
              lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
            }
            whenCompleteFetchingInPullUp();
          } else {
          }
        } else {
          isFetching.value = true;
          searchingText = query;
          listOfCharity.value.clear();
          querySnapshot = await FirebaseFirestore.instance.collection("Charities").where("searchKey", arrayContains: query).orderBy('dateCreated', descending: false).limit(6).get();
          List<CharityModel> listChar = List<CharityModel>();
          for (var i = 0; i < querySnapshot.docs.length; i++) {
            listChar.add(CharityModel(querySnapshot.docs[i].id, querySnapshot.docs[i].data()));
          }
          listOfCharity.value = listChar;
          if (querySnapshot.docs.length > 0) {
            lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1]; 
          }
        }
      } else {
        if(lastDocument != null){
          if (isPullUp.value) {
            querySnapshot = await FirebaseFirestore.instance.collection("Charities").orderBy('dateCreated', descending: false).limit(6).startAfterDocument(lastDocument).get();
            if (querySnapshot.docs.length > 0) {
              List<CharityModel> listChar = List<CharityModel>();
              for (var i = 0; i < querySnapshot.docs.length; i++) {
                listChar.add(CharityModel(querySnapshot.docs[i].id, querySnapshot.docs[i].data()));
              }
              lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
              listOfCharity.value.addAll(listChar);
            }
            whenCompleteFetchingInPullUp();
          }
        } else {
          isFetching.value = true;
          listOfCharity.value.clear();
          querySnapshot = await FirebaseFirestore.instance.collection("Charities").orderBy('dateCreated', descending: false).limit(6).get();
          List<CharityModel> listChar = List<CharityModel>();
          for (var i = 0; i < querySnapshot.docs.length; i++) {
            listChar.add(CharityModel(querySnapshot.docs[i].id, querySnapshot.docs[i].data()));
          }
          listOfCharity.value = listChar;
          if (querySnapshot.docs.length > 0) {
            lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1]; 
          }
        }
      }
    } catch (e) {
      print(e);
    }
    return listOfCharity.value ?? List<dynamic>();
  }

  int findeCharityPosition(id){
    int findCharityPosition = 0;
    for(int itemList = 0; itemList < listOfCharity.value.length; itemList++){
      var docID = listOfCharity.value[itemList].id;
      if(docID == id){
        findCharityPosition = itemList;
        break;
      }
    }
    return findCharityPosition;
  }

  ///THIS FOR DONE FETCHING DATA AFTER [PULL UP]
  Future<dynamic> whenCompleteFetchingInPullUp() {
    isPullUp.value = false;
    return null;
  }
}