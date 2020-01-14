import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:spravochnik_energi/menu_vibor_screei.dart';
import 'dart:math';
import 'dart:core';

class TexnikaBezopasnosti extends StatefulWidget {
  @override
  _TexnikaBezopasnostiState createState() => _TexnikaBezopasnostiState();
}

class _TexnikaBezopasnostiState extends State<TexnikaBezopasnosti> {

  //задаем ключ
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //---переменные для таблицы
  double width_tabl = 200; //ширина ячейки таблицы
  double height_tabl = 70; //высота ячейки таблицы

  String
  nString; // текстовая переменная для перевода введенных значений в число

  // создаем контроллеры
  TextEditingController valueFirst =
  TextEditingController(); // контроллер для сохранения величины вводимого значения


  //повторяющийся виджет столбцов с лева в таблице
  Widget tablLeftComponent(
      String nameTablLeftComp, double h_shript, double h_megduStrok) {
    return TableCell(
      child: Container(
        height: height_tabl,
        padding: EdgeInsets.all(8),
        child: Text(
          nameTablLeftComp,
          textScaleFactor: h_shript,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.black87,
              height: h_megduStrok),
        ),
      ),
    );
  }

  //повторяющийся виджет столбцов по середине и справа в таблице
  Widget tablCentrRightComponent(
      String nameTablCentrRightComp, double h_shript, double h_megduStrok) {
    return TableCell(
      child: Container(
        height: height_tabl,
        padding: EdgeInsets.all(8),
        child: Text(
          nameTablCentrRightComp,
          textScaleFactor: h_shript,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.black87,
              height: h_megduStrok),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: GradientAppBar(
        title: Text(
              "Техника безопасности в электроустановках",
          textScaleFactor: 0.8,
          textAlign: TextAlign.center,
          maxLines: 10,
          style: TextStyle(color: Colors.black),

        ),
        backgroundColorStart: Colors.cyanAccent,
        backgroundColorEnd: Colors.tealAccent,
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => MenuViborScreen())),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.block),
            onPressed: () {
              setState(() {

              });
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
        child: ListView(
          children: <Widget>[
            //-----------Таблица вводных данных---------------
            Table(
              border: TableBorder.all(),
              defaultColumnWidth: FixedColumnWidth(50.0),
              children: [
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                      tablLeftComponent("Наименование величины", 1.3, 1.5),
                      tablCentrRightComponent(
                          "Значение в мм2", 1.3, 2.3)
                    ]),
                TableRow(//вторая строка таблицы
                    children: <TableCell>[
                      tablLeftComponent(
                          "Сечение проводника",
                          1.3,
                          2.3),
                      TableCell(
                        child: TextFormField(
                          controller: valueFirst,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87,
                              height: 2.3),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15.0),
                            hintText: "Введите значение",
                          ),
                        ),
                      ),
                    ]),
              ],
            ),
            //------- кнопка расчета ------------
            Container(
              width: 250,
              height: 70,
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(width: 2),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.2, 0.9],
                      colors: [Colors.indigo, Colors.blueAccent])),
              child: RaisedButton(
                elevation:
                3.0, //убераем у нее тень (или цифрами указывается сколько пикселей с верху вниз убрать тень)
                color: Colors.transparent,
                child: Text(
                  "Расчитать",
                  textScaleFactor: 1.5,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black87),
                ),
                onPressed: () {
                  if (valueFirst.text == "") {
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content:
                      Text("Вы не ввели кол-во, Пожалуйста введите кол-во"),
                    ));
                  } else {
                    setState(() {
                      nString = valueFirst.text;

                    });
                  }
                },
              ),
//              ),
            ),
            //---------- таблица выводных данных -------------
            Table(
              //вторая таблица с результатами
              border: TableBorder.all(),
              defaultColumnWidth: FixedColumnWidth(50.0),
              children: [
                TableRow(//первая строка таблицы

                    children: <TableCell>[
                      tablLeftComponent(
                          "При сечении, мм2",
                          1.3,
                          2.3),
                      tablCentrRightComponent(
                          "При гпгвггот",
                          1.3,
                          2.3)
                    ]),
                TableRow(//

                    children: <TableCell>[
                      tablLeftComponent(
                          "Диаметр =  , мм",
                          1.3,
                          2.3),
                      tablCentrRightComponent(
                          "сууаавйаПв  , мм",
                          1.3,
                          2.3) //выводим значения и ограничиваем кол-во знаков после запятой =2
                    ]),
              ],
            ),
            //-------- контейнер с названием таблицы пропускной способности ----------
            Container(
              width: 250,
              height: 500,
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(width: 1),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: horisont_padd, vertical: vertical_padd),
                decoration: BoxDecoration(
                  border: Border.all(color: color_border,width: width_border),
                  borderRadius: BorderRadius.all(Radius.circular(radius_border)),
                  //color: color_borderRadius,
                ),
                width: width_contaner,
                height: height_contaner,
                margin: EdgeInsets.all(1), //отступы со всех сторон
                child: FittedBox(
                  child: Image.asset("assets/propusknaiya_sposobnost.jpg", alignment: Alignment.bottomCenter,),
                  fit: BoxFit.fill,
                ),
              ),
//              ),
            ),
            //-------- таблица пропускной способности проводников -------
          ],
        ),
      ),
    );
  }
}

