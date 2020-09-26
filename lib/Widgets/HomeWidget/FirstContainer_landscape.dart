import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:responsive_screen/responsive_screen.dart';

class FirstContainer_landscape extends StatefulWidget {
  dynamic height;
  dynamic width;
  GlobalKey<ScaffoldState> scaffoldKey;

  FirstContainer_landscape({this.height,this.width,this.scaffoldKey});

  @override
  _FirstContainer_landscapeState createState() => _FirstContainer_landscapeState();
}

class _FirstContainer_landscapeState extends State<FirstContainer_landscape> {
  @override
  Widget build(BuildContext context) {


    dynamic hp = Hp(widget.height).hp;
    dynamic wp = Wp(widget.width).wp;


    return Container(
        height: hp(47),
        width: wp(100),
        margin: EdgeInsets.only(top: hp(8.5)),
        padding: EdgeInsets.only(left: wp(0), right: wp(5)),
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: hp(8),
                    width: wp(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(hp(2)),
                            bottomRight: Radius.circular(hp(2))),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 25,
                              spreadRadius: 5,
                              color: Colors.grey.shade700.withOpacity(0.4))
                        ]),
                    child: IconButton(
                      onPressed: (){
                        widget.scaffoldKey.currentState.openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        color: Colors.grey.shade700.withOpacity(0.9),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: wp(0)),
                    child: Text(
                      "Meal Rate",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade700.withOpacity(0.7),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          print("QR");
                        },
                        icon: Icon(AntDesign.qrcode),
                      ),
                      Text(
                        "My Code",
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(left: wp(4)),
                height: hp(28),
                width: wp(28),
                decoration: BoxDecoration(
                    color: Colors.yellow.shade500.withOpacity(0.6),
                    shape: BoxShape.circle),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: hp(23),
                        width: wp(23),
                        decoration: BoxDecoration(
                            color: Colors.yellow.withOpacity(0.9),
                            shape: BoxShape.circle),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child:
                          Center(
                              child: Container(
                                  height: hp(18),
                                  width: wp(18),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5,
                                          spreadRadius: 2,
                                          color: Colors.grey.shade700.withOpacity(0.2),
                                        )
                                      ]
                                  ),
                                  child: Center(child: Text("48.7 TK"))
                              )
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
