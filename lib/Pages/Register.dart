import 'package:Mess_Management/Widgets/RegisterWidget/MainContainer_register.dart';
import 'package:Mess_Management/Widgets/RegisterWidget/MainContainer_register_landscape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_screen/responsive_screen.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
                            portrait: (context) => MainContainer_register(height: hp(60), width: wp(100)),
                            landscape: (context) => MainContainer_register_landscape(height: hp(100), width: wp(100)),
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
