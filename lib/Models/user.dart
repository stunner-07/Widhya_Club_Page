import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String name;
  String uid;
  User(this.name, this.uid);

  Future<String> returnUserId() async {
    final db = Firestore.instance;
    QuerySnapshot _myDoc = await db.collection('Users').getDocuments();
  }
}
