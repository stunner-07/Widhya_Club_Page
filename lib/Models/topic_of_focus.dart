import 'package:flutter/material.dart';
class TopicsList with ChangeNotifier{
  List<String> t=[
    'WebDev',
    'AppDev',
    'Widhya',
  ];
  List<String> get topics{
    return [...t];
  }
  void addTopics(String s){
    t.add(s);
    notifyListeners();
  }
}