import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:widhya_club/Models/clubs_detail.dart';
import 'package:widhya_club/Models/user_type.dart';
import 'package:widhya_club/Screens/clubs_page.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Provider.of<ClubDetail>(context, listen: false).dummy();
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
              Provider.of<UserType>(context, listen: false).adminLogin();

              Navigator.of(context).pushReplacementNamed(ClubsPage.route);
            },
            child: Text('Admin Login'),
          ),
          SizedBox(
            width: 30,
          ),
          RaisedButton(
            onPressed: () {
              Provider.of<UserType>(context, listen: false).studentLogin();
              Navigator.of(context).pushReplacementNamed(ClubsPage.route);
            },
            child: Text('Student Login'),
          ),
        ],
      ),
    );
  }
}
