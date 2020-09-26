import 'dart:async';

import 'package:Mess_Management/Pages/BazarList.dart';
import 'package:Mess_Management/Pages/EventCelebration.dart';
import 'package:Mess_Management/Pages/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'MainPage.dart';

class DrawerWidget extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const DrawerWidget({Key key, this.scaffoldKey}) : super(key: key);
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {

  String loginKey = "loginKey";
  String useridKey = "userid";
  String loginName = "loginName";
  String userDesignation = "userDesignation";
  String PresentStatus = "PresentStatus";
  String LateStatus = "LateStatus";
  String Intimes = "Intimes";
  String MonthPresent = "MonthPresent";
  String MonthAbesnt = "MonthAbesnt";
  String MonthLeave = "MonthLeave";
  String MonthLate = "MonthLate";

  //SessionManager prefs = SessionManager();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Mess Management',style: GoogleFonts.poppins(
              fontSize: 20,
            ),),
            decoration: BoxDecoration(
              color: Colors.amberAccent,
            ),
          ),


          // ListTile(
          //   title: Text('Home',style: GoogleFonts.exo2(
          //     textStyle: TextStyle(
          //       fontSize: 20,
          //       color: Colors.black,
          //     ),
          //   ),),
          //   trailing:  new Icon(Icons.arrow_forward),
          //   onTap: () {
          //     // Update the state of the app.
          //     // ...
          //
          //     pushNewScreen(
          //       context,
          //       screen: HomePage(),
          //       withNavBar: true, // OPTIONAL VALUE. True by default.
          //       pageTransitionAnimation: PageTransitionAnimation.cupertino,
          //     );
          //
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => ResignationPage()),
          //     );
          //
          //
          //   },
          // ),

          ListTile(
            title: Text('Event Celebration',style: GoogleFonts.exo2(
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),),
            trailing:  new Icon(Icons.arrow_forward),
            onTap: () {
              // Update the state of the app.
              // ...

                  pushNewScreen(
                    context,
                    screen: EventCelebration(),
                    withNavBar: true, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );

            },
          ),

          ListTile(
            title: Text('Bazar Schedule', style: GoogleFonts.exo2(
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),),
            trailing:  new Icon(Icons.arrow_forward),
            onTap: () {
              // Update the state of the app.
              // ...

              pushNewScreen(
                context,
                screen: BazarListPage(),
                withNavBar: true, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );

            },
          ),

          ListTile(
            title: Text('Logout',style: GoogleFonts.exo2(
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),),
            trailing:  new Icon(Icons.arrow_forward),
            onTap: () {
              // Update the state of the app.
              // ...
              //logout();

              // Timer(Duration(milliseconds: 50), () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => LoginPage(status: false,)),
              //   );
              // });

            },
          ),
        ],
      ),
    );
  }

  // void logout() async {
  //   userbloc.dispose();
  //   prefs.setData(loginKey,null);
  //   prefs.setData(loginName,null);
  //   prefs.setData(userDesignation,null);
  //   prefs.setData(PresentStatus,null);
  //   prefs.setData(LateStatus,null);
  //   prefs.setData(Intimes,null);
  //   prefs.setData(MonthPresent,null);
  //   prefs.setData(MonthAbesnt,null);
  //   prefs.setData(MonthLeave,null);
  //   prefs.setData(MonthLate,null);
  //
  //   print("LOgged out");
  //
  // }


}
