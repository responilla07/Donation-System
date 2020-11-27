import 'package:cached_network_image/cached_network_image.dart';
import 'package:donation_system/Classes/MarketPageClass.dart';
import 'package:donation_system/Methods/Style.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Widgets/LoaderForPagination.dart';
import 'package:donation_system/Widgets/TextField.dart';
import 'package:flutter/material.dart';

class MarketPage extends StatefulWidget {
  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  MarketPageClass marketClass = MarketPageClass();
  int itemLen = 1;

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
                  padding: const EdgeInsets.all(15),
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
                  child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 15),
                    itemCount: itemLen + 1,
                    primary: false,
                    controller: marketClass.scrollController,
                    itemBuilder: (context, index) {
                      return 
                      // (index == (itemLen)) ? LoaderForPagination(
                      //   isPullUp: false,
                      //   loaderHeight: 40,
                      //   loaderWidth: 40,
                      // ) : 
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: GestureDetector(
                          onTap: () async {
                            // await Navigator.push(context, SlideLeftRoute(page: CharityDetailsPage()));
                          }, //http://ph-test-11.slatic.net/p/6c5cdb8ded861ff4224d5128a27a52df.jpg_340x340q80.jpg_.webp
                          child: Card(
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              height: 320,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: redSecondaryColorLight,
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                      ),
                                      // child: ClipRRect(
                                      //   borderRadius: BorderRadius.circular(10),
                                      //   child: CachedNetworkImage(
                                      //     imageUrl: 'http://ph-test-11.slatic.net/p/6c5cdb8ded861ff4224d5128a27a52df.jpg_340x340q80.jpg_.webp',
                                      //     fit: BoxFit.cover,
                                      //     placeholder: (context, value){
                                      //       return Column(
                                      //         crossAxisAlignment: CrossAxisAlignment.center,
                                      //         mainAxisAlignment: MainAxisAlignment.center,
                                      //         children: <Widget>[
                                      //           CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(redSecondaryColorLight)),
                                      //         ],
                                      //       );
                                      //     },
                                      //   ),
                                      // ),
                                    )
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Philippines eyes portfolio of potential vaccines vs COVID-19",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        Text( 
                                          "PHP " + "22,000",
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.adb
                                            ),
                                            SizedBox(width: 10,),
                                            Icon(
                                              Icons.chat_bubble
                                            ),
                                            Expanded(child: Container()),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                                border: Border.all(
                                                  color: hexColor(successColor),
                                                  width: 2
                                                )
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 8, right: 8),
                                                child: Text(
                                                  "BUY",
                                                  style: TextStyle(
                                                    color: hexColor(successColor),
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        )
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
