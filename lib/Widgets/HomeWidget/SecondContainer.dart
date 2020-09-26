import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';

import 'RecordDataHome.dart';

class SecondContainer extends StatefulWidget {

  dynamic height;
  dynamic width;
  GlobalKey<ScaffoldState> scaffoldKey;

  SecondContainer({this.height,this.width,this.scaffoldKey});

  @override
  _SecondContainerState createState() => _SecondContainerState();
}

class _SecondContainerState extends State<SecondContainer> {
  @override
  Widget build(BuildContext context) {

    dynamic hp = Hp(widget.height).hp;
    dynamic wp = Wp(widget.width).wp;

    return Container(
      margin: EdgeInsets.fromLTRB(0, hp(70), 0, 0),
      height: hp(100),
      width: wp(100),
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              RecodDataHome(height: hp(100), width: wp(100),),
            ],
          ),
        ),
      ),
    );
  }
}
