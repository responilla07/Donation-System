import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_system/Models/ItemModel.dart';
import 'package:flutter/cupertino.dart';

class MarketPageClass {
  
  DocumentSnapshot lastDocument;
  QuerySnapshot querySnapshot;
  ValueNotifier<List<ItemModel>> listOfItems = ValueNotifier<List<ItemModel>>(List<ItemModel>());

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
            querySnapshot = await FirebaseFirestore.instance.collection("Products").where("searchKey", arrayContains: query).orderBy('dateCreated', descending: true).limit(6).startAfterDocument(lastDocument).get();
            if (querySnapshot.docs.length > 0) {
              List<ItemModel> listChar = List<ItemModel>();
              for (var i = 0; i < querySnapshot.docs.length; i++) {
                listChar.add(ItemModel(querySnapshot.docs[i].id, querySnapshot.docs[i].data()));
              }
              listOfItems.value.addAll(listChar);
              lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
            }
            whenCompleteFetchingInPullUp();
          } else {
          }
        } else {
          isFetching.value = true;
          searchingText = query;
          listOfItems.value.clear();
          querySnapshot = await FirebaseFirestore.instance.collection("Products").where("searchKey", arrayContains: query).orderBy('dateCreated', descending: true).limit(6).get();
          List<ItemModel> listChar = List<ItemModel>();
          for (var i = 0; i < querySnapshot.docs.length; i++) {
            listChar.add(ItemModel(querySnapshot.docs[i].id, querySnapshot.docs[i].data()));
          }
          listOfItems.value = listChar;
          if (querySnapshot.docs.length > 0) {
            lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
          }
        }
      } else {
        if(lastDocument != null){
          if (isPullUp.value) {
            querySnapshot = await FirebaseFirestore.instance.collection("Products").orderBy('dateCreated', descending: true).limit(6).startAfterDocument(lastDocument).get();
            if (querySnapshot.docs.length > 0) {
              List<ItemModel> listChar = List<ItemModel>();
              for (var i = 0; i < querySnapshot.docs.length; i++) {
                listChar.add(ItemModel(querySnapshot.docs[i].id, querySnapshot.docs[i].data()));
              }
              lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
              listOfItems.value.addAll(listChar);
            }
            whenCompleteFetchingInPullUp();
          }
        } else {
          isFetching.value = true;
          listOfItems.value.clear();
          querySnapshot = await FirebaseFirestore.instance.collection("Products").orderBy('dateCreated', descending: true).limit(6).get();
          List<ItemModel> listChar = List<ItemModel>();
          for (var i = 0; i < querySnapshot.docs.length; i++) {
            listChar.add(ItemModel(querySnapshot.docs[i].id, querySnapshot.docs[i].data()));
          }
          listOfItems.value = listChar;
          if (querySnapshot.docs.length > 0) {
            lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1]; 
          }
        }
      }
    // } catch (e) {
    //   print(e);
    // }
    return listOfItems.value ?? List<dynamic>();
  }


  int findeCharityPosition(id){
    int findCharityPosition = 0;
    for(int itemList = 0; itemList < listOfItems.value.length; itemList++){
      var docID = listOfItems.value[itemList].id;
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