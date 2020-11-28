import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_system/Models/CharityModel.dart';
import 'package:flutter/cupertino.dart';

class CharitablePickerClass {
  
  DocumentSnapshot lastDocument;
  QuerySnapshot querySnapshot;
  ValueNotifier<List<CharityModel>> listofCharity = ValueNotifier<List<CharityModel>>(List<CharityModel>());

  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();

  String searchingText = "";
  bool isTextChanged = false;
  
  ValueNotifier<bool> isEnd = ValueNotifier<bool>(false);
  ValueNotifier<bool> isStart = ValueNotifier<bool>(true);
  ValueNotifier<bool> isPullUp = ValueNotifier<bool>(false);
  ValueNotifier<bool> isDispose = ValueNotifier<bool>(false);
  ValueNotifier<bool> isFetching = ValueNotifier<bool>(false);

  Future<dynamic> getDataFromFirestore(String query) async {
    // try {
      print(lastDocument);
      if (textController.text.length > 0) {
        if(lastDocument != null){
          if (isPullUp.value) {
            querySnapshot = await FirebaseFirestore.instance.collection("Charities").where("searchKey", arrayContains: query).orderBy('dateCreated', descending: true).limit(6).startAfterDocument(lastDocument).get();
            if (querySnapshot.docs.length > 0) {
              List<CharityModel> charity = List<CharityModel>();
              for (var i = 0; i < querySnapshot.docs.length; i++) {
                charity.add(CharityModel(querySnapshot.docs[i].id, querySnapshot.docs[i].data())); 
              }
              listofCharity.value.addAll(charity);
              lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
            }
            whenCompleteFetchingInPullUp();
          } else {
          }
        } else {
          isFetching.value = true;
          searchingText = query;
          listofCharity.value.clear();
          querySnapshot = await FirebaseFirestore.instance.collection("Charities").where("searchKey", arrayContains: query).orderBy('dateCreated', descending: true).limit(20).get();
          List<CharityModel> charity = List<CharityModel>();
          for (var i = 0; i < querySnapshot.docs.length; i++) {
            charity.add(CharityModel(querySnapshot.docs[i].id, querySnapshot.docs[i].data()));
          }
          listofCharity.value = charity;
          if (querySnapshot.docs.length > 0) {
            lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
          }
        }
      } else {
        if(lastDocument != null){
          if (isPullUp.value) {
            querySnapshot = await FirebaseFirestore.instance.collection("Charities").orderBy('dateCreated', descending: true).limit(20).startAfterDocument(lastDocument).get();
            if (querySnapshot.docs.length > 0) {
              List<CharityModel> charity = List<CharityModel>();
              for (var i = 0; i < querySnapshot.docs.length; i++) {
                charity.add(CharityModel(querySnapshot.docs[i].id, querySnapshot.docs[i].data()));
              }
              lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
              listofCharity.value.addAll(charity);
            }
            whenCompleteFetchingInPullUp();
          }
        } else {
          isFetching.value = true;
          listofCharity.value.clear();
          querySnapshot = await FirebaseFirestore.instance.collection("Charities").orderBy('dateCreated', descending: true).limit(20).get();
          List<CharityModel> charity = List<CharityModel>();
          for (var i = 0; i < querySnapshot.docs.length; i++) {
            charity.add(CharityModel(querySnapshot.docs[i].id, querySnapshot.docs[i].data()));
          }
          listofCharity.value = charity;
          if (querySnapshot.docs.length > 0) {
            lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1]; 
          }
        }
      }
    // } catch (e) {
    //   print(e);
    // }
    return listofCharity.value ?? List<dynamic>();
  }


  int findeCharityPosition(id){
    int findCharityPosition = 0;
    for(int itemList = 0; itemList < listofCharity.value.length; itemList++){
      var docID = listofCharity.value[itemList].id;
      if(docID == id){
        findCharityPosition = itemList;
        break;
      }
    }
    return findCharityPosition;
  }
  ///THIS FOR DONE FETCHING DATA AFTER [PULL UP]
  Future<dynamic> whenCompleteFetchingInPullUp() async {
    await Future.delayed(const Duration(seconds: 8), null).then((value){
      isPullUp.value = false;
    });
    return null;
  }
  ///THIS IF THE DATA GET [DONE FROM FETCHING] IT FROM DATABASE
  Future<dynamic> whenCompleteFetching() {
    isTextChanged = false;
    isFetching.value = false;
    return null;
  }
}