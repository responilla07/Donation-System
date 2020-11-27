import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_system/Models/LocationModel.dart';

class CharityModel {
  String 
    id,
    name,
    contact,
    description,
    founderID;

  int 
    totalDonationGranted,
    totalNotif;
  DateTime 
    dateCreated,
    dateFounded;
  List<dynamic> 
    pictures,
    searchKey;

  LocationModel location;

  CharityModel(String id, Map<dynamic, dynamic> data) {
    this.id = id ?? '';
    this.name = data['name'] ?? '';
    this.contact = data['contact'] ?? '';
    this.description = data['description'] ?? '';
    this.founderID = data['founderID'] ?? '';
    this.totalDonationGranted = data['totalDonationGranted'] ?? 0;
    this.totalNotif = data['totalNotif'] ?? 0;
    
    if(data['dateCreated'] is DateTime){
      this.dateCreated = data['dateCreated'];
    } else if((data['dateCreated'] as Timestamp) != null){
      this.dateCreated = (data['dateCreated'] as Timestamp).toDate();
    }
    if(data['dateFounded'] is DateTime){
      this.dateFounded = data['dateFounded'];
    } else if((data['dateFounded'] as Timestamp) != null){
      this.dateFounded = (data['dateFounded'] as Timestamp).toDate();
    }

    this.pictures = data['pictures'] ?? List<dynamic>();
    this.searchKey = data['searchKey'] ?? List<dynamic>();
    this.location = LocationModel( data["location"] ?? {} );
  }


  Map<String, dynamic> createCharity() {
    return {
      'name' : this.name,
      'contact' : this.contact,
      'description' : this.description,
      'founderID' : this.founderID,
      'totalDonationGranted' : this.totalDonationGranted,
      'totalNotif' : this.totalNotif,
      'dateCreated' : FieldValue.serverTimestamp(),
      'dateFounded' : this.dateFounded,
      'pictures' : this.pictures,
      'searchKey' : this.searchKey,
      'location' : this.location.setLocation()
    };
  }
}