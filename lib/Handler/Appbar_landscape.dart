import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';

class Appbar_landscape extends StatefulWidget {

  dynamic height;
  dynamic width;

  String title;

  Appbar_landscape({this.height,this.width,this.title});

  @override
  _Appbar_landscapeState createState() => _Appbar_landscapeState();
}

class _Appbar_landscapeState extends State<Appbar_landscape> {
  @override
  Widget build(BuildContext context) {
    dynamic hp = Hp(widget.height).hp;
    dynamic wp = Wp(widget.width).wp;
    return Container(
      height: hp(100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: wp(1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.account_circle,color: Theme.of(context).hintColor,),
                SizedBox(width: wp(0),),
                Container(
                  padding: EdgeInsets.only(top: hp(7),left: wp(0.5)),
                  height: hp(52),
                  width: wp(15),
                  color: Colors.transparent,
                  child: Text("Peter Parker",style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.w600
                  ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(right: wp(10),top: hp(40)),
            child: Text(widget.title.toString(),style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).hintColor,
                fontWeight: FontWeight.w600
            ),),
          ),
          Padding(
            padding: EdgeInsets.only(right: wp(5)),
            child: IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.notifications_none,color: Theme.of(context).hintColor),
            ),
          )
        ],
      ),
      decoration: new BoxDecoration(
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
                blurRadius: 40.0,
                spreadRadius: 5,
                color: Colors.grey.shade700.withOpacity(0.9))
          ],
          // borderRadius: new BorderRadius.vertical(
          //     bottom: new Radius.elliptical(
          //         MediaQuery.of(context).size.width, 100.0)),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(wp(6)),
              bottomRight: Radius.circular(wp(6)))),
    );
  }
}
