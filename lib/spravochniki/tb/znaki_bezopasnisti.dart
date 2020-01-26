import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:spravochnik_energi/spravochniki/main_drawer/texnica_bezopasnosti.dart';
import 'package:flutter/cupertino.dart';

class ZnakiBezopasnosti extends StatefulWidget {
  @override
  _ZnakiBezopasnostiState createState() => _ZnakiBezopasnostiState();
}

class _ZnakiBezopasnostiState extends State<ZnakiBezopasnosti> {
  double h_shript = 1.2;
  double h_megduStrok = 1.0;

//---------------Текст странички--------------
  String text = '''
 \n 

  
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: Text(
            "21. ПЛАКАТЫ И ЗНАКИ БЕЗОПАСНОСТИ.",
            textScaleFactor: 0.6,
            textAlign: TextAlign.center,
            maxLines: 10,
            style: TextStyle(color: Colors.black),
          ),
          backgroundColorStart: Colors.cyanAccent,
          backgroundColorEnd: Colors.tealAccent,
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => TexnikaBezopasnosti())),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.block),
              onPressed: () {
                setState(() {});
              },
            ),
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 2),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.2, 0.9],
                    colors: [Colors.cyanAccent, Colors.tealAccent])),
            child: ListView(children: <Widget>[
              Text(
                text,
                textScaleFactor: h_shript,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                    height: h_megduStrok),
              ),

              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 2),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.2, 0.9],
                        colors: [Colors.cyanAccent, Colors.tealAccent])),
                child: Image.asset(
                  "assets/znaki_bezopasnosti.jpg",
//                          width: 22,height: 25,alignment: Alignment.bottomCenter,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 2),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.2, 0.9],
                        colors: [Colors.cyanAccent, Colors.tealAccent])),
                child: Image.asset(
                  "assets/zapreshaushie_znaki.jpg",
//                          width: 22,height: 25,alignment: Alignment.bottomCenter,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 2),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.2, 0.9],
                        colors: [Colors.cyanAccent, Colors.tealAccent])),
                child: Image.asset(
                  "assets/predupregdaushie_znaki.jpg",
//                          width: 22,height: 25,alignment: Alignment.bottomCenter,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 2),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.2, 0.9],
                        colors: [Colors.cyanAccent, Colors.tealAccent])),
                child: Image.asset(
                  "assets/ukazatelnie_znaki.jpg",
//                          width: 22,height: 25,alignment: Alignment.bottomCenter,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 2),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.2, 0.9],
                        colors: [Colors.cyanAccent, Colors.tealAccent])),
                child: Image.asset(
                  "assets/predpisivaushie_znaki.jpg",
//                          width: 22,height: 25,alignment: Alignment.bottomCenter,
                ),
              ),
            ])));
  }
}
