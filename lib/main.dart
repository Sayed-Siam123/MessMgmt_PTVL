import 'dart:async';

import 'package:Mess_Management/Handler/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:splashscreen/splashscreen.dart';

import 'ColorLibrary/HexColor.dart';
import 'Pages/Home.dart';
import 'Pages/Login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // AppLanguage appLanguage = AppLanguage();
  // await appLanguage.fetchLocale();
  await GlobalConfiguration().loadFromAsset("config");
  print("base_url: ${GlobalConfiguration().getString('base_url1')}"); // need to use for api call

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
  ));  //to make top statusbar color transperent in app

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  Color white = HexColor("#FFFFFF");//white
  Color text_color1 = HexColor("#828282");
  Color text_color2 = HexColor("#BDBDBD");
  Color loginregister_back = HexColor("#33302C");
  Color dialog = HexColor("#363636");

  //#363636

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: white, //ash
        accentColor: text_color1, // blue
        hintColor: text_color2,
        buttonColor: loginregister_back,
        focusColor: dialog,
        fontFamily: 'Poppins',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  //SessionManager prefs = SessionManager();

  String userid = "";

  String loginStatus = '';


  String loginKey = "loginKey";
  String useridKey = "userid";
  String loginName = "loginName";
  String userDesignation = "userDesignation";
  String PresentStatus = "PresentStatus";
  String LateStatus = "LateStatus";
  String Intimes = "Intimes";
  String MonthPresent = "MonthPresent";
  String MonthAbesnt = "MonthAbesnt";
  String MonthLeave = "MonthLeave";
  String MonthLate = "MonthLate";

//   void getLogin() async {
//     Future<String> serverip = prefs.getData(loginKey);
//     serverip.then((data) async {
//       debugPrint('login status pabo');
//       debugPrint("login status " + data.toString());
//
//       setState(() {
//         loginStatus = data.toString();
//       });
//       debugPrint(loginStatus.toString());
//
// //      Future.delayed(const Duration(milliseconds: 1000), () {
// //
// //      });
//     }, onError: (e) {
//       print(e);
//     });
//   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer(Duration(seconds: 2), (){
    //   getLogin();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.white,
      seconds: 4,
      title: Text("Mess Management"),
      navigateAfterSeconds: LoginPage(),
      //title: new Text('IDENTIT',textScaleFactor: 2,),
      loadingText: Text("Loading"),
      photoSize: 150.0,
      loaderColor: Colors.black54,
    );
  }
}