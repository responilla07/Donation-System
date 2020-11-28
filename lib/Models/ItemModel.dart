import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_system/Models/LocationModel.dart';

class ItemModel {
  String 
    id,
    name,
    ownerID,
    itemDescription;

  int 
    price,
    discounted,
    stock,
    ratings;

  List<dynamic> 
    itemPhoto, 
    searchKey,
    beneficiaries;

  bool isArchive;

  DateTime dateCreated;
  LocationModel location;

  ItemModel(String id, Map<dynamic, dynamic>data) {
    this.id = id ?? '';
    this.name = data['name'] ?? '';
    this.ownerID = data['ownerID'] ?? '';
    this.itemPhoto = data['itemPhoto'] ?? List<dynamic>();
    this.searchKey = data['searchKey'] ?? List<dynamic>();
    this.beneficiaries = data['beneficiaries'] ?? List<dynamic>();
    this.itemDescription = data['itemDescription'] ?? '';
    this.price = data['price'] ?? 0;
    this.discounted = data['discounted'] ?? 0;
    this.stock = data['stock'] ?? 0;
    this.ratings = data['ratings'] ?? 0;
    this.isArchive = data['isArchive'] ?? false;
    this.location = LocationModel(data['location'] ?? {});
    if(data['dateCreated'] is DateTime){
      this.dateCreated = data['dateCreated'];
    } else if((data['dateCreated'] as Timestamp) != null){
      this.dateCreated = (data['dateCreated'] as Timestamp).toDate();
    }
  }

  Map<String, dynamic> createItem() {
    return {
      'name' : this.name,
      'ownerID' : this.ownerID,
      'itemPhoto' : this.itemPhoto,
      'beneficiaries' : this.beneficiaries,
      'searchKey' : this.searchKey,
      'itemDescription' : this.itemDescription,
      'price' : this.price,
      'discounted' : this.discounted,
      'stock' : this.stock,
      'ratings' : this.ratings,
      'isArchive' : this.isArchive,
      'location' : this.location.setLocation(),
      'dateCreated' : FieldValue.serverTimestamp(),
    };
  }
}