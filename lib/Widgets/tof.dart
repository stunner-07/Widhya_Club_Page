import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widhya_club/Models/clubs_detail.dart';
import 'package:widhya_club/Models/user_type.dart';

class TOF extends StatelessWidget {
  TextEditingController _textEdit = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var list = Provider.of<ClubDetail>(context).currentClub.topics;
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
                  color: Colors.black,
                ),
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return Consumer<ClubDetail>(
                        builder: (ctx, club1, _) => Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0)), //this right here
                          child: Container(
                            padding: EdgeInsets.all(20),
                            height: 500,
                            width: 500,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(children: [
                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: TextField(
                                          decoration: InputDecoration(
                                              labelText: 'Topic Of Interests'),
                                          controller: _textEdit,
                                          keyboardType: TextInputType.text,
                                          onSubmitted: (_) => null,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        club1.addTopics(_textEdit.text);
                                      },
                                    ),
                                  ),
                                ]),
                                Flexible(
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: club1.currentClub.topics.length,
                                    itemBuilder: (ctx, i) => Row(
                                      children: [
                                        Expanded(
                                          flex: 8,
                                          child: Text(
                                            ' ${i + 1}) ${club1.currentClub.topics[i]}\n',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Expanded(
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.cancel,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              club1.delTopics(i);
                                            },
                                          ),
                                          flex: 2,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                FlatButton(
                                  color: Colors.pink[400],
                                  child: Text("Save Changes"),
                                  onPressed: () => Navigator.of(ctx).pop(),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )
            // IconButton(
            //   icon: Icon(
            //     Icons.edit,
            //   ),
            //   onPressed: () =>
            //   showDialog(
            //       context: context,
            //       builder: (BuildContext ctx) {
            //         return Dialog(
            //           shape: RoundedRectangleBorder(
            //               borderRadius:
            //                   BorderRadius.circular(20.0)), //this right here
            //           child: Container(
            //             height: 200,
            //             width: 100,
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               children: [
            //                 Container(
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(12.0),
            //                     child: TextField(
            //                       decoration: InputDecoration(
            //                           labelText: 'Topic Of Interest'),
            //                       controller: _textEdit,
            //                       keyboardType: TextInputType.text,
            //                       onSubmitted: (_) => null,
            //                     ),
            //                   ),
            //                 ),
            //                 FlatButton(
            //                   onPressed: () {
            //                     Provider.of<ClubDetail>(context,
            //                             listen: false)
            //                         .addTopics(_textEdit.text);
            //                     Navigator.of(ctx).pop();
            //                   },
            //                   child: Text('ADD'),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         );
            //       }),
            // ),
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
                  //width: 300,
                  //height: 51,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                  ),
                  child: Text(
                    i,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
