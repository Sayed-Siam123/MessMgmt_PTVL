import 'package:Mess_Management/Handler/Appbar.dart';
import 'package:Mess_Management/Handler/Appbar_landscape.dart';
import 'package:Mess_Management/Handler/DrawerWidget.dart';
import 'package:Mess_Management/Handler/MainPage.dart';
import 'package:Mess_Management/Pages/Home.dart';
import 'package:Mess_Management/Widgets/EventCelebrationWidget/NextContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_screen/responsive_screen.dart';

class EventCelebration extends StatefulWidget {
  @override
  _EventCelebrationState createState() => _EventCelebrationState();
}

class _EventCelebrationState extends State<EventCelebration> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    final wp = Screen(context).wp; //specify wp
    final hp = Screen(context).hp; //specify hp

    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(
        scaffoldKey: _scaffoldKey,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                width: wp(100),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                color: Theme.of(context).backgroundColor,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: OrientationLayoutBuilder(
                        portrait: (context) => Appbar(
                          height: hp(10),
                          width: wp(100),
                          title: "Event Celebration",
                        ),
                        landscape: (context) => Appbar_landscape(
                          height: hp(12),
                          width: wp(100),
                          title: "Event Celebration",
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: OrientationLayoutBuilder(
                        portrait: (context) => NextContainer(height: hp(110),width: wp(100),scaffoldKey: _scaffoldKey,),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: hp(2)),
        child: FloatingActionButton(
          onPressed: (){

          },
          child: Icon(Icons.add),
          backgroundColor: Colors.yellow.shade700,
        ),
      ),
    );
  }

  // Padding nextContainer(height, width) {
  //   dynamic hp = Hp(height).hp;
  //   dynamic wp = Wp(width).wp;
  //
  //   return Padding(
  //     padding: EdgeInsets.only(top: hp(12), right: wp(0)),
  //     child: Align(
  //       alignment: Alignment.topCenter,
  //       child: Container(
  //           width: wp(100),
  //           padding: EdgeInsets.only(right: wp(4), top: hp(0)),
  //           color: Colors.transparent,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: <Widget>[
  //               Align(
  //                 alignment: Alignment.center,
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: <Widget>[
  //                     Container(
  //                       height: hp(8),
  //                       width: wp(15),
  //                       decoration: BoxDecoration(
  //                           color: Colors.white,
  //                           borderRadius: BorderRadius.only(
  //                               topRight: Radius.circular(hp(2)),
  //                               bottomRight: Radius.circular(hp(2))),
  //                           boxShadow: [
  //                             BoxShadow(
  //                                 blurRadius: 25,
  //                                 spreadRadius: 5,
  //                                 color: Colors.grey.shade700.withOpacity(0.4))
  //                           ]),
  //                       child: IconButton(
  //                         onPressed: () {
  //                           _scaffoldKey.currentState.openDrawer();
  //                         },
  //                         icon: Icon(
  //                           Icons.menu,
  //                           color: Colors.grey.shade700.withOpacity(0.9),
  //                         ),
  //                       ),
  //                     ),
  //                     InkWell(
  //                       onTap: () {
  //                         pushNewScreen(
  //                           context,
  //                           screen: HomePage(),
  //                           withNavBar: true, // OPTIONAL VALUE. True by default.
  //                           pageTransitionAnimation: PageTransitionAnimation.cupertino,
  //                         );
  //                       },
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         children: <Widget>[
  //                           Icon(
  //                             AntDesign.arrowleft,
  //                             size: 17,
  //                           ),
  //                           SizedBox(
  //                             width: wp(1),
  //                           ),
  //                           Text(
  //                             "Back",
  //                             style: TextStyle(fontSize: 15),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.only(top: hp(2), left: wp(5)),
  //                 child: Align(
  //                   alignment: Alignment.centerLeft,
  //                   child: Text(
  //                     "Today",
  //                     style: TextStyle(
  //                       color: Colors.black87,
  //                       fontSize: 15,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.only(top: hp(1), left: wp(3)),
  //                 child: Align(
  //                   alignment: Alignment.center,
  //                   child: Container(
  //                     height: hp(15),
  //                     width: wp(90),
  //                     decoration: BoxDecoration(
  //                         color: Colors.white,
  //                         borderRadius:
  //                             BorderRadius.all(Radius.circular(wp(2))),
  //                         boxShadow: [
  //                           BoxShadow(
  //                             color: Colors.grey.shade700.withOpacity(0.2),
  //                             blurRadius: 5,
  //                             spreadRadius: 2,
  //                             offset: Offset(1, 2),
  //                           )
  //                         ]),
  //                     child: ListView.builder(
  //                       padding: EdgeInsets.fromLTRB(wp(5), hp(1), wp(4), hp(1)),
  //                       shrinkWrap: true,
  //                       itemCount: _user.length,
  //                       scrollDirection: Axis.vertical,
  //                       itemBuilder: (context, index) {
  //                         return Container(
  //                             height: hp(3),
  //                             margin: EdgeInsets.only(top:(hp(.5))),
  //                             color: Colors.transparent,
  //                             child: Row(
  //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                               children: <Widget>[
  //                                 Row(
  //                                   children: <Widget>[
  //                                     Icon(
  //                                       FontAwesome.birthday_cake,
  //                                       color: Colors.grey.shade700.withOpacity(0.7),
  //                                       size: hp(1.3),
  //                                     ),
  //                                     SizedBox(width: wp(3),),
  //                                     Padding(
  //                                       padding: EdgeInsets.only(top: hp(.1)),
  //                                       child: Text(_user[index].toString(),style: TextStyle(
  //                                           color: Colors.grey.shade700.withOpacity(.8),
  //                                         fontSize: 12,
  //                                         fontWeight: FontWeight.w600
  //                                       ),),
  //                                     ),
  //                                   ],
  //                                 ),
  //                                 Row(
  //                                   children: <Widget>[
  //                                     Container(
  //                                       height: hp(10),
  //                                       width: wp(18),
  //                                       decoration: BoxDecoration(
  //                                         color: Colors.greenAccent,
  //                                         borderRadius: BorderRadius.all(Radius.circular(wp(2))),
  //                                       ),
  //                                     ),
  //
  //                                     SizedBox(width: wp(1),),
  //
  //                                     Container(
  //                                         height: hp(10),
  //                                         width: wp(18),
  //                                       decoration: BoxDecoration(
  //                                         color: Colors.yellow,
  //                                         borderRadius: BorderRadius.all(Radius.circular(wp(2))),
  //
  //                                       ),
  //                                     ),
  //
  //                                     SizedBox(width: wp(1),),
  //
  //                                     Container(
  //                                         height: hp(10),
  //                                         width: wp(18),
  //                                       decoration: BoxDecoration(
  //                                         color: Colors.red,
  //                                         borderRadius: BorderRadius.all(Radius.circular(wp(2))),
  //
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ],
  //                             ),
  //                         );
  //                       },
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //
  //
  //               Padding(
  //                 padding: EdgeInsets.only(top: hp(3), left: wp(5)),
  //                 child: Align(
  //                   alignment: Alignment.centerLeft,
  //                   child: Text(
  //                     "Upcoming",
  //                     style: TextStyle(
  //                       color: Colors.black87,
  //                       fontSize: 15,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.only(top: hp(1), left: wp(3),bottom: hp(0)),
  //                 child: Align(
  //                   alignment: Alignment.center,
  //                   child: Container(
  //                     height: hp(45),
  //                     child: ListView.builder(
  //                       padding: EdgeInsets.fromLTRB(wp(5), hp(1), wp(4), hp(0)),
  //                       shrinkWrap: true,
  //                       itemCount: _fist.length,
  //                       scrollDirection: Axis.vertical,
  //                       itemBuilder: (context, index) {
  //                         return Container(
  //                           margin: EdgeInsets.only(bottom: hp(2)),
  //                           height: hp(10),
  //                           width: wp(90),
  //                           decoration: BoxDecoration(
  //                               color: Colors.white,
  //                               borderRadius:
  //                               BorderRadius.all(Radius.circular(wp(2))),
  //                               boxShadow: [
  //                                 BoxShadow(
  //                                   color: Colors.grey.shade700.withOpacity(0.2),
  //                                   blurRadius: 5,
  //                                   spreadRadius: 2,
  //                                   offset: Offset(1, 2),
  //                                 )
  //                               ]),
  //                           child: ListTile(
  //                             leading: Image.asset(
  //                               "assets/images/food.png"
  //                             ),
  //                             title: Text("Monthly Feast",style: TextStyle(
  //                               fontSize: 14,
  //                             ),),
  //                             subtitle: Row(
  //                               children: <Widget>[
  //                                 Text("30 Nov 2020",style: TextStyle(
  //                                   fontSize: 11,
  //                                 ),),
  //                                 SizedBox(width: wp(2),),
  //                                 Row(
  //                                   children: <Widget>[
  //                                     Icon(Icons.watch_later,size: 12,),
  //                                     SizedBox(width: wp(.5),),
  //                                     Padding(
  //                                       padding: EdgeInsets.only(top: hp(0.0)),
  //                                       child: Text("8.00PM",style: TextStyle(
  //                                         fontSize: 11,
  //                                       ),),
  //                                     ),
  //                                   ],
  //                                 )
  //                               ],
  //                             ),
  //                             trailing: Container(
  //                               height: hp(4),
  //                               width: wp(25),
  //                               decoration: BoxDecoration(
  //                                 color: Colors.transparent,
  //                                 borderRadius: BorderRadius.all(Radius.circular(wp(5))),
  //                                 border: Border.all(
  //                                   color: Colors.grey.shade700.withOpacity(0.5),
  //                                 ),
  //                               ),
  //                               child: Center(
  //                                 child: Text("Remind Me",style: TextStyle(
  //                                   color: Colors.grey.shade700.withOpacity(0.9),
  //                                   fontSize: 12
  //                                 ),),
  //                               ),
  //                             ),
  //                           ),
  //                         );
  //                       },
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //
  //             ],
  //           )),
  //     ),
  //   );
  // }
}
