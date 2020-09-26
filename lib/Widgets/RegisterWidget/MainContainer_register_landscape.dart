import 'package:Mess_Management/Pages/Login.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_screen/responsive_screen.dart';

class MainContainer_register_landscape extends StatefulWidget {
  dynamic height;
  dynamic width;
  GlobalKey<ScaffoldState> scaffoldKey;

  MainContainer_register_landscape({this.height, this.width, this.scaffoldKey});

  @override
  _MainContainer_register_landscapeState createState() => _MainContainer_register_landscapeState();
}

class _MainContainer_register_landscapeState extends State<MainContainer_register_landscape> {
  final email = new TextEditingController();
  final pass = new TextEditingController();
  final name = new TextEditingController();
  final phone = new TextEditingController();
  final c_pass = new TextEditingController();

  bool checkStatus_manager = false;
  bool checkStatus_member = false;

  @override
  Widget build(BuildContext context) {
    dynamic hp = Hp(widget.height).hp;
    dynamic wp = Wp(widget.width).wp;

    return Container(
      margin: EdgeInsets.only(
          top: hp(30), left: wp(5), right: wp(5), bottom: hp(10)),
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Image.asset(
            "assets/images/logo2.png",
            height: hp(7),
          ),
          Text(
            "MessXp",
            style: TextStyle(
                color: Colors.yellow.shade700,
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: hp(10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: wp(5),bottom: hp(2)),
                child: Text("Name",style: TextStyle(
                    fontSize: 15,
                    color: Colors.yellow.shade500
                ),),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(wp(4), 0, wp(4), 0),
                  padding: EdgeInsets.fromLTRB(wp(3), 3, wp(1), 0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.yellow),
                    borderRadius: BorderRadius.circular(10),
                    // boxShadow: [
                    //   BoxShadow(
                    //       blurRadius: 5.0,
                    //       spreadRadius: 5.0,
                    //       offset: Offset(1, 1),
                    //       color: Colors.grey.shade600
                    //           .withOpacity(0.1)),
                    // ],
                  ),
                  child: TextField(
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    controller: name,
                    enabled: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "Name",
                      hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      // errorText: _validate2 == false
                      //     ? errortext2
                      //     : null,
                    ),
                  )),

              SizedBox(
                height: hp(2),
              ),

              Padding(
                padding: EdgeInsets.only(left: wp(5),bottom: hp(2)),
                child: Text("Email",style: TextStyle(
                    fontSize: 15,
                    color: Colors.yellow.shade500
                ),),
              ),

              Container(
                  margin: EdgeInsets.fromLTRB(wp(4), 0, wp(4), 0),
                  padding: EdgeInsets.fromLTRB(wp(3), 3, wp(1), 0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.yellow),
                    borderRadius: BorderRadius.circular(10),
                    // boxShadow: [
                    //   BoxShadow(
                    //       blurRadius: 5.0,
                    //       spreadRadius: 5.0,
                    //       offset: Offset(1, 1),
                    //       color: Colors.grey.shade600
                    //           .withOpacity(0.1)),
                    // ],
                  ),
                  child: TextField(
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    controller: email,
                    enabled: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "Email",
                      hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      // errorText: _validate2 == false
                      //     ? errortext2
                      //     : null,
                    ),
                  )),

              SizedBox(
                height: hp(2),
              ),

              Padding(
                padding: EdgeInsets.only(left: wp(5),bottom: hp(2)),
                child: Text("Phone Number",style: TextStyle(
                    fontSize: 15,
                    color: Colors.yellow.shade500
                ),),
              ),


              Container(
                  margin: EdgeInsets.fromLTRB(wp(4), 0, wp(4), 0),
                  padding: EdgeInsets.fromLTRB(wp(3), 3, wp(1), 0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.yellow),
                    borderRadius: BorderRadius.circular(10),
                    // boxShadow: [
                    //   BoxShadow(
                    //       blurRadius: 5.0,
                    //       spreadRadius: 5.0,
                    //       offset: Offset(1, 1),
                    //       color: Colors.grey.shade600
                    //           .withOpacity(0.1)),
                    // ],
                  ),
                  child: TextField(
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    controller: phone,
                    enabled: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "Phone Number",
                      hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      // errorText: _validate2 == false
                      //     ? errortext2
                      //     : null,
                    ),
                  )),

              SizedBox(
                height: hp(2),
              ),

              Padding(
                padding: EdgeInsets.only(left: wp(5),bottom: hp(2)),
                child: Text("Password",style: TextStyle(
                    fontSize: 15,
                    color: Colors.yellow.shade500
                ),),
              ),


              Container(
                  margin: EdgeInsets.fromLTRB(wp(4), 0, wp(4), 0),
                  padding: EdgeInsets.fromLTRB(15, 3, 5, 0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.yellow),
                    borderRadius: BorderRadius.circular(10),
                    // boxShadow: [
                    //   BoxShadow(
                    //       blurRadius: 5.0,
                    //       spreadRadius: 5.0,
                    //       offset: Offset(1, 1),
                    //       color: Colors.grey.shade600
                    //           .withOpacity(0.1)),
                    // ],
                  ),
                  child: TextField(
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    controller: pass,
                    enabled: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "Password*",
                      hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      // errorText: _validate2 == false
                      //     ? errortext2
                      //     : null,
                    ),
                  )),

              SizedBox(
                height: hp(2),
              ),

              Padding(
                padding: EdgeInsets.only(left: wp(5),bottom: hp(2)),
                child: Text("Confirm Password",style: TextStyle(
                    fontSize: 15,
                    color: Colors.yellow.shade500
                ),),
              ),


              Container(
                  margin: EdgeInsets.fromLTRB(wp(4), 0, wp(4), 0),
                  padding: EdgeInsets.fromLTRB(wp(3), 3, wp(1), 0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.yellow),
                    borderRadius: BorderRadius.circular(10),
                    // boxShadow: [
                    //   BoxShadow(
                    //       blurRadius: 5.0,
                    //       spreadRadius: 5.0,
                    //       offset: Offset(1, 1),
                    //       color: Colors.grey.shade600
                    //           .withOpacity(0.1)),
                    // ],
                  ),
                  child: TextField(
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    controller: c_pass,
                    enabled: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "Confirm Password",
                      hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      // errorText: _validate2 == false
                      //     ? errortext2
                      //     : null,
                    ),
                  )),

              SizedBox(
                height: hp(3),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircularCheckBox(
                          value: this.checkStatus_manager,
                          checkColor: Colors.white,
                          activeColor: Colors.yellow.withOpacity(0.5),
                          inactiveColor: Colors.yellow,
                          onChanged: (val) => this.setState(() {
                            this.checkStatus_manager = val;
                            this.checkStatus_member = false;
                          })),
                      SizedBox(
                        width: wp(2),
                      ),
                      Icon(
                        MaterialCommunityIcons.chess_king,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: wp(1),
                      ),
                      Text(
                        "Manager",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      CircularCheckBox(
                          value: this.checkStatus_member,
                          checkColor: Colors.white,
                          activeColor: Colors.yellow.withOpacity(0.5),
                          inactiveColor: Colors.yellow,
                          onChanged: (val) => this.setState(() {
                            this.checkStatus_member = val;
                            this.checkStatus_manager = false;
                          })),
                      SizedBox(
                        width: wp(2),
                      ),
                      Icon(
                        MaterialCommunityIcons.account,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: wp(1),
                      ),
                      Text(
                        "Member",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                height: hp(12),
                width: wp(80),
                margin: EdgeInsets.fromLTRB(wp(5), hp(5), wp(5), 0),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  border: Border.all(color: Colors.yellow),
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: [
                  //   BoxShadow(
                  //       blurRadius: 5.0,
                  //       spreadRadius: 5.0,
                  //       offset: Offset(1, 1),
                  //       color: Colors.grey.shade600
                  //           .withOpacity(0.1)),
                  // ],
                ),
                child: Center(
                  child: Text(
                    "REGISTER",
                    style: TextStyle(color: Colors.black87, fontSize: 15),
                  ),
                ),
              ),

              SizedBox(height: hp(10),),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?",style: TextStyle(
                      fontSize: 13,
                      color: Colors.white
                  ),),

                  SizedBox(width: wp(1),),

                  InkWell(
                    onTap: (){
                      print("Register page route");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text("Login here",style: TextStyle(
                      fontSize: 13,
                      color: Colors.yellow,
                      fontWeight: FontWeight.w600,
                    ),),
                  ),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
