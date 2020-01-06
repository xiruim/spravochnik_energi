import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:spravochnik_energi/menu_vibor_screei.dart';
import 'dart:math';
import 'dart:core';

class SechenieAndDiametrProvodnika extends StatefulWidget {
  @override
  _SechenieAndDiametrProvodnikaState createState() =>
      _SechenieAndDiametrProvodnikaState();
}

class _SechenieAndDiametrProvodnikaState
    extends State<SechenieAndDiametrProvodnika> {
//задаем ключ
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // создаем контроллеры
  TextEditingController valueFirst =
      TextEditingController(); // контроллер для сохранения величины вводимого значения

  //Задаем логическую переменную для смены калькулятора расчета либо сечения либо диамерта
  bool isList = true;

  //---переменные для таблицы
  double width_tabl = 200; //ширина ячейки таблицы
  double height_tabl = 70; //высота ячейки таблицы

  //---переменные для расчетов
  double s = 0; //сечение проводника в мм2
  double d = 0; //диаметр проводника в мм
  String
      nString; // текстовая переменная для перевода введенных значений в число

  void diametr() {
    s = double.parse(nString);
    d = (sqrt(s * 4 / 3.14));//вычисляем корень квадрятный
  }

  void sechenie() {
    d = double.parse(nString);
    s = ((3.14 * (pow(d, 2))) / 4);// расчет с возведением в степень
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: GradientAppBar(
        title: Text(
          !isList
              ? "Калькулятор сечения проводника по его диаметру"
              : "Калькулятор диаметра проводника по его сечению",
          textScaleFactor: 0.8,
          textAlign: TextAlign.center,
          maxLines: 10,
        ),
        backgroundColorStart: Colors.lightBlueAccent,
        backgroundColorEnd: Colors.indigo,
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
            icon: Icon(!isList ? Icons.adjust : Icons.block),
            onPressed: () {
              setState(() {
                isList =
                    !isList; //при нажатии на иконку isList меняет значение на противоположное
                d=s=0;//обнуяляем значения
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
                colors: [Colors.lightBlueAccent, Colors.indigo])),
        child: ListView(
          children: <Widget>[
            Table(
              border: TableBorder.all(),
              defaultColumnWidth: FixedColumnWidth(50.0),
              children: [
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                  TableCell(
                    child: Container(
                      height: height_tabl,
                      child: Text(
                        !isList
                            ? "Наименование величины по которой будем расчитывать сечение"
                            : "Наименование величины по которой будем расчитывать диаметр",
                        textScaleFactor: 0.9,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.black87,
                            height:
                                1.3 //расстояние от верхней границы до техста
                            ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Text(
                      !isList ? "Значение в мм" : "Значение в мм2",
                      textScaleFactor: 1.5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.black87,
                          height: 2.3 //расстояние от верхней границы до техста
                          ),
                    ),
                  ),
                ]),
                TableRow(//вторая строка таблицы
                    children: <TableCell>[
                  TableCell(
                    child: Container(
                      height: height_tabl,
                      child: Text(
                        !isList ? "Диаметр проводника" : "Сечение проводника",
                        textScaleFactor: 1.5,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.black87,
                            height:
                                1.3 //расстояние от верхней границы до техста
                            ),
                      ),
                    ),
                  ),
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
                      stops: [0.2,  0.9],
                      colors: [Colors.indigo,  Colors.blueAccent])),
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
                      !isList ? sechenie() : diametr();
                    });
                  }
                },
              ),
//              ),
            ),
            Table(
              //вторая таблица с результатами
              border: TableBorder.all(),
              defaultColumnWidth: FixedColumnWidth(50.0),
              children: [
                TableRow(//первая строка таблицы

                    children: <TableCell>[
                  TableCell(
                    child: Container(
                      height: height_tabl,
                      padding: EdgeInsets.all(8),
                      child: Text(
                        !isList ? "При диаметре, мм" : "При сечении, мм2",
                        textScaleFactor: 1.3,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.black87,
                            height: 2.3
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Text(
                      !isList ? d.toString() : s.toString(),
                      textScaleFactor: 1.5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.black87,
                          height: 2.5),
                    ),
                  ),
                ]),
                TableRow(//

                    children: <TableCell>[
                  TableCell(
                    child: Container(
                      height: height_tabl + 10,
                      padding: EdgeInsets.all(8),
                      child: Text(
                        !isList ? "Сечение =  , мм2" : "Диаметр =  , мм",
                        textScaleFactor: 1.3,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.black87,
                            height: 2.3),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Text(
                      !isList ? s.toStringAsFixed(2) : d.toStringAsFixed(2),//выводим значения и ограничиваем кол-во знаков после запятой =2
                      textScaleFactor: 1.5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.black87,
                          height: 2.5),
                    ),
                  ),
                ]),
              ],
            ),
            Container(
              width: 250,
              height: 45,
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Colors.transparent,
//                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(width: 2),
//                  gradient: LinearGradient(
//                      begin: Alignment.topLeft,
//                      end: Alignment.bottomRight,
//                      stops: [0.2,  0.9],
//                      colors: [Colors.indigo,  Colors.blueAccent])
                      ),
              child: Text(
                "Пропускная способность кабеля или провода для скрытой электропроводки",
                textScaleFactor: 1.2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black87),
              ),
//              ),
            ),
            Table(
              //вторая таблица с результатами
              border: TableBorder.all(),
              defaultColumnWidth: FixedColumnWidth(50.0),
              children: [
                TableRow(//первая строка таблицы

                    children: <TableCell>[
                      TableCell(
                        child: Container(
                          height: height_tabl,
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Медь",
                            textScaleFactor: 1.3,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.black87,
                                height: 2.3
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: height_tabl,
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "220В",
                            textScaleFactor: 1.3,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.black87,
                                height: 2.3
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          height: height_tabl,
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "380В",
                            textScaleFactor: 1.3,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.black87,
                                height: 2.3
                            ),
                          ),
                        ),
                      ),
                    ]),
                TableRow(//первая строка таблицы

                    children: <TableCell>[
                      TableCell(
                        child: Container(
                          height: height_tabl,
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Ток, А",
                            textScaleFactor: 1.3,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.black87,
                                height: 2.3
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          !isList ? d.toString() : s.toString(),
                          textScaleFactor: 1.5,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87,
                              height: 2.5),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          !isList ? d.toString() : s.toString(),
                          textScaleFactor: 1.5,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87,
                              height: 2.5),
                        ),
                      ),
                    ]),
                TableRow(

                    children: <TableCell>[
                      TableCell(
                        child: Container(
                          height: height_tabl,
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Мощность, кВт",
                            textScaleFactor: 1.3,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.black87,
//                                height: 2.3
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          !isList ? d.toString() : s.toString(),
                          textScaleFactor: 1.5,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87,
                              height: 2.5),
                        ),
                      ),
                      TableCell(
                        child: Text(
                          !isList ? d.toString() : s.toString(),
                          textScaleFactor: 1.5,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87,
                              height: 2.5),
                        ),
                      ),
                    ]),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
