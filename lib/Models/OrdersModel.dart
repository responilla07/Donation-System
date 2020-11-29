
import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersModel {
  // Billing Details
  String 
    fullname,
    email,
    phone,
    address1,
    address2,
    state,
    province,
    postal,
    country;

  // Card Details
  String 
    cardNumber,
    expMonth,
    expYear;

  //Oder Details
  DateTime orderDate;
  String itemID;
  String status;
  String id;
  String buyerId;

  int price,
    totalPrice,
    transactionFee,
    deliveryFee;


  OrdersModel(String id, Map<dynamic, dynamic> data) {
    this.id = id ?? '';
    this.buyerId = data['buyerId'];
    this.fullname = data['fullname'] ?? '';
    this.email = data['email'] ?? '';
    this.phone = data['phone'] ?? '';
    this.address1 = data['address1'] ?? '';
    this.address2 = data['address2'] ?? '';
    this.state = data['state'] ?? '';
    this.province = data['province'] ?? '';
    this.postal = data['postal'] ?? '';
    this.country = data['country'] ?? '';

    this.cardNumber = data['cardNumber'] ?? '';
    this.expMonth = data['expMonth'] ?? '';
    this.expYear = data['expYear'] ?? '';
    
    this.itemID = data['itemID'] ?? '';
    this.status = data['status'] ?? '';
    
    if(data['orderDate'] is DateTime){
      this.orderDate = data['orderDate'];
    } else if((data['orderDate'] as Timestamp) != null){
      this.orderDate = (data['orderDate'] as Timestamp).toDate();
    }

    this.price = data['price'] ?? 0;
    this.totalPrice = data['totalPrice'] ?? 0;
    this.transactionFee = data['transactionFee'] ?? 20;
    this.deliveryFee = data['deliveryFee'] ?? 75;
  }

  Map<String, dynamic> createOrder() {
    return {
      'fullname' : this.fullname,
      'buyerId' : this.buyerId,
      'email' : this.email,
      'phone' : this.phone,
      'address1' : this.address1,
      'address2' : this.address2,
      'state' : this.state,
      'province' : this.province,
      'postal' : this.postal,
      'country' : this.country,
      'cardNumber' : this.cardNumber,
      'expMonth' : this.expMonth,
      'expYear' : this.expYear,
      'itemID' : this.itemID,
      'status' : this.status,
      'orderDate' : FieldValue.serverTimestamp(),
      'price' : this.price,
      'totalPrice' : this.totalPrice,
      'transactionFee' : this.transactionFee,
      'deliveryFee' : this.deliveryFee,
    };
  }

}