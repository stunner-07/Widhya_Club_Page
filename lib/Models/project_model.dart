import 'package:flutter/material.dart';

class Project {
  String name;
  double tasks;
  String image;
  Color color;

  Project({this.name, this.tasks, this.image, this.color});
}

List<Project> projectItems = [
  Project(
    name: 'Rahul',
    tasks: 89,
    color: Colors.yellow,
  ),
  Project(
    name: 'Satya',
    tasks: 85,
    color: Colors.lightBlue,
  ),
  Project(
    name: 'Nahi Batana',
    tasks: 75,
    color: Colors.red,
  ),
];
