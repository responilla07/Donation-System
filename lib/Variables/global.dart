import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_system/Models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

ValueNotifier<String> pageTitle = ValueNotifier("HOME");

FirebaseStorage storage = FirebaseStorage.instance;
var db = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
User loggedUser;
FirebaseMessaging messaging = new FirebaseMessaging();

ValueNotifier<UserDetailsModel> myUserDetails = ValueNotifier<UserDetailsModel>(UserDetailsModel('', {}));

