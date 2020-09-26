import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_screen/responsive_screen.dart';

class FirstContainer extends StatefulWidget {

  dynamic height;
  dynamic width;
  GlobalKey<ScaffoldState> scaffoldKey;

  FirstContainer({this.height,this.width,this.scaffoldKey});
  
  @override
  _FirstContainerState createState() => _FirstContainerState();
}

class _FirstContainerState extends State<FirstContainer> {
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
                    width: wp(15),
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
                  Text(
                    "Meal Rate",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade700.withOpacity(0.7),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      _showDialog_showqr(hp(70),wp(90));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(AntDesign.qrcode),
                        SizedBox(height: hp(.5),),
                        Text(
                          "My Code",
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
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

  _showDialog_showqr(height, width) async {
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
                                  "My QR Code",
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
                                      top: hp(6),
                                    ),
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: QrImage(
                                          data: 'This is a simple QR code',
                                          foregroundColor: Colors.white.withOpacity(0.8),
                                          version: QrVersions.auto,
                                          size: 320,
                                          gapless: false,
                                          padding: EdgeInsets.only(left: wp(2),right: wp(2)),
                                        ),),
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
                                child: Text(
                                  "Scan code for quick add",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
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
