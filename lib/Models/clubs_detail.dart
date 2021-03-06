import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Details {
  String imgUrl;
  String name;
  String collegeName;
  int noMem;
  Set<String> req;
  List<String> memName;
  String shortdes;
  String clubId;
  List<String> events;
  List<String> topics;

  Details(this.imgUrl, this.name, this.collegeName, this.noMem, this.memName,
      this.shortdes, this.req, this.events, this.topics);

  Map<String, dynamic> toMap() {
    return {
      'imgUrl': imgUrl,
      'name': name,
      'collegeName': collegeName,
      'noMem': noMem,
      'memName': memName,
      'shortdes': shortdes,
      'requests': req,
      'events': events,
      'topics': topics,
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
      Set<String>.from(map['requests']),
      List<String>.from(map['events']),
      List<String>.from(map['topics']),
    );
  }
}

class ClubDetail with ChangeNotifier {
  Details _currentClub;
  Details get currentClub {
    return _currentClub;
  }

//for development purpose only
  // Future<void> dummy() async {
  //   Details d = Details(
  //     'https://media-exp1.licdn.com/dms/image/C510BAQFj2IOVxDuVQA/company-logo_200_200/0?e=2159024400&v=beta&t=BRAxOREbvXrWT_z3F2OePswp1I7FuH0xMBQ1ZBslwL4',
  //     'Widhya',
  //     'CollegeName',
  //     26,
  //     ['Rahul', 'Satya', 'Kshitij'],
  //     'Google LLC is an American multinational technology company that specializes in Internet-related services and products, which include online advertising technologies, a search engine, cloud computing, software, and hardware. It is considered one of the Big Four technology companies alongside Amazon, Apple and Microsoft.',
  //     <String>{},
  //   );
  //   final db = Firestore.instance;
  //   await db.collection('clubs').add(d.toMap());
  // }

  Future<void> fetchClub() async {
    final db = Firestore.instance;

    QuerySnapshot _myDoc = await db.collection('clubs').getDocuments();
    _myDoc.documents.forEach((element) async {
      _currentClub = (Details.fromMap(element.data));
      _currentClub.clubId = element.documentID;
    });
    //print(_currentClub.req);
  }

  Future<void> postRequests(String name) async {
    final db = Firestore.instance;
    // print(_currentClub.req);
    _currentClub.req.add(name);
    await db.collection('clubs').document(_currentClub.clubId).setData(
      {'requests': _currentClub.req},
      merge: true,
    );
  }

  Future<void> deleteRequests(String value) async {
    final db = Firestore.instance;
    // print(_currentClub.req);
    _currentClub.req.remove(value);
    await db.collection('clubs').document(_currentClub.clubId).setData(
      {'requests': _currentClub.req},
      merge: true,
    );
    notifyListeners();
  }

  Future<void> addTopics(String s) async {
    _currentClub.topics.add(s);
    await Firestore.instance
        .collection('clubs')
        .document(_currentClub.clubId)
        .setData(
      {'topics': _currentClub.topics},
      merge: true,
    );
    notifyListeners();
  }

  Future<void> addAdmin(String s) async {
    _currentClub.memName.add(s);
    await Firestore.instance
        .collection('clubs')
        .document(_currentClub.clubId)
        .setData(
      {'memName': _currentClub.memName},
      merge: true,
    );
    notifyListeners();
  }

  Future<void> editShortdes(String s) async {
    _currentClub.shortdes = s;
    await Firestore.instance
        .collection('clubs')
        .document(_currentClub.clubId)
        .setData(
      {'shortdes': _currentClub.shortdes},
      merge: true,
    );
    notifyListeners();
  }

  Future<void> delEvents(int i) async {
    _currentClub.events.removeAt(i);
    await Firestore.instance
        .collection('clubs')
        .document(_currentClub.clubId)
        .setData(
      {'events': _currentClub.events},
      merge: true,
    );
    notifyListeners();
  }

  Future<void> delTopics(String i) async {
    _currentClub.topics.removeWhere((element) => element == i);
    await Firestore.instance
        .collection('clubs')
        .document(_currentClub.clubId)
        .setData(
      {'topics': _currentClub.topics},
      merge: true,
    );
    notifyListeners();
  }

  Future<void> delAdmin(int i) async {
    _currentClub.memName.removeAt(i);
    await Firestore.instance
        .collection('clubs')
        .document(_currentClub.clubId)
        .setData(
      {'memName': _currentClub.memName},
      merge: true,
    );
    notifyListeners();
  }

  Future<void> addEvents(String s) async {
    _currentClub.events.add(s);
    await Firestore.instance
        .collection('clubs')
        .document(_currentClub.clubId)
        .setData(
      {'events': _currentClub.events},
      merge: true,
    );
    notifyListeners();
  }

  Map<String, double> pieChartData = {
    'IIT B': 16,
    'IIT K': 26,
    'IIT G': 06,
    'IIT D': 12,
    'IIT M': 15,
  };
}
