import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widhya_club/Models/clubs_detail.dart';
import 'package:widhya_club/Models/user.dart';
import 'package:widhya_club/Models/user_type.dart';
import 'package:widhya_club/Widgets/tof.dart';

class C1 extends StatefulWidget {
  @override
  _C1State createState() => _C1State();
}

class _C1State extends State<C1> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    var club = Provider.of<ClubDetail>(context, listen: false);
    var user = Provider.of<UserProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(
        top: 40.0,
        left: 30,
        right: 30,
        bottom: 20,
      ),
      child: Material(
        elevation: 10,
        shadowColor: Colors.grey,
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black45,
                                ),
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: NetworkImage(
                                        'https://media-exp1.licdn.com/dms/image/C510BAQFj2IOVxDuVQA/company-logo_200_200/0?e=2159024400&v=beta&t=BRAxOREbvXrWT_z3F2OePswp1I7FuH0xMBQ1ZBslwL4')),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Icon(Icons.cloud),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          club.currentClub.name,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Icon(Icons.location_city),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          club.currentClub.collegeName,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Icon(Icons.ac_unit),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          club.currentClub.noMem.toString(),
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.red,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, left: 15, right: 15),
                      decoration: BoxDecoration(
                        color: Colors.orange[100],
                      ),
                      child: Row(
                        children: [
                          Text(
                            '    Join Our Club',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          if (Provider.of<UserType>(context, listen: false)
                                      .user ==
                                  0 &&
                              Provider.of<UserProvider>(context, listen: false)
                                      .ismem ==
                                  false)
                            RaisedButton(
                              elevation: 0,
                              color: flag ? Colors.grey : Colors.orange,
                              onPressed: flag
                                  ? null
                                  : () {
                                      club.postRequests(user.currentUser);
                                      setState(() {
                                        flag = true;
                                      });
                                    },
                              child: Text(
                                'Connect',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    child: TOF(),
                    decoration: BoxDecoration(
                      color: Colors.orange[50],
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
