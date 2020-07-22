import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Details {
  String imgUrl;
  String name;
  String collegeName;
  int noMem;
  List<String> req;
  List<String> memName;
  String shortdes;

  Details(this.imgUrl, this.name, this.collegeName, this.noMem, this.memName,
      this.shortdes, this.req);

  Map<String, dynamic> toMap() {
    return {
      'imgUrl': imgUrl,
      'name': name,
      'collegeName': collegeName,
      'noMem': noMem,
      'memName': memName,
      'shortdes': shortdes,
      'requests': req,
    };
  }

  static Details fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Details(
      map['imgUrl'],
      map['name'],
      map['collegeName'],
      map['noMem'],
      List<String>.from(map['memName']),
      map['shortdes'],
      List<String>.from(map['requests']),
    );
  }
}

class ClubDetail with ChangeNotifier {
  Details _currentClub;
  Details get currentClub {
    return _currentClub;
  }

  Future<void> fetchClub() async {
    final db = Firestore.instance;

    QuerySnapshot _myDoc = await db.collection('clubs').getDocuments();
    _myDoc.documents.forEach((element) async {
      _currentClub = (Details.fromMap(element.data));
    });
    //print(_currentClub.req);
  }

  Future<String> returnUserId() async {
    final db = Firestore.instance;
    return await db.collection('Users').document().documentID;
  }

  Map<String, double> pieChartData = {
    'IIT B': 16,
    'IIT K': 26,
    'IIT G': 06,
    'IIT D': 12,
    'IIT M': 15,
  };
}
