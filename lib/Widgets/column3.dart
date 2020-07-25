import 'package:flutter/material.dart';
import 'package:widhya_club/Models/project_model.dart';
import 'package:widhya_club/Widgets/chart.dart';
import 'package:widhya_club/Widgets/tof.dart';

class C3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 150.0,
        left: 30,
        bottom: 20,
        right: 30,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Material(
              elevation: 10,
              shadowColor: Colors.grey,
              borderRadius: BorderRadius.circular(25),
              color: Colors.lightBlue[50],
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Member Distribution',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Chart(),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Material(
              elevation: 10,
              shadowColor: Colors.grey,
              borderRadius: BorderRadius.circular(25),
              color: Colors.lightBlue[50],
              child: TOF(),
            ),
            flex: 3,
          ),
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
        ],
      ),
    );
  }
}
