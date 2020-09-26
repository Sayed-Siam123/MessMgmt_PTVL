import 'package:Mess_Management/Widgets/LoginWidget/MainContainer.dart';
import 'package:Mess_Management/Widgets/LoginWidget/MainContainer_landscape.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_screen/responsive_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final wp = Screen(context).wp; //specify wp
    final hp = Screen(context).hp; //specify hp

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).buttonColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                  width: wp(100),
                  color: Colors.transparent,
                  child: SafeArea(
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topCenter,
                          child: OrientationLayoutBuilder(
                            portrait: (context) => MainContainer(height: hp(60), width: wp(100)),
                            landscape: (context) => MainContainer_landscape(height: hp(100), width: wp(100)),
                          ),
                        )
                      ],
                    ),
                  ))
            ]),
          )
        ],
      ),
    );
  }
}
