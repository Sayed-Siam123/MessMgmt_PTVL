import 'package:Mess_Management/Handler/Appbar.dart';
import 'package:Mess_Management/Handler/Appbar_landscape.dart';
import 'package:Mess_Management/Handler/DrawerWidget.dart';
import 'package:Mess_Management/Widgets/HomeWidget/FirstContainer.dart';
import 'package:Mess_Management/Widgets/HomeWidget/FirstContainer_landscape.dart';
import 'package:Mess_Management/Widgets/HomeWidget/RecordDataHome.dart';
import 'package:Mess_Management/Widgets/HomeWidget/SecondContainer.dart';
import 'package:Mess_Management/Widgets/HomeWidget/SecondContainer_landscape.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:responsive_screen/responsive_screen.dart';
import 'package:unicorndial/unicorndial.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final bazar_amount = new TextEditingController();

  bool today_status = false;
  bool weekly_status = false;
  bool monthly_status = false;

  bool brkfst = false;
  bool lunch = false;
  bool dinner = false;

  Flushbar flush;
  bool _wasButtonClicked;

  @override
  Widget build(BuildContext context) {
    final wp = Screen(context).wp; //specify wp
    final hp = Screen(context).hp; //specify hp

    var childButtons = List<UnicornButton>();

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Meal Schedule",
        currentButton: FloatingActionButton(
          heroTag: "btn1",
          backgroundColor: Colors.yellow.shade800,
          mini: true,
          child: Icon(MaterialCommunityIcons.silverware_fork_knife),
          onPressed: () {
            setState(() {
              this.dinner = false;
              this.lunch = false;
              this.brkfst = false;
              this.weekly_status = false;
              this.today_status = false;
              this.monthly_status = false;
            });
            _showDialog_mealSchedule(hp(60), wp(75));
          },
        )));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Quick Bazar Entry",
        currentButton: FloatingActionButton(
          heroTag: "btn2",
          backgroundColor: Colors.yellow.shade800,
          mini: true,
          child: Icon(FontAwesome.shopping_bag),
          onPressed: () {
            _showDialog_quickBazarEntry(hp(50), wp(75));
          },
        )));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Utilities",
        currentButton: FloatingActionButton(
          heroTag: "btn3",
          backgroundColor: Colors.yellow.shade800,
          mini: true,
          child: Icon(
            Foundation.dollar_bill,
            size: wp(7),
          ),
            onPressed: () {


              flush = Flushbar<bool>(
                margin: EdgeInsets.only(bottom: hp(3),right: wp(2),left: wp(2)),
                borderRadius: 8,
                title: "Hey Manager/Member",
                message: "A birthday is coming tomorrow. Would you like to see?",
                icon: Icon(
                  FontAwesome.birthday_cake,
                  color: Colors.blue,
                  size: hp(2.5),
                ),
                mainButton: FlatButton(
                  onPressed: () {
                    flush.dismiss(true); // result = true
                  },
                  child: Text(
                    "WISH",
                    style: TextStyle(color: Colors.amber),
                  ),
                ),) // <bool> is the type of the result passed to dismiss() and collected by show().then((result){})
                ..show(context).then((result) {
                  setState(() { // setState() is optional here
                    _wasButtonClicked = result;
                  });
                });

            }
        )));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Add Member",
        currentButton: FloatingActionButton(
          heroTag: "btn4",
          backgroundColor: Colors.yellow.shade800,
          mini: true,
          child: Icon(
            MaterialCommunityIcons.account_multiple_plus_outline,
            size: wp(7),
          ),
          onPressed: () {
            _showDialog_addmember(hp(60), wp(75));
          },
        )));

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
                color: Theme
                    .of(context)
                    .backgroundColor,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: OrientationLayoutBuilder(
                        portrait: (context) =>
                            FirstContainer(
                              height: hp(90),
                              width: wp(100),
                              scaffoldKey: _scaffoldKey,
                            ),
                        landscape: (context) =>
                            FirstContainer_landscape(
                              height: hp(100),
                              width: wp(100),
                              scaffoldKey: _scaffoldKey,
                            ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: OrientationLayoutBuilder(
                        portrait: (context) =>
                            SecondContainer(
                              height: hp(60),
                              width: wp(100),
                            ),
                        landscape: (context) =>
                            SecondContainer_landscape(
                              height: hp(100),
                              width: wp(100),
                            ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: OrientationLayoutBuilder(
                        portrait: (context) =>
                            Appbar(height: hp(10), width: wp(100),title: "Home",),
                        landscape: (context) =>
                            Appbar_landscape(height: hp(12), width: wp(100),title: "Home",),
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
        padding: EdgeInsets.all(hp(1)),
        child: UnicornDialer(
            backgroundColor: Colors.white.withOpacity(0.6),
            hasBackground: true,
            parentButtonBackground: Colors.yellow.shade800,
            orientation: UnicornOrientation.VERTICAL,
            parentButton: Icon(
              Icons.add,
              color: Colors.black,
            ),
            childButtons: childButtons),
      ),
    );
  }

  _showDialog_quickBazarEntry(height, width) async {
    await showDialog<String>(
        context: context,
        builder: (_) =>
            StatefulBuilder(
              builder: (context, setState) {
                dynamic hp = Hp(height).hp;
                dynamic wp = Wp(width).wp;

                return new AlertDialog(
                  contentPadding: EdgeInsets.only(right: 0),
                  backgroundColor:
                  Theme
                      .of(context)
                      .focusColor
                      .withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  content: Builder(
                    builder: (context) {
                      // Get available height and width of the build area of this widget. Make a choice depending on the size.
                      // var height = MediaQuery.of(context).size.height * .6;
                      // var width = MediaQuery.of(context).size.width * .95;

                      return Container(
                        height: hp(100),
                        width: wp(100),
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                  color: Colors.grey.shade700.withOpacity(0.5))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: wp(100),
                              height: hp(10),
                              decoration: BoxDecoration(
                                color: Theme
                                    .of(context)
                                    .focusColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0)),
                              ),
                              child: Center(
                                child: Text(
                                  "Quick Bazar Entry",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6)),
                                ),
                              ),
                            ),
                            Container(
                              width: wp(100),
                              height: hp(70),
                              color:
                              Theme
                                  .of(context)
                                  .focusColor
                                  .withOpacity(0.0),
                              child: Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: hp(3),
                                    ),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Icon(
                                        FontAwesome.shopping_bag,
                                        color: Colors.yellow,
                                        size: hp(10),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: hp(16),
                                    ),
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "Please input the total amount of today's bazar",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color:
                                            Colors.white.withOpacity(0.6),
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: hp(22),
                                    ),
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              wp(4), 0, wp(4), 0),
                                          padding: EdgeInsets.fromLTRB(
                                              wp(3), 3, wp(1), 0),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border.all(
                                                color: Colors.yellow),
                                            borderRadius:
                                            BorderRadius.circular(10),
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
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                            controller: bazar_amount,
                                            enabled: true,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                InputBorder.none,
                                                hintText: "Enter Bazar Amount",
                                                suffixIcon: Icon(
                                                  MaterialCommunityIcons
                                                      .currency_bdt,
                                                  color: Colors.white
                                                      .withOpacity(0.7),
                                                ),
                                                hintStyle: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                                // errorText: _validate2 == false
                                                //     ? errortext2
                                                //     : null,
                                                contentPadding: EdgeInsets.only(
                                                    top: hp(4))),
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: hp(46),
                                    ),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        height: hp(14),
                                        width: wp(18),
                                        decoration: BoxDecoration(
                                            color: Colors.yellow,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          MaterialCommunityIcons.image_plus,
                                          color:
                                          Colors.black87.withOpacity(0.7),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: hp(61),
                                    ),
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "Upload Bazar List",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color:
                                            Colors.white.withOpacity(0.6),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: wp(100),
                              height: hp(10),
                              decoration: BoxDecoration(
                                color: Theme
                                    .of(context)
                                    .focusColor,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                              ),
                              child: Center(
                                child: Container(
                                  width: wp(35),
                                  height: hp(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(wp(3))),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Add to Bazar",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ));
  }

  _showDialog_mealSchedule(height, width) async {
    await showDialog<String>(
        context: context,
        builder: (_) =>
            StatefulBuilder(
              builder: (context, setState) {
                dynamic hp = Hp(height).hp;
                dynamic wp = Wp(width).wp;

                return new AlertDialog(
                  contentPadding: EdgeInsets.only(right: 0),
                  backgroundColor:
                  Theme
                      .of(context)
                      .focusColor
                      .withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  content: Builder(
                    builder: (context) {
                      // Get available height and width of the build area of this widget. Make a choice depending on the size.
                      // var height = MediaQuery.of(context).size.height * .6;
                      // var width = MediaQuery.of(context).size.width * .95;

                      return Container(
                        height: hp(100),
                        width: wp(100),
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                  color: Colors.grey.shade700.withOpacity(0.5))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: wp(100),
                              height: hp(10),
                              decoration: BoxDecoration(
                                color: Theme
                                    .of(context)
                                    .focusColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0)),
                              ),
                              child: Center(
                                child: Text(
                                  "Today's Meal",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6)),
                                ),
                              ),
                            ),
                            Container(
                              width: wp(100),
                              height: hp(70),
                              color:
                              Theme
                                  .of(context)
                                  .focusColor
                                  .withOpacity(0.0),
                              child: Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: hp(3),
                                    ),
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "Please Select your meal cycle for\n"
                                              "today or for the entire weekto month",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color:
                                            Colors.white.withOpacity(0.6),
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: hp(10),
                                    ),
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              wp(12), hp(2), wp(0), 0),
                                          padding: EdgeInsets.fromLTRB(
                                              wp(0), 0, wp(3), 0),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            // boxShadow: [
                                            //   BoxShadow(
                                            //       blurRadius: 5.0,
                                            //       spreadRadius: 5.0,
                                            //       offset: Offset(1, 1),
                                            //       color: Colors.grey.shade600
                                            //           .withOpacity(0.1)),
                                            // ],
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  CircularCheckBox(
                                                      value: today_status,
                                                      checkColor: Colors.white,
                                                      activeColor: Colors.yellow
                                                          .withOpacity(0.5),
                                                      inactiveColor:
                                                      Colors.yellow,
                                                      onChanged: (val) =>
                                                          setState(() {
                                                            today_status = val;
                                                            weekly_status =
                                                            false;
                                                            monthly_status =
                                                            false;
                                                          })),
                                                  SizedBox(
                                                    width: wp(0),
                                                  ),
                                                  Text(
                                                    "Today",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  CircularCheckBox(
                                                      value: weekly_status,
                                                      checkColor: Colors.white,
                                                      activeColor: Colors.yellow
                                                          .withOpacity(0.5),
                                                      inactiveColor:
                                                      Colors.yellow,
                                                      onChanged: (val) =>
                                                          setState(() {
                                                            weekly_status = val;
                                                            today_status =
                                                            false;
                                                            monthly_status =
                                                            false;
                                                          })),
                                                  SizedBox(
                                                    width: wp(0),
                                                  ),
                                                  Text(
                                                    "Weekly",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  CircularCheckBox(
                                                      value: monthly_status,
                                                      checkColor: Colors.white,
                                                      activeColor: Colors.yellow
                                                          .withOpacity(0.5),
                                                      inactiveColor:
                                                      Colors.yellow,
                                                      onChanged: (val) =>
                                                          setState(() {
                                                            monthly_status =
                                                                val;
                                                            today_status =
                                                            false;
                                                            weekly_status =
                                                            false;
                                                          })),
                                                  SizedBox(
                                                    width: wp(0),
                                                  ),
                                                  Text(
                                                    "Monthly",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10),
                                                  )
                                                ],
                                              ),
                                            ],
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: hp(23),
                                    ),
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "Please update your meal schedule before 8.00am",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 8,
                                            color: Colors.red.withOpacity(0.8),
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: hp(10),
                                      left: wp(35),
                                    ),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              CircularCheckBox(
                                                  value: brkfst,
                                                  checkColor: Colors.white,
                                                  activeColor: Colors.yellow
                                                      .withOpacity(0.5),
                                                  inactiveColor: Colors.yellow,
                                                  onChanged: (val) =>
                                                      setState(() {
                                                        brkfst = val;
                                                      })),
                                              SizedBox(
                                                width: wp(0),
                                              ),
                                              Text(
                                                "Breakfast",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              CircularCheckBox(
                                                  value: lunch,
                                                  checkColor: Colors.white,
                                                  activeColor: Colors.yellow
                                                      .withOpacity(0.5),
                                                  inactiveColor: Colors.yellow,
                                                  onChanged: (val) =>
                                                      setState(() {
                                                        lunch = val;
                                                      })),
                                              SizedBox(
                                                width: wp(0),
                                              ),
                                              Text(
                                                "Lunch",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              CircularCheckBox(
                                                  value: dinner,
                                                  checkColor: Colors.white,
                                                  activeColor: Colors.yellow
                                                      .withOpacity(0.5),
                                                  inactiveColor: Colors.yellow,
                                                  onChanged: (val) =>
                                                      setState(() {
                                                        dinner = val;
                                                      })),
                                              SizedBox(
                                                width: wp(0),
                                              ),
                                              Text(
                                                "Dinner",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              )
                                            ],
                                          ),
                                        ],
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: hp(60),
                                    ),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Stack(
                                        children: <Widget>[
                                          Text(
                                            "Note that, breakfast will count as 0.5 meal\n"
                                                "lunch and dinner will count 1.0 meal\n",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color:
                                              Colors.white.withOpacity(0.6),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: hp(6), left: wp(6)),
                                            child: Text(
                                              "see meal TERMS AND CONDITIONS",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.yellow
                                                      .withOpacity(0.6),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: wp(100),
                              height: hp(10),
                              decoration: BoxDecoration(
                                color: Theme
                                    .of(context)
                                    .focusColor,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                              ),
                              child: Center(
                                child: Container(
                                  width: wp(55),
                                  height: hp(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(wp(3))),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Update Meal Schedule",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ));
  }

  _showDialog_addmember(height, width) async {
    await showDialog<String>(
        context: context,
        builder: (_) =>
            StatefulBuilder(
              builder: (context, setState) {
                dynamic hp = Hp(height).hp;
                dynamic wp = Wp(width).wp;

                return new AlertDialog(
                  contentPadding: EdgeInsets.only(right: 0),
                  backgroundColor:
                  Theme
                      .of(context)
                      .focusColor
                      .withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  content: Builder(
                    builder: (context) {
                      // Get available height and width of the build area of this widget. Make a choice depending on the size.
                      // var height = MediaQuery.of(context).size.height * .6;
                      // var width = MediaQuery.of(context).size.width * .95;

                      return Container(
                        height: hp(90),
                        width: wp(100),
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                  color: Colors.grey.shade700.withOpacity(0.5))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: wp(100),
                              height: hp(10),
                              decoration: BoxDecoration(
                                color: Theme
                                    .of(context)
                                    .focusColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0)),
                              ),
                              child: Center(
                                child: Text(
                                  "Quick Add Member",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6)),
                                ),
                              ),
                            ),
                            Container(
                              width: wp(100),
                              height: hp(70),
                              color:
                              Theme
                                  .of(context)
                                  .focusColor
                                  .withOpacity(0.0),
                              child: Stack(
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      print("assasas");
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: hp(3),
                                      ),
                                      child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                            child: Stack(
                                              children: <Widget>[
                                                Image.asset(
                                                    "assets/images/Ellipse.png"),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      wp(6.2), hp(5), 0, 0),
                                                  child: Image.asset(
                                                      "assets/images/Vector.png"),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: hp(28),
                                    ),
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "Scan Member’s QR code to Quick Add\n"
                                              "or\n"
                                              "Manually Add Member",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color:
                                            Colors.white.withOpacity(0.6),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                _showDialog_manualaddMember(height, width);
                              },
                              child: Container(
                                width: wp(100),
                                height: hp(10),
                                decoration: BoxDecoration(
                                  color: Theme
                                      .of(context)
                                      .focusColor,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0)),
                                ),
                                child: Center(
                                  child: Container(
                                    width: wp(55),
                                    height: hp(8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(wp(3))),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Add Member",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ));
  }


  _showDialog_manualaddMember(height, width) async {
    await showDialog<String>(
        context: context,
        builder: (_) =>
            StatefulBuilder(
              builder: (context, setState) {
                dynamic hp = Hp(height).hp;
                dynamic wp = Wp(width).wp;

                return new AlertDialog(
                  scrollable: true,
                  contentPadding: EdgeInsets.only(right: 0),
                  backgroundColor:
                  Theme
                      .of(context)
                      .focusColor
                      .withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  content: Builder(
                    builder: (context) {
                      // Get available height and width of the build area of this widget. Make a choice depending on the size.
                      // var height = MediaQuery.of(context).size.height * .6;
                      // var width = MediaQuery.of(context).size.width * .95;

                      return Container(
                        height: hp(210),
                        width: wp(130),
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                  color: Colors.grey.shade700.withOpacity(0.5))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: wp(140),
                              height: hp(10),
                              decoration: BoxDecoration(
                                color: Theme
                                    .of(context)
                                    .focusColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0)),
                              ),
                              child: Center(
                                child: Text(
                                  "Add Member",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6)),
                                ),
                              ),
                            ),
                            Container(
                              width: wp(140),
                              height: hp(190),
                              color: Theme
                                  .of(context)
                                  .focusColor
                                  .withOpacity(0.0),
                              child: Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: hp(3),
                                    ),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Column(
                                        children: <Widget>[
                                          Image.asset(
                                              "assets/images/camera.png"),
                                          SizedBox(height: hp(2),),
                                          Row(
                                            children: <Widget>[
                                              Text("Capture Member’s Image or",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white
                                                      .withOpacity(0.6),
                                                ),),
                                              SizedBox(width: wp(1.5),),
                                              Text("UPLOAD", style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.yellow
                                                    .withOpacity(1),
                                              ),)
                                            ],
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                          ),

                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                wp(3), hp(4), wp(3), hp(2)),
                                            child: TextField(
                                              decoration: new InputDecoration(
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                                                ),
                                                hintText: 'Full Name',
                                                labelText: "Name",
                                                hintStyle: TextStyle(
                                                  color: Colors.white.withOpacity(0.6),
                                                ),
                                                labelStyle: TextStyle(
                                                    color: Colors.white.withOpacity(1),
                                                  )
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                wp(3), hp(2), wp(3), hp(2)),
                                            child: TextField(
                                              decoration: new InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                                                  ),
                                                  hintText: 'Occupation',
                                                  labelText: "Occupation",
                                                  hintStyle: TextStyle(
                                                    color: Colors.white.withOpacity(0.6),
                                                  ),
                                                  labelStyle: TextStyle(
                                                    color: Colors.white.withOpacity(1),
                                                  )
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                wp(3), hp(2),wp(3), hp(2)),
                                            child: TextField(
                                              decoration: new InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                                                  ),
                                                  hintText: 'Company Name',
                                                  labelText: "Company/ Organization Name",
                                                  hintStyle: TextStyle(
                                                    color: Colors.white.withOpacity(0.6),
                                                  ),
                                                  labelStyle: TextStyle(
                                                    color: Colors.white.withOpacity(1),
                                                  )
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                wp(3), hp(2), wp(3), hp(2)),
                                            child: TextField(
                                              decoration: new InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                                                  ),
                                                  hintText: 'Address',
                                                  labelText: "Permanent Address",
                                                  hintStyle: TextStyle(
                                                    color: Colors.white.withOpacity(0.6),
                                                  ),
                                                  labelStyle: TextStyle(
                                                    color: Colors.white.withOpacity(1),
                                                  )
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                wp(3),hp(2), wp(3),hp(2)),
                                            child: TextField(
                                              decoration: new InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                                                  ),
                                                  hintText: 'NID/Passport Number',
                                                  labelText: "NID/Passport",
                                                  hintStyle: TextStyle(
                                                    color: Colors.white.withOpacity(0.6),
                                                  ),
                                                  labelStyle: TextStyle(
                                                    color: Colors.white.withOpacity(1),
                                                  )
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                wp(3), hp(2), wp(3), hp(2)),
                                            child: TextField(
                                              decoration: new InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                                                  ),
                                                  hintText: 'Previous Mess Info',
                                                  labelText: "Previous Mess info (optional)",
                                                  hintStyle: TextStyle(
                                                    color: Colors.white.withOpacity(0.6),
                                                  ),
                                                  labelStyle: TextStyle(
                                                    color: Colors.white.withOpacity(1),
                                                  )
                                              ),
                                            ),
                                          ),

                                          Divider(
                                            color: Colors.yellow,
                                          ),

                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                wp(3), hp(2), wp(3), hp(2)),
                                            child: TextField(
                                              decoration: new InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                                                  ),
                                                  hintText: 'Guardian Name',
                                                  labelText: "Local Guardian's Name",
                                                  hintStyle: TextStyle(
                                                    color: Colors.white.withOpacity(0.6),
                                                  ),
                                                  labelStyle: TextStyle(
                                                    color: Colors.white.withOpacity(1),
                                                  )
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                wp(3), hp(2), wp(3), hp(2)),
                                            child: TextField(
                                              decoration: new InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                                                  ),
                                                  hintText: 'Contact Number',
                                                  labelText: "Local Guardian's Contact Number",
                                                  hintStyle: TextStyle(
                                                    color: Colors.white.withOpacity(0.6),
                                                  ),
                                                  labelStyle: TextStyle(
                                                    color: Colors.white.withOpacity(1),
                                                  )
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                wp(3), hp(2), wp(3), hp(2)),
                                            child: TextField(
                                              decoration: new InputDecoration(
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.yellow, width: 1.0),
                                                  ),
                                                  hintText: 'Relation',
                                                  labelText: "Relation with Local Guardian",
                                                  hintStyle: TextStyle(
                                                    color: Colors.white.withOpacity(0.6),
                                                  ),
                                                  labelStyle: TextStyle(
                                                    color: Colors.white.withOpacity(1),
                                                  )
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: wp(140),
                              height: hp(10),
                              decoration: BoxDecoration(
                                color: Theme
                                    .of(context)
                                    .focusColor,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                              ),
                              child: Center(
                                child: Container(
                                  width: wp(55),
                                  height: hp(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(wp(3))),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Add Member",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ));
  }

}
