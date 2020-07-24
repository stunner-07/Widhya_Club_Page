import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widhya_club/Models/clubs_detail.dart';
import 'package:widhya_club/Models/user.dart';
import 'package:widhya_club/Models/user_type.dart';

class CAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ar = Provider.of<UserProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (Provider.of<UserType>(context).user == 1)
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
                            child: Consumer<ClubDetail>(
                              builder: (ctxb, req, _) => ListView.builder(
                                itemBuilder: (ctx, i) {
                                  return ListTile(
                                    leading: CircleAvatar(
                                      radius: 18,
                                      child: Text(req.currentClub.req
                                          .elementAt(i)
                                          .substring(0, 2)),
                                    ),
                                    title: Text(
                                      req.currentClub.req.elementAt(i),
                                    ),
                                    trailing: Wrap(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                          onPressed: () {
                                            ar.accept();
                                            req.deleteRequests(req
                                                .currentClub.req
                                                .elementAt(i));
                                            if (req.currentClub.req.isEmpty)
                                              Navigator.of(ctx).pop();
                                          },
                                        ),
                                        IconButton(
                                            icon: Icon(
                                              Icons.cancel,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              req.deleteRequests(req
                                                  .currentClub.req
                                                  .elementAt(i));
                                              if (req.currentClub.req.isEmpty)
                                                Navigator.of(ctx).pop();
                                            })
                                      ],
                                    ),
                                  );
                                },
                                itemCount: req.currentClub.req.length,
                              ),
                            ),
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
              child: FlatButton(
                onPressed: () =>
                    Navigator.of(context).pushReplacementNamed('/'),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'WorkSans-SemiBold.ttf',
                    fontSize: 14,
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
