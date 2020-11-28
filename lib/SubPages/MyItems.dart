import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_system/Classes/MyItemListClass.dart';
import 'package:donation_system/Formatter/number.dart';
import 'package:donation_system/Models/ItemModel.dart';
import 'package:donation_system/SubPages/AddItem.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/material.dart';

import 'MyItemsDetails.dart';

class MyItems extends StatefulWidget {
  @override
  _MyItemsState createState() => _MyItemsState();
}

class _MyItemsState extends State<MyItems> {
  MyItemListClass marketClass = MyItemListClass();
  StreamSubscription<QuerySnapshot> subsOfMyOrders;

  notifier() {  }
  scrollNotifier() {
    if (!marketClass.isFetching.value && !marketClass.isEnd.value && !marketClass.isDispose.value) {
      if (marketClass.scrollController.position.atEdge) {
        if (marketClass.scrollController.position.pixels != 0) {
          marketClass.isPullUp.value = true;
          setState(() {});
        }
      }
    }
  }

  startSnapshot(){
    subsOfMyOrders = FirebaseFirestore.instance.collection('Products').where("ownerID", isEqualTo: loggedUser.uid).orderBy('dateCreated', descending: true).snapshots().listen((doc){
      if(!marketClass.isStart.value){
        for(DocumentChange doc in doc.docChanges){
          if(doc.type == DocumentChangeType.added){
            //Nothing will happen
          }else if(doc.type == DocumentChangeType.modified) {
            int index = marketClass.findeCharityPosition(doc.doc.id);
            ItemModel itemModel = ItemModel(doc.doc.id, doc.doc.data());

            if (marketClass.listOfItems.value[index].id == itemModel.id) {
              marketClass.listOfItems.value[index] = itemModel;
            }
            if(!marketClass.isDispose.value){
              setState(() {});
            }
          }else if(doc.type == DocumentChangeType.removed) {
            int index = marketClass.findeCharityPosition(doc.doc.id);
            ItemModel itemModel = ItemModel(doc.doc.id, doc.doc.data());
            if (marketClass.listOfItems.value[index].id == itemModel.id) {
              marketClass.listOfItems.value.removeAt(index);
            }
            if(!marketClass.isDispose.value){
              setState(() {});
            }
          }
        }
              setState(() {});
      }else{
        marketClass.isStart.value = false;
      }
    });
  }

  @override
  void initState() {
    marketClass.isEnd.addListener(notifier);
    marketClass.isStart.addListener(notifier);
    marketClass.isPullUp.addListener(notifier);
    marketClass.isDispose.addListener(notifier);
    marketClass.isFetching.addListener(notifier);
    marketClass.listOfItems.addListener(notifier);
    marketClass.scrollController.addListener(scrollNotifier);
    marketClass.textController.addListener(() { setState(() {}); });
    startSnapshot();
    super.initState();
  }

  @override
  void dispose() {
    if (subsOfMyOrders != null) {
      subsOfMyOrders.cancel();
    }
    marketClass.isEnd.removeListener(() { });
    marketClass.isStart.removeListener(() { });
    marketClass.isPullUp.removeListener(() { });
    marketClass.isDispose.removeListener(() { });
    marketClass.isFetching.removeListener(() { });
    marketClass.listOfItems.removeListener(() { });
    marketClass.textController.removeListener(() { });
    marketClass.scrollController.removeListener(() { });
    
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize( 
        preferredSize: Size.fromHeight(45.0),
        child: SubPagesAppBar(
          title: "My Item's",
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
          onPressed: (){
            Navigator.push(context, SlideLeftRoute(page: AddItem()));
          }
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
                        controller: marketClass.textController,
                        onChanged: (value) {
                          marketClass.querySnapshot = null;
                          marketClass.isFetching.value = true;
                          marketClass.lastDocument = null;
                          marketClass.listOfItems.value = List<dynamic>(); 
                          marketClass.isTextChanged = true;
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
                  future: marketClass.getDataFromFirestore(marketClass.textController.text.toLowerCase()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting){
                      if (marketClass.isFetching.value) {
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

                    if (snapshot.connectionState == ConnectionState.done ){ marketClass.isFetching.value = false; }
                    return marketClass.listOfItems.value.length != 0 ? Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                        itemBuilder: (context, position){
                          ItemModel itemModel = marketClass.listOfItems.value[position];
                          return GestureDetector(
                            onTap: () async {
                              await Navigator.push(context, SlideLeftRoute(page: MyItemsDetails(itemModel: marketClass.listOfItems.value[position],)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Card(
                                elevation: 8.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                  height: 120,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 120,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  itemModel.itemPhoto[0]
                                                ),
                                                fit: BoxFit.cover
                                              )
                                            )
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  itemModel.name,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  "₱ " + numberDecimalComma(itemModel.price),
                                                  maxLines: 1,
                                                  // overflow: TextOverflow.ellipsis,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(Icons.star, size: 15, color: itemModel.ratings >= 1 ? Colors.yellow : Colors.grey),
                                                    Icon(Icons.star, size: 15, color: itemModel.ratings >= 2 ? Colors.yellow : Colors.grey),
                                                    Icon(Icons.star, size: 15, color: itemModel.ratings >= 3 ? Colors.yellow : Colors.grey),
                                                    Icon(Icons.star, size: 15, color: itemModel.ratings >= 4 ? Colors.yellow : Colors.grey),
                                                    Icon(Icons.star, size: 15, color: itemModel.ratings >= 5 ? Colors.yellow : Colors.grey),
                                                    SizedBox(width: 5,),
                                                    Text(
                                                      '('+ totalCount(itemModel.totalReviewer) + ')',
                                                      style: TextStyle(
                                                        fontSize: 12
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: marketClass.listOfItems.value.length
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