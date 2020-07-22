import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:widhya_club/Models/user.dart';

import 'Models/clubs_detail.dart';
import 'Models/topic_of_focus.dart';
import 'Models/user_type.dart';
import 'Screens/clubs_page.dart';
import 'Screens/sample_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: UserType(),
        ),
        ChangeNotifierProvider.value(
          value: TopicsList(),
        ),
        ChangeNotifierProvider.value(
          value: ClubDetail(),
        ),
        ChangeNotifierProvider.value(
          value: UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Widhya App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        home: Login(),
        routes: {
          ClubsPage.route: (ctx) => ClubsPage(),
        },
      ),
    );
  }
}
