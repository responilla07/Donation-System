
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_system/Models/LocationModel.dart';
import 'package:donation_system/Models/NameModel.dart';

class UserDetailsModel {
  String 
    contact,
    currentQueue,
    email,
    messagingToken,
    secretLoginHash,
    id;

  NameModel name;
  LocationModel location;
  DateTime registeredDate;

  UserDetailsModel ( String id, Map<dynamic, dynamic> data ) {
    this.id = id ?? "";
    this.contact = data["contact"] ?? "";
    this.email = data["email"] ?? "";
    this.messagingToken = data["messagingToken"] ?? "";
    this.secretLoginHash = data["secretLoginHash"] ?? "";
    this.name = NameModel( data["name"] ?? {} );
    this.location = LocationModel( data["location"] ?? {} );
    if(data['registeredDate'] is DateTime){
      this.registeredDate = data['registeredDate'];
    } else if((data['registeredDate'] as Timestamp) != null){
      this.registeredDate = (data['registeredDate'] as Timestamp).toDate();
    }
  }

  setUserDetails() {
    return {
      "contact" : this.contact,
      "email" : this.email,
      "messagingToken" : this.messagingToken,
      "secretLoginHash" : this.secretLoginHash,
      "name" : this.name.setName(),
      "location" : this.location.setLocation(),
      "registeredDate" :  FieldValue.serverTimestamp(),
    };
  }

}