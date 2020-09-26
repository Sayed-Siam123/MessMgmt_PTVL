import 'package:Mess_Management/Handler/Appbar.dart';
import 'package:Mess_Management/Handler/Appbar_landscape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_screen/responsive_screen.dart';

class BazarListPage extends StatefulWidget {
  @override
  _BazarListPageState createState() => _BazarListPageState();
}

class _BazarListPageState extends State<BazarListPage> {

  String _month = DateTime.now().month.toString();
  String _day = DateTime.now().day.toString();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final wp = Screen(context).wp; //specify wp
    final hp = Screen(context).hp; //specify hp
    return Scaffold(
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
                          title: "Bazar Schedule",
                        ),
                        landscape: (context) => Appbar_landscape(
                          height: hp(12),
                          width: wp(100),
                          title: "Bazar Schedule",
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.topCenter,
                      child: OrientationLayoutBuilder(
                        portrait: (context) => Padding(
                          padding: EdgeInsets.only(top: hp(11)),
                          child: Container(
                              width: wp(100),
                              color: Colors.transparent,
                              child: Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: hp(3)),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(right: wp(6)),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: <Widget>[
                                                Icon(Icons.arrow_back),
                                                SizedBox(width: wp(1),),
                                                Text("Back",style: TextStyle(
                                                    fontSize: 15
                                                ),)
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.all(wp(3)),
                                            child: Calendar(
                                              showCalendarPickerIcon: false,
                                              showChevronsToChangeRange: true,
                                              initialCalendarDateOverride: DateTime.now(),
                                              onSelectedRangeChange: (range) =>
                                                  print("Range is ${range.item1}, ${range.item2}"),
                                              isExpandable: true,
                                              dayBuilder: (BuildContext context, DateTime day) {
                                                return InkWell(
                                                  onTap: () {
                                                    print("OnTap +"+day.month.toString());

                                                    setState(() {
                                                      _day = day.day.toString();
                                                      _month = day.month.toString();
                                                    });



                                                  },
                                                  child: new Container(
                                                    margin: EdgeInsets.all(hp(.4)),
                                                    decoration: new BoxDecoration(
                                                      color: day.month.toString() == _month && day.day.toString() == _day ? Colors.yellow : Colors.grey,
                                                    ),
                                                    child: day.month.toString() == "10" && day.day.toString() == "26" ? Text(
                                                      day.day.toString(),
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    ) : Text(
                                                      day.day.toString(),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              showTodayAction: true,
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(left: wp(3)),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text("*Please Expand Calander to select",style: TextStyle(
                                                  color: Colors.green
                                              ),),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                          ),
                        ),
                        ),
                      ),
                    ]),
              )],
                ),
              ),
            ]),
          );
  }
}