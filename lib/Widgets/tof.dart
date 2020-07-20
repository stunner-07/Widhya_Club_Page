import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widhya_club/Models/topic_of_focus.dart';
import 'package:widhya_club/Models/user_type.dart';

class TOF extends StatelessWidget {
  TextEditingController _textEdit = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var list = Provider.of<TopicsList>(context).topics;
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
            if (Provider.of<User>(context).user == 1)
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
                                onPressed: () {
                                  Provider.of<TopicsList>(context,
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
          child: ListView.builder(
            itemCount:
                Provider.of<TopicsList>(context, listen: false).topics.length,
            itemBuilder: (ctx, i) => Column(
              children: [
                Container(
                  width: 300,
                  height: 51,
                  padding: EdgeInsets.only(top: 15, left: 59, right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.orange[100],
                  ),
                  child: Text(
                    list[i],
                    style: TextStyle(
                      fontSize: 15,
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
        ),
      ],
    );
  }
}
