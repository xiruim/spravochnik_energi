
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spravochnik_energi/menu_vibor_screei.dart';
//import 'package:gif_ani/gif_ani.dart';
//import 'package:image/image.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{


  //------Функция здержки времени перед переходом на др экран------
  Future check() async{

    Timer(Duration(seconds: 5),(){
      Navigator.push(context, MaterialPageRoute(builder:(context)=>MenuViborScreen()));
    });
  }

  @override
  void initState(){
    super.initState();
    check();
  }




  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 640,height: 360)..init(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            Image.network(
//            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSHQL83wEYVsAE2j6W3boZwzofqr03YMDAcmsfhR3hAKly5wpUIg&s"),
            //Image.asset("assets/116436902_energonositel.jpg"),
            Image.asset("assets/00dd82d470562872c986afa8f03ecf43.gif"),

            SizedBox(
              height: ScreenUtil().setHeight(24),
            ),
            RichText(
              text: TextSpan(
                text: "Справочник энергетика".toUpperCase(),
                style: TextStyle(
                  color: Colors.purpleAccent, fontSize: 24,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
