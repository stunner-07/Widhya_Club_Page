import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widhya_club/Models/clubs_detail.dart';
import 'package:widhya_club/Models/user_type.dart';

class C3 extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    var club = Provider.of<ClubDetail>(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: 150.0,
        left: 30,
        bottom: 0,
        right: 30,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(25),
              shadowColor: Colors.grey,
              color: Colors.lightBlue[50],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
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
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 45,
                        top: 20,
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
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(),
            flex: 2,
          ),
        ],
      ),
    );

    // Expanded(
    //   flex: 4,
    //   child: Material(
    //     elevation: 10,
    //     shadowColor: Colors.grey,
    //     borderRadius: BorderRadius.circular(25),
    //     color: Colors.lightBlue[50],
    //     child: Container(
    //       padding: EdgeInsets.all(20),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.all(15.0),
    //             child: Text(
    //               'Member Distribution',
    //               style: TextStyle(
    //                 fontSize: 24,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ),
    //           Chart(),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
    // SizedBox(
    //   height: 20,
    // ),

    // Expanded(
    //   flex: 3,
    //   child: Material(
    //     elevation: 10,
    //     shadowColor: Colors.grey,
    //     borderRadius: BorderRadius.circular(25),
    //     color: Colors.lightBlue[50],
    //     child: ListView(
    //       shrinkWrap: true,
    //       children: <Widget>[
    //         Stack(
    //           children: <Widget>[
    //             Positioned(
    //               top: 10,
    //               left: 20,
    //               child: Text(
    //                 'Top Performers of the month',
    //                 textAlign: TextAlign.center,
    //                 style: TextStyle(fontSize: 18, color: Colors.black87),
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(
    //                   top: 50.0, left: 20, right: 20),
    //               child: Column(
    //                 children: <Widget>[
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: <Widget>[
    //                       Expanded(
    //                         child: Container(),
    //                         flex: 1,
    //                       ),
    //                       Expanded(
    //                         flex: 2,
    //                         child: Text(
    //                           'Name',
    //                           style: TextStyle(
    //                               color: Colors.indigo, fontSize: 15),
    //                         ),
    //                       ),
    //                       Expanded(
    //                         flex: 2,
    //                         child: Text(
    //                           'Tasks Completed',
    //                           style: TextStyle(color: Colors.indigo),
    //                           textAlign: TextAlign.center,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   SizedBox(height: 10),
    //                   Divider(),
    //                   ListView.builder(
    //                     shrinkWrap: true,
    //                     itemCount: projectItems.length,
    //                     itemBuilder: (context, index) {
    //                       return ListTile(
    //                         leading: CircleAvatar(
    //                           child: Text(projectItems[index]
    //                               .name
    //                               .substring(0, 2)),
    //                         ),
    //                         title: Text(projectItems[index].name),
    //                         trailing: Text(
    //                             '${projectItems[index].tasks.toString()}'),
    //                       );
    //                     },
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // ),
  }
}
