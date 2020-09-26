import 'package:Mess_Management/Handler/Appbar.dart';
import 'package:Mess_Management/Handler/Appbar_landscape.dart';
import 'package:Mess_Management/Handler/DrawerWidget.dart';
import 'package:Mess_Management/Widgets/MemberListWidget/MemberListWidget.dart';
import 'package:Mess_Management/Widgets/MemberListWidget/MemberListWidget_landscape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_screen/responsive_screen.dart';

class MemberListPage extends StatefulWidget {
  @override
  _MemberListPageState createState() => _MemberListPageState();
}

class _MemberListPageState extends State<MemberListPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey =
  new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {


    final wp = Screen(context).wp; //specify wp
    final hp = Screen(context).hp; //specify hp

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme
          .of(context)
          .backgroundColor
          .withOpacity(0.9),
      drawer: DrawerWidget(scaffoldKey: _scaffoldKey,),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([


              Container(
                width: wp(130),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Stack(
                  children: <Widget>[

                    Align(
                      alignment: Alignment.topCenter,
                      child: OrientationLayoutBuilder(
                        portrait: (context) => MemberGridListWidget(height: hp(100),width: wp(100),),
                        landscape: (context) => MemberGridListWidget_landscape(height: hp(200),width: wp(80),) ,
                      )
                    ),

                    Align(
                      alignment: Alignment.topCenter,
                      child: OrientationLayoutBuilder(
                        portrait: (context) => Appbar(height: hp(10),width: wp(100),title: "Member List",),
                        landscape: (context) => Appbar_landscape(height: hp(12),width: wp(100),title: "Member List"),
                      ),
                    ),
                  ],
                ),
              ),


              // Align(
              //   alignment: Alignment.topCenter,
              //   child: Container(
              //       height: hp(100),
              //       child: GridView.builder(
              //         scrollDirection: Axis.vertical,
              //         itemCount: data.length,
              //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount: 2,
              //             crossAxisSpacing: 2,
              //             mainAxisSpacing: 5
              //         ),
              //         itemBuilder: (context, index) {
              //           return Container(
              //             color: Colors.white,
              //             margin: EdgeInsets.fromLTRB(wp(2), hp(2), wp(2), 0),
              //             child: Center(
              //               child: Text(
              //                 data[index].toString(),
              //               ),
              //             ),
              //           );
              //         },
              //       )),
              // )
            ]),
          ),
        ],
      ),
    );
  }
}
