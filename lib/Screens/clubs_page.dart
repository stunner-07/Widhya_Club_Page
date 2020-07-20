import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widhya_club/Models/clubs_detail.dart';
import 'package:widhya_club/Widgets/capp_bar.dart';
import 'package:widhya_club/Widgets/column1.dart';
import 'package:widhya_club/Widgets/column2.dart';
import 'package:widhya_club/Widgets/column3.dart';

class ClubsPage extends StatelessWidget {
  static const route = '/clubs';
  @override
  Widget build(BuildContext context) {
    var club = Provider.of<ClubDetail>(context);
    return FutureBuilder(
        future: club.fetchClub(),
        builder: (ctx, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  appBar: AppBar(
                      backgroundColor: Colors.white,
                      title: Row(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Image.network(
                                'https://media-exp1.licdn.com/dms/image/C510BAQFj2IOVxDuVQA/company-logo_200_200/0?e=2159024400&v=beta&t=BRAxOREbvXrWT_z3F2OePswp1I7FuH0xMBQ1ZBslwL4',
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Widhya',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xff1b1e44),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      actions: [
                        CAppBar(),
                      ]),
                  body: SingleChildScrollView(
                    child: Container(
                      height: 900,
                      child: Row(
                        children: [
                          Expanded(
                            child: C1(),
                          ),
                          Expanded(
                            child: C2(),
                          ),
                          Expanded(
                            child: C3(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        });
  }
}
