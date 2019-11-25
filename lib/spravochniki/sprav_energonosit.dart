import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';


//class Sprav_Energonositel extends StatefulWidget {
//  @override
//  _Sprav_EnergonositelState createState() => _Sprav_EnergonositelState();
//}
//
//class _Sprav_EnergonositelState extends State<Sprav_Energonositel> {
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}

class  Sprav_Energonositel  extends StatelessWidget {
  String title;
  Sprav_Energonositel({this.title});//создаем конструктор

  // создаем контроллеры
  TextEditingController valueFirst = TextEditingController();// контроллер для сохранения величины вводимого значения
  TextEditingController valueSecond = TextEditingController();//контроллер для сохранения величины выводимого значения

  //---переменные для таблицы
  double width_tabl =200;//ширина ячейки таблицы
  double height_tabl =50;//высота ячейки таблицы


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Калькулятор различных видов топлива", maxLines: 10,)
      ),
      body: ListView(
        children: <Widget>[
          Table(
            border: TableBorder.all(),
//            defaultVerticalAlignment:
//            TableCellVerticalAlignment.top,//базовая линия таблицы

            defaultColumnWidth:
            FixedColumnWidth(50.0),
            children: [
              TableRow(//первая строка таблицы

                children: [
                  Container(
//                    width: width_tabl,//ширина строки в данном случае не нужна
                    height: height_tabl,//высота строки
                    child: Text(
                        "Выберите энергоноситель", 
                      textScaleFactor: 1.5,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.indigo),
                    ),
                  ),
                  Container(
                    height: height_tabl,//высота строки
                    child: Text(
                      "Выберите значение",
                      textScaleFactor: 1.5,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.indigo),
                    ),),
                ]
              ),
              TableRow(//первая строка таблицы

                  children: [
                    Container(
//                    width: width_tabl,//ширина строки в данном случае не нужна
                      height: height_tabl,//высота строки
                      child: Text(
                        "Выберите энергоноситель",
                        textScaleFactor: 1.5,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.indigo),
                      ),
                    ),
                    Container(
                      height: height_tabl,//высота строки
                      child: Text(
                        "Выберите значение",
                        textScaleFactor: 1.5,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.indigo),
                      ),),
                  ]
              ),pp-
            ],
          ),

        ],
      ),
    );
  }
}
