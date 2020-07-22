import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widhya_club/Models/clubs_detail.dart';

class CAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var req = Provider.of<ClubDetail>(context, listen: false).currentClub.req;
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FlatButton(
            hoverColor: Colors.red[300],
            onPressed: () {
              return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0)), //this right here
                      child: Container(
                        width: 400,
                        height: 400,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: _requests(req),
                        ),
                      ),
                    );
                  });
            },
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

Widget _requests(List<String> req) {
  return ListView.builder(
    itemBuilder: (ctx, i) {
      return ListTile(
        leading: CircleAvatar(
          radius: 18,
          child: Text(req[i].substring(0, 2)),
        ),
        title: Text(req[i]),
        trailing: Wrap(
          children: [
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {},
            ),
            IconButton(icon: Icon(Icons.cancel), onPressed: () {})
          ],
        ),
      );
    },
    itemCount: req.length,
  );
}
