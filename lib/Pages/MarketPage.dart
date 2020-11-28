import 'package:donation_system/Classes/MarketPageClass.dart';
import 'package:donation_system/Methods/CreateSearchKey.dart';
import 'package:donation_system/Models/ItemModel.dart';
import 'package:donation_system/SubPages/ItemDetails.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/global.dart';
import 'package:donation_system/Widgets/ItemCard.dart';
import 'package:donation_system/Widgets/LoaderForPagination.dart';
import 'package:donation_system/Widgets/TextField.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class MarketPage extends StatefulWidget {
  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  MarketPageClass marketClass = MarketPageClass();
  int itemLen = 5;
  int rating = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: ()=> FocusScope.of(context).requestFocus(new FocusNode()),
        child: Container(
          color: white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: MyTextField(
                      controller: marketClass.textController, 
                      hintText: "search", 
                      inputFormatter: null, 
                      keyboardType: null
                    ),
                  ),
                ),
                itemLen != 0 ? Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    itemCount: itemLen + 1,
                    controller: marketClass.scrollController,
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return 
                      (index == (itemLen)) ? LoaderForPagination(
                        isPullUp: false,
                        loaderHeight: 40,
                        loaderWidth: 40,
                      ) : 
                      GestureDetector(
                        onTap: () async {
                          await Navigator.push(context, SlideLeftRoute(page: ItemDetails()));
                        },
                        child: ItemCard(rating: rating)
                      );
                    },
                  ),
                ) : Text("Create place holder here") //TODO Create placeholder for this page
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}