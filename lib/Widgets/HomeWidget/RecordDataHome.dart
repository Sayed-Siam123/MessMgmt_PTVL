import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';

class RecodDataHome extends StatefulWidget {

  dynamic height;
  dynamic width;

  RecodDataHome({this.width,this.height});

  @override
  _RecodDataHomeState createState() => _RecodDataHomeState();
}

class _RecodDataHomeState extends State<RecodDataHome> {

  @override
  Widget build(BuildContext context) {
    dynamic hp = Hp(widget.height).hp;
    dynamic wp = Wp(widget.width).wp;

    return Container(
      height: hp(90),
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: hp(2)),
                    height: hp(21),
                    width: wp(40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(wp(3))),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 5,
                          color: Colors.grey.shade700.withOpacity(0.21),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Last Month",style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade400,
                        ),),
                        Text("80000.00",style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                        ),),

                        SizedBox(height: hp(2),),

                        Text("Current Month",style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade700,
                        ),),
                        Text("80000.00",style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),),
                      ],
                    ),
                  ),
                  Text("Total Deposit",style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),)
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: hp(2)),
                    height: hp(21),
                    width: wp(40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(wp(3))),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 5,
                          color: Colors.grey.shade700.withOpacity(0.21),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Last Month",style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade400,
                        ),),
                        Text("80000.00",style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                        ),),

                        SizedBox(height: hp(2),),

                        Text("Current Month",style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade700,
                        ),),
                        Text("80000.00",style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),),
                      ],
                    ),
                  ),
                  Text("Total Expenses",style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),)
                ],
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: hp(2)),
                    height: hp(21),
                    width: wp(40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(wp(3))),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 5,
                          color: Colors.grey.shade700.withOpacity(0.21),
                        )
                      ],
                    ),
                    child: Center(
                        child: Text("10",style: TextStyle(
                          fontSize: 22,
                          color: Colors.grey.shade700,
                        ),)
                    ),
                  ),
                  Text("Total Members",style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),)
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: hp(2)),
                    height: hp(21),
                    width: wp(40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(wp(3))),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 5,
                          color: Colors.grey.shade700.withOpacity(0.21),
                        )
                      ],
                    ),
                    child: Center(
                        child: Text("72350",style: TextStyle(
                          fontSize: 22,
                          color: Colors.grey.shade700,
                        ),)
                    ),
                  ),
                  Text("Daily Expenses",style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),)
                ],
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: hp(2)),
                    height: hp(21),
                    width: wp(40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(wp(3))),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 5,
                          color: Colors.grey.shade700.withOpacity(0.21),
                        )
                      ],
                    ),
                    child: Center(
                        child: Text("50",style: TextStyle(
                          fontSize: 22,
                          color: Colors.grey.shade700,
                        ),)
                    ),
                  ),
                  Text("Total Meals",style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),)
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: hp(2)),
                    height: hp(21),
                    width: wp(40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(wp(3))),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 5,
                          color: Colors.grey.shade700.withOpacity(0.21),
                        )
                      ],
                    ),
                    child: Center(
                        child: Text("22",style: TextStyle(
                          fontSize: 22,
                          color: Colors.grey.shade700,
                        ),)
                    ),
                  ),
                  Text("Total Bazar",style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),)
                ],
              ),
            ],
          )

        ],
      ),
    );
  }
}
