import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String currentUser = 'Kshitij';

// connect this to user databse so as to fetch current user

  // Future<String> returnUserId() async {
  //   final db = Firestore.instance;
  //   var _doc = await db.collection('Users').getDocuments();
  //   _doc.documents.map((e) {
  //     currentUser = e.data['name'];
  //   });
  //   return currentUser;
  // }
}
