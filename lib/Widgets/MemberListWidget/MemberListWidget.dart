import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:responsive_screen/responsive_screen.dart';

class MemberGridListWidget extends StatefulWidget {
  dynamic height;
  dynamic width;
  GlobalKey<ScaffoldState> scaffoldKey;

  MemberGridListWidget({this.height, this.width, this.scaffoldKey});

  @override
  _MemberGridListWidgetState createState() => _MemberGridListWidgetState();
}

class _MemberGridListWidgetState extends State<MemberGridListWidget> {
  List<String> data = [
    "aaaa",
    "bbb",
    "ccccc",
    "ddddd",
    "aaaa",
    "bbb",
    "ccccc",
    "ddddd",
    "aaaa",
    "bbb",
    "ccccc",
    "ddddd",
    "aaaa",
    "bbb",
    "ccccc",
  ];

  @override
  Widget build(BuildContext context) {
    dynamic hp = Hp(widget.height).hp;
    dynamic wp = Wp(widget.width).wp;

    return Container(
        margin: EdgeInsets.only(top: hp(8)),
        height: hp(82),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 5),
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(wp(2))),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 2,
                            color: Colors.grey.shade400.withOpacity(0.2),
                          )
                        ]),
                    margin: EdgeInsets.fromLTRB(wp(1), hp(1), wp(1), 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(right: wp(5),top: hp(1),bottom: hp(1)),
                                  child: new Container(
                                      width: wp(20),
                                      height: hp(10),
                                      decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                            fit: BoxFit.fill,
                                            image: new AssetImage("assets/images/user.jpg"),
                                          )
                                      )),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(right: wp(2),top: hp(1)),
                                    child: Container(
                                      height: hp(4),
                                      width: wp(7),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle
                                      ),
                                      child: Icon(Icons.delete,color: Colors.white,size: hp(2.3),),
                                    )
                                )
                              ],
                            ),
                            Text("David Gilmour",style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54
                            ),),
                            Text("NID: "+"1121314515",style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),),
                            SizedBox(height: hp(1),),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("Musician",style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.withOpacity(0.8)
                                ),),
                                Text("Pink Floyd",style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.withOpacity(0.8)
                                ),),
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: wp(100),
                          height: hp(3.7),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400.withOpacity(0.2),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(wp(2)),bottomRight: Radius.circular(wp(2)),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(MaterialCommunityIcons.chess_king,size: hp(2.2),color: Colors.grey.shade700.withOpacity(0.8),),
                                  onPressed: (){

                                  },
                                ),
                                IconButton(
                                  icon: Icon(Feather.edit,size: hp(2.2),color: Colors.grey.shade700.withOpacity(0.8),),
                                  onPressed: (){

                                  },
                                ),
                              ],
                            ),
                          ),
                        )],
                    )),
                SizedBox(height: hp(0.2),),
              ],
            );
          },
        ));
  }
}
