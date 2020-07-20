import 'package:flutter/material.dart';

class CAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FlatButton(
            hoverColor: Colors.red[300],
            onPressed: () {},
            child: Text(
              'DashBoard',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'WorkSans-SemiBold.ttf',
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          FlatButton(
            hoverColor: Colors.red[300],
            onPressed: () {},
            child: Text(
              'Requests',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'WorkSans-SemiBold.ttf',
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            height: 35.0,
            width: 100.0,
            child: Center(
              child: GestureDetector(
                onTap: () => Navigator.of(context).pushReplacementNamed('/'),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'WorkSans-SemiBold.ttf',
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Color(0xFFFB4C47), width: 1.5)),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
