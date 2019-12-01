//import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SpravEnergonositel extends StatefulWidget {
  @override
  _SpravEnergonositelState createState() => _SpravEnergonositelState();
}

class _SpravEnergonositelState extends State<SpravEnergonositel> {
  String title;
  //SpravEnergonositel({this.title}); //создаем конструктор

  // создаем контроллеры
  TextEditingController valueFirst =
      TextEditingController(); // контроллер для сохранения величины вводимого значения
  TextEditingController valueSecond =
      TextEditingController(); //контроллер для сохранения величины выводимого значения
  TextEditingController valueName =
  TextEditingController(); //контроллер для сохранения наименования величины вводимого значения

  String nameValue="Электроэнергия"; double tSgoraniya= 1;
  String gaz= "Газ природный, м3"; double valGaz= 9.3;//Кол-во для получения 1кВт
  String drova="Дрова, кг"; double valDrova = 3.9; //Кол-во для получения 1кВт
  String pellet="Пеллеты, кг"; double valPellet = 4.7; //Кол-во для получения 1кВт
  String ugol="Уголь каменный, кг"; double valUgol = 7.5; //Кол-во для получения 1кВт
  String electro="Электроэнергия, кВт/ч"; double valElectro = 1; //Кол-во для получения 1кВт
  String dtoplivo="Дизель, л"; double valDt = 11.9; //Кол-во для получения 1кВт
  String mazut="Мазут, л"; double valMazut = 11.2; //Кол-во для получения 1кВт
  String neft="Нефть, л"; double valNeft = 12.2; //Кол-во для получения 1кВт
  String benzin="Бензин, л"; double valBenzin = 12.2; //Кол-во для получения 1кВт
  String gazSgigen="Газ сжиженный, кг"; double valGazSgigen = 12.5; //Кол-во для получения 1кВт



  //---переменные для таблицы
  double width_tabl = 200; //ширина ячейки таблицы
  double height_tabl = 50; //высота ячейки таблицы

  bool checkBoxValue = false;
  bool switchValue = false;
  double sliderValue = 0.0;
  int _radioValue = 1;

  Widget getComponent(String valName, double val){

    return Container(
      width: 250,
      height: 60,
      padding: EdgeInsets.all(5),

      child: RaisedButton(
        elevation:
        3.0, //убераем у нее тень (или цифрами указывается сколько пикселей с верху вниз убрать тень)
        color: Colors.white30,
        child: Text(
          valName,
          textScaleFactor: 1.5,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.indigo),
        ),
        onPressed: () {
          setState(() {
            nameValue=valName;
            tSgoraniya=val;//Теплота сгорания 1м3 природного газа ккал/м3
            Navigator.pop(context);// закрывает выпадающее меню
          });
        },

      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Разместит children как можно ближе к концу главной оси
          children: <Widget>[
            Container(
              height: 50,
            ),
            getComponent(electro, valElectro),
            getComponent(gaz, valGaz),
            getComponent(gazSgigen, valGazSgigen),
            getComponent(ugol, valUgol),
            getComponent(drova, valDrova),
            getComponent(pellet, valPellet),
            getComponent(benzin, valBenzin),
            getComponent(dtoplivo, valDt),
            getComponent(mazut, valMazut),
            getComponent(neft, valNeft),
          ],
        ),
      ),
      appBar: AppBar(
          title: Text(
        "Калькулятор различных видов топлива",
        maxLines: 10,
      )),
      body: ListView(
        children: <Widget>[
          Table(
            border: TableBorder.all(),
//            defaultVerticalAlignment:
//            TableCellVerticalAlignment.top,//базовая линия таблицы

            defaultColumnWidth: FixedColumnWidth(50.0),
            children: [
              TableRow(//первая строка таблицы

                  children: <TableCell>[
//                TableCell(
//                   child: Icon(Icons.wifi_tethering),
//                ),
                TableCell(
//                    width: width_tabl,//ширина строки в данном случае не нужна
//                  height: height_tabl, //высота строки
                  child: Container(
                    height: height_tabl,
                    child: Text(
                      "Энергоноситель",
                      textScaleFactor: 1.5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.indigo),
                    ),
                  ),
                ),
                TableCell(
//                  height: height_tabl, //высота строки
                  child: Text(
                    "Количество",
                    textScaleFactor: 1.5,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.indigo),
                  ),
                ),
              ]),
              TableRow(//вторая строка таблицы

                  children: <TableCell>[
//                TableCell(
//                   child: Icon(Icons.wifi_tethering),
//                ),
                    TableCell(
//                    width: width_tabl,//ширина строки в данном случае не нужна
//                  height: height_tabl, //высота строки

                      child: Text(
                        nameValue,
                        textScaleFactor: 1.5,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.deepOrange),
                      ),
                    ),
                    TableCell(


                      child: TextFormField(
                        controller: valueFirst,
                        keyboardType: TextInputType.number,

                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.deepOrange
                        ),
                        decoration:
                          InputDecoration(
                            hintText: "Введите значение",
                          ),
                        textCapitalization: TextCapitalization.none,


                      ),
                    ),
                  ]),
            ],
          ),
        ],
      ),
    );
  }
}
