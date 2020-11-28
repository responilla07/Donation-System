import 'package:donation_system/Classes/OrderPageClass.dart';
import 'package:donation_system/Models/ItemModel.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Variables/location_data.dart';
import 'package:donation_system/Widgets/ProcessIndicator.dart';
import 'package:donation_system/Widgets/ProvincePicker.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:donation_system/Widgets/TextField.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import 'package:donation_system/Widgets/drop_down.dart' as custom;

class OrderPage extends StatefulWidget {
  const OrderPage({
    this.itemModel
  });
  final ItemModel itemModel;
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  OrderPageClass orderClass = OrderPageClass();
  int selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: SubPagesAppBar(
          title: "Order Page",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: (){
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    orderClass.itemCard(context, widget.itemModel),
                    SizedBox(height: 15,),
                    Text(
                      'Select Payment Method',
                      style: TextStyle(
                        color: redSecondaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 15,),
                    paymentMethod(),
                    SizedBox(height: 15,),
                    Text(
                      'Billing details',
                      style: TextStyle(
                        color: redSecondaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          MyTextField(
                            controller: orderClass.fullname, 
                            hintText: 'full name*', 
                            inputFormatter: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z\-' ]")) ],
                            keyboardType: null,
                            color: redSecondaryColor,
                          ),
                          SizedBox(height: 15,),
                          MyTextField(
                            controller: orderClass.email, 
                            hintText: 'email*', 
                            inputFormatter: null,	 
                            keyboardType: null,
                            color: redSecondaryColor,
                          ),

                          
                          SizedBox(height: 15,),
                          MyTextField(
                            controller: orderClass.phone, 
                            hintText: 'phone*', 
                            inputFormatter: [FilteringTextInputFormatter.allow(RegExp("[0-9\-\(\)\+]")) ],	
                            keyboardType: null,
                            color: redSecondaryColor,
                          ),
                          SizedBox(height: 15,),
                          MyTextField(
                            controller: orderClass.address1, 
                            hintText: 'address line 1*', 
                            inputFormatter: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z&@&/,.0-9\-\(\)\+]")) ],
                            keyboardType: null,
                            color: redSecondaryColor,
                          ),
                          SizedBox(height: 15,),
                          MyTextField(
                            controller: orderClass.address2, 
                            hintText: 'address line 2', 
                            inputFormatter: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z&@&/,.0-9\-\(\)\+]")) ],
                            keyboardType: null,
                            color: redSecondaryColor,
                          ),
                          SizedBox(height: 15,),
                          Container(
                            height: 40,
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, SlideLeftRoute(page: ProvincePicker())).then((value){
                                        setState(() {
                                          orderClass.state = value['city'];
                                          orderClass.province = value['province'];
                                        });
                                      });
                                    },
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                        border: Border.all(
                                          color: redSecondaryColor
                                        )
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          orderClass.state,
                                          style: TextStyle(
                                            color: orderClass.state == "State" ? Colors.black54 : Colors.black,
                                            fontSize: 16
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15,),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, SlideLeftRoute(page: ProvincePicker())).then((value){
                                        setState(() {
                                          orderClass.state = value['city'];
                                          orderClass.province = value['province'];
                                        });
                                      });
                                    },
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                        border: Border.all(
                                          color: redSecondaryColor
                                        )
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          orderClass.province,
                                          style: TextStyle(
                                            color: orderClass.province == "Province" ? Colors.black54 : Colors.black,
                                            fontSize: 16
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15,),
                          MyTextField(
                            controller: orderClass.postal, 
                            hintText: 'postal code', 
                             inputFormatter: [FilteringTextInputFormatter.allow(RegExp("[0-9]")) ],	
                            keyboardType: null,
                            color: redSecondaryColor,
                          ),
                          SizedBox(height: 10,),
                          Card(
                            child: GestureDetector(
                              onTap: () {
                                FocusManager.instance.primaryFocus.unfocus();
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 10.0, right: 10.0,),
                                height: 45,
                                child: custom.DropdownButton<String>(
                                  height: 360,
                                  isExpanded: true,
                                  underline: Container(color: Colors.grey,),
                                  value: orderClass.countryValue,
                                  style: TextStyle(fontSize:MediaQuery.of(context).size.width/28.0),
                                  hint: Text('Select Country', style: TextStyle(fontSize:MediaQuery.of(context).size.width/28.0, fontFamily: 'Century Gothic', color: Colors.grey[700]) ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      FocusManager.instance.primaryFocus.unfocus();
                                      orderClass.countryValue = newValue;
                                      int position = countryArray["Country"].indexOf(orderClass.countryValue);
                                      // payMongoAPIModel.country = countryArray["Abbreviations"][position];
                                    });
                                  },
                                  items: countryArray["Country"].toList()
                                  .map<custom.DropdownMenuItem<String>>((String value) {
                                    return custom.DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          fontSize:MediaQuery.of(context).size.width/22.0,
                                          fontFamily: 'Century Gothic',
                                          color: Colors.black
                                        ),
                                      ),
                                    );
                                  })
                                  .toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    orderClass.paymentOption == "Cash on Delivery" ? Container() : Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // border: Border.all(width: 1.0, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Card Details:',
                            style: TextStyle(
                              color: redSecondaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          MaskedAddPaymentDetails(
                            asterisk: "*",
                            title: 'Card Number',
                            controller: orderClass.cardController,
                            hintText: '**** **** **** ****',
                          ),
                          
                          Container(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.only(top: 10.0),
                                          child:  Row(
                                            children: <Widget>[
                                              Text(
                                                "*", 
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              Text(
                                                "Expiration Date", 
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: TextFormField(
                                                  style: TextStyle(
                                                    fontSize: 14.0
                                                  ),
                                                  controller: orderClass.monthController,
                                                  keyboardType: TextInputType.number,
                                                  enableInteractiveSelection: false,
                                                  decoration: new InputDecoration(
                                                    hintText: "MM",
                                                    hintStyle: TextStyle(
                                                      fontSize: 14.0
                                                    ),
                                                    fillColor: Colors.white,
                                                    contentPadding: const EdgeInsets.all(5.0),
                                                    enabledBorder: new UnderlineInputBorder(
                                                      borderSide: new BorderSide(
                                                        color: Colors.grey
                                                      )
                                                    )
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              Expanded(
                                                child: TextFormField(
                                                  style: TextStyle(
                                                    fontSize: 14.0
                                                  ),
                                                  controller: orderClass.yearController,
                                                  keyboardType: TextInputType.number,
                                                  enableInteractiveSelection: false,
                                                  decoration: new InputDecoration(
                                                    hintText: "YYYY",
                                                    hintStyle: TextStyle(
                                                      fontSize: 14.0
                                                    ),
                                                    fillColor: Colors.white,
                                                    contentPadding: const EdgeInsets.all(5.0),
                                                    enabledBorder: new UnderlineInputBorder(
                                                      borderSide: new BorderSide(
                                                        color: Colors.grey
                                                      )
                                                    )
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: MaskedAddPaymentDetails(
                                    asterisk: "*",
                                    title: 'CVC',
                                    controller: orderClass.cvcController,
                                    hintText: '***',
                                  ),
                                ),
                                SizedBox(width: 10,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        FocusScope.of(context).requestFocus(FocusNode());
                        
                        if(orderClass.checkFields('fields')){
                          setState(() { orderClass.isProcessing = true; });
                          orderClass.createOrder(context,widget.itemModel).then((success){
                            if (success) {
                              Navigator.pop(context);
                              setState(() { orderClass.isProcessing = false; });
                            }
                          });
                        }
                        else{
                          Toast.show(orderClass.checkFields('message'), context, duration: 3, gravity: Toast.BOTTOM);
                          setState(() { orderClass.isProcessing = false; });
                        }

                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10, top: 10),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: redSecondaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'PAY',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          orderClass.isProcessing ? ProcessIndicator() : Container()
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  
  Column paymentMethod() {
    return Column(
      children: [
        Row(
          children: [
            paymentMethodItem(
              name: 'Cash On Delivery',
              pos: 1,
              callback: () {
                selectedMethod(1);
              },
            ),
            SizedBox(width: 5,),
            paymentMethodItem(
              name: 'Debit / Credit',
              pos: 2,
              callback: () {
                selectedMethod(2);
              },
            ),
          ],
        ),
        SizedBox(height: 5,),
        Row(
          children: [
            paymentMethodItem(
              name: 'GCash',
              pos: 3,
              callback: () {
                Toast.show("GCash is under maintenance", context, duration: 4, gravity: Toast.BOTTOM);
                // selectedMethod(3);
              },
            ),
            SizedBox(width: 5,),
            paymentMethodItem(
              name: 'Over The Counter',
              pos: 4,
              callback: () {
                Toast.show("OTC is under development", context, duration: 4, gravity: Toast.BOTTOM);
                // selectedMethod(4);
              },
            ),
          ],
        ),
      ],
    );
  }

  GestureDetector paymentMethodItem({VoidCallback callback, int pos, String name}) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 40.0,
        padding: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 2.0, color: selectedRadio == pos ? Color(0xFF528AAE) : Color(0xFFd6d6d6)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.8),
              offset: Offset(0, 2),
              blurRadius: 1,
              spreadRadius: .4
            )
          ]
        ),
        child: Row(
          children: <Widget>[
            Theme(
              data: ThemeData.light(),
              child: Radio(
                value: pos, 
                groupValue: selectedRadio, 
                onChanged: (val) => callback
              ),
            ),
            Text(
              name,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }

  selectedMethod(int val) {
    setState(() {
      selectedRadio = val;
      if (selectedRadio == 1) {
        orderClass.paymentOption = "Cash on Delivery";
      } else if (selectedRadio == 2) {
        orderClass.paymentOption = "card";
      } else if (selectedRadio == 3) {
        orderClass.paymentOption = "gcash";
      } else if (selectedRadio == 4) {
        orderClass.paymentOption = "Over The Counter";
      }
    });
  }

}


class MaskedAddPaymentDetails extends StatefulWidget {
   MaskedAddPaymentDetails({
    this.title,
    this.asterisk,
    this.controller,
    this.hintText,
  });

  final String title;
  final String asterisk;
  final TextEditingController controller;
  final String hintText;
  @override
  _MaskedAddPaymentDetailsState createState() => _MaskedAddPaymentDetailsState();
}

class _MaskedAddPaymentDetailsState extends State<MaskedAddPaymentDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 10.0),
                child:  Text(
                  widget.asterisk, 
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 10.0),
                child:  Text(
                  widget.title, 
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
          Container(
            // margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: TextFormField(
              style: TextStyle(
                fontSize: 14.0
              ),
              controller: widget.controller,
              enableInteractiveSelection: false,
              decoration: new InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontSize: 14.0
                ),
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(5.0),
                enabledBorder: new UnderlineInputBorder(
                  borderSide: new BorderSide(
                    color: Colors.grey
                  )
                )
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }
}