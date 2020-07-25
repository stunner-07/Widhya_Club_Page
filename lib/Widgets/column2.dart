import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widhya_club/Models/clubs_detail.dart';
import 'package:widhya_club/Models/user_type.dart';

class C2 extends StatelessWidget {
  static const List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  TextEditingController _textEdit = TextEditingController();
  TextEditingController _textEdit2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var club = Provider.of<ClubDetail>(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: 40.0,
        left: 20,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Widhya\'s Club',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Hello, Welcome Back !',
            style: TextStyle(color: Colors.grey[600], fontSize: 15),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 2,
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(25),
              shadowColor: Colors.grey,
              color: Colors.lightBlue[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: ListTile(
                        leading: Icon(Icons.pie_chart,
                            size: 30, color: Colors.black),
                        title: Text(
                          'Club Events',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          ' ${months[DateTime.now().month - 1]} ${DateTime.now().year}',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                        trailing: Provider.of<UserType>(context, listen: false)
                                    .user ==
                                1
                            ? IconButton(
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
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.0)), //this right here
                                          child: Container(
                                            padding: EdgeInsets.all(20),
                                            height: 500,
                                            width: 500,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Row(children: [
                                                  Expanded(
                                                    flex: 8,
                                                    child: Container(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12.0),
                                                        child: TextField(
                                                          decoration:
                                                              InputDecoration(
                                                                  labelText:
                                                                      'Events'),
                                                          controller: _textEdit,
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          onSubmitted: (_) =>
                                                              null,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: IconButton(
                                                      icon: Icon(Icons.add),
                                                      onPressed: () {
                                                        club1.addEvents(
                                                            _textEdit.text);
                                                      },
                                                    ),
                                                  ),
                                                ]),
                                                Flexible(
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: club1.currentClub
                                                        .events.length,
                                                    itemBuilder: (ctx, i) =>
                                                        Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 8,
                                                          child: Text(
                                                            ' ${i + 1}) ${club1.currentClub.events[i]}\n',
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: IconButton(
                                                            icon: Icon(
                                                              Icons.cancel,
                                                              color: Colors.red,
                                                            ),
                                                            onPressed: () {
                                                              club1
                                                                  .delEvents(i);
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
                                                  onPressed: () =>
                                                      Navigator.of(ctx).pop(),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              )
                            : Container(
                                width: 0,
                                height: 0,
                              ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 45,
                        top: 0,
                      ),
                      child: ListView.builder(
                        itemCount: club.currentClub.events.length,
                        itemBuilder: (ctx, i) => Text(
                          ' ${i + 1}) ${club.currentClub.events[i]}\n',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(25),
                shadowColor: Colors.grey,
                color: Colors.lightBlue[50],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 35,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (Provider.of<UserType>(context).user == 1)
                            Container(),
                          Text(
                            'About the Club',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
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
                                          borderRadius: BorderRadius.circular(
                                              20.0)), //this right here
                                      child: Container(
                                        height: 500,
                                        width: 500,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      labelText:
                                                          'About the club'),
                                                  controller: _textEdit2,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  maxLines: 15,
                                                  onSubmitted: (_) => null,
                                                ),
                                              ),
                                            ),
                                            FlatButton(
                                              color: Colors.pink[400],
                                              onPressed: () {
                                                Provider.of<ClubDetail>(context,
                                                        listen: false)
                                                    .editShortdes(
                                                        _textEdit.text);
                                                Navigator.of(ctx).pop();
                                              },
                                              child: Text('Save Changes'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        club.currentClub.shortdes,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                      ),
                    ),
                    // Divider(
                    //   thickness: 1.5,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: Text(
                    //     'Club Members',
                    //     style: TextStyle(
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   itemBuilder: (ctx, i) => ListTile(
                    //     leading: CircleAvatar(
                    //       radius: 18,
                    //       child:
                    //           Text(club.currentClub.memName[i].substring(0, 2)),
                    //     ),
                    //     title: Text(
                    //       club.currentClub.memName[i],
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         color: Colors.grey[800],
                    //       ),
                    //     ),
                    //     trailing: Text("President"),
                    //   ),
                    //   itemCount: club.currentClub.memName.length,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
