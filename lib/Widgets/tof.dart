import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widhya_club/Models/clubs_detail.dart';
import 'package:widhya_club/Models/user_type.dart';

class TOF extends StatelessWidget {
  TextEditingController _textEdit = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var club = Provider.of<ClubDetail>(context);
    var list = club.currentClub.topics;
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Topics of Focus',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (Provider.of<UserType>(context).user == 1)
              IconButton(
                icon: Icon(
                  Icons.edit,
                ),
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20.0)), //this right here
                        child: Container(
                          height: 200,
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Topic Of Interest'),
                                    controller: _textEdit,
                                    keyboardType: TextInputType.text,
                                    onSubmitted: (_) => null,
                                  ),
                                ),
                              ),
                              FlatButton(
                                color: Colors.pink,
                                onPressed: () {
                                  Provider.of<ClubDetail>(context,
                                          listen: false)
                                      .addTopics(_textEdit.text);
                                  Navigator.of(ctx).pop();
                                },
                                child: Text('ADD'),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Flexible(
          child: Wrap(
            children: [
              for (String i in list)
                Container(
                  margin: EdgeInsets.fromLTRB(
                    10,
                    10,
                    10,
                    0,
                  ),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                  ),
                  child: Wrap(
                    children: [
                      Text(
                        i,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (Provider.of<UserType>(context).user == 1)
                        SizedBox(
                          width: 12,
                        ),
                      if (Provider.of<UserType>(context).user == 1)
                        GestureDetector(
                          onTap: () => club.delTopics(i),
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.blue,
                                width: 1.8,
                              ),
                            ),
                            child: Text(
                              'X',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[600],
                              ),
                            ),
                          ),
                        ),
                      // IconButton(
                      //   padding: EdgeInsets.all(0),
                      //   alignment: Alignment.topCenter,
                      //   icon: Icon(
                      //     Icons.cancel,
                      //     color: Colors.red,
                      //     // size: 5,
                      //   ),
                      //   onPressed: () {
                      //     club.delTopics(i);
                      //   },
                      // ),
                    ],
                  ),
                ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
