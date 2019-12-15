//import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_drawer/energonosit_drawers.dart';


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
  double valueSecond; //переменная для сохранения величины выводимого значения
  TextEditingController valueName =
  TextEditingController(); //контроллер для сохранения наименования величины вводимого значения

  String nameValue="Выберите энергоноситель"; double tSgoraniya;
  void _nameVal(){
    setState(() async{
      SharedPreferences pref=await SharedPreferences.getInstance();
      nameValue=pref.getString("nameValue");
    });
  }
  String gaz= "Газ природный, м3"; double valGaz= 8000;//Кол-во для получения 1кВт
  String drova="Дрова, кг"; double valDrova = 3400; //Кол-во для получения 1кВт
  String pellet="Пеллеты, кг"; double valPellet = 4100; //Кол-во для получения 1кВт
  String ugol="Уголь каменный, кг"; double valUgol = 6450; //Кол-во для получения 1кВт
  String electro="Электроэнергия, кВт/ч"; double valElectro = 864; //Кол-во для получения 1кВт
  String dtoplivo="Дизель, л"; double valDt = 10300; //Кол-во для получения 1кВт
  String mazut="Мазут, л"; double valMazut = 9700; //Кол-во для получения 1кВт
  String neft="Нефть, л"; double valNeft = 10500; //Кол-во для получения 1кВт
  String benzin="Бензин, л"; double valBenzin = 10500; //Кол-во для получения 1кВт
  String gazSgigen="Газ сжиженный, кг"; double valGazSgigen = 10800; //Кол-во для получения 1кВт



  //---переменные для таблицы
  double width_tabl = 200; //ширина ячейки таблицы
  double height_tabl = 70; //высота ячейки таблицы

  // ---переменные для вывода данных
  double vT;//Выделяемое тепло при затрате определенного кол-ва топлива. кКал
  double vElectro; //выводит данные по отношению к ЭЭ
  double vGaz;//  выводит данные по отношению к природному газу
  double vUgol;//выводит данные по отношению к уголь
  double nEl;//коэф отношения к электроэнергии
  double nGaz; //коэф отношения к газ
  double nUgol;//коэф отношения к уголь
  double n=1;// переменная для хранения вводимый объем
  String nString;// переменная для хранения вводимый объем в текстовом значении
  
  final _scaffoldKey=GlobalKey<ScaffoldState>();

//  bool checkBoxValue = false; // наверное это не надо
//  bool switchValue = false;
//  double sliderValue = 0.0;
//  int _radioValue = 1;

//  Widget getComponent(String valName, double val, double kEl, double kGaz, double kUgol){
//
//    return Container(
//      width: 250,
//      height: 80,
//      padding: EdgeInsets.all(5),
//
//      child: RaisedButton(
//        elevation:
//        3.0, //убераем у нее тень (или цифрами указывается сколько пикселей с верху вниз убрать тень)
//        color: Colors.greenAccent,
//        child: Text(
//          valName,
//          textScaleFactor: 1.5,
//          textAlign: TextAlign.left,
//          style: TextStyle(
//              fontWeight: FontWeight.bold,
//              fontStyle: FontStyle.italic,
//              color: Colors.indigo),
//        ),
//        onPressed: () {
//          setState(() {
//            nameValue=valName;
//            tSgoraniya=val;//Теплота сгорания 1 топлива ккал/м3
//            nEl=kEl;
//            nGaz=kGaz;
//            nUgol=kUgol;
//            Navigator.pop(context);// закрывает выпадающее меню
//          });
//        },
//
//      ),
//    );
//
//  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      endDrawer: EnergonositDrawer(


      ),
//      Drawer(
//
//        child: ListView(
//          //mainAxisAlignment: MainAxisAlignment.start, // Разместит children как можно ближе к концу главной оси
//          children: <Widget>[
//            Container(
//              height: 50,
//            ),
//            getComponent(electro, valElectro, 1, 0.108, 0.133),
//            getComponent(gaz, valGaz, 9.3, 1, 1.24),
//            getComponent(gazSgigen, valGazSgigen, 12.5, 1.35, 1.667),
//            getComponent(ugol, valUgol, 7.5,  0.806, 1),
//            getComponent(drova, valDrova, 3.9, 0.452, 0.52),
//            getComponent(pellet, valPellet, 4.7, 0.513, 0.627),
//            getComponent(benzin, valBenzin, 12.2, 1.313, 1.627),
//            getComponent(dtoplivo, valDt, 11.9, 1.228, 1.587),
//            getComponent(mazut, valMazut, 11.2, 1.213, 1.493),
//            getComponent(neft, valNeft, 12.2, 1.313, 1.627),
//          ],
//        ),
//      ),
      key: _scaffoldKey,
      appBar: AppBar(
          title: Text(
        "Калькулятор различных видов топлива",
        maxLines: 10,
      ),
        leading: new IconButton(icon:
            new Icon(Icons.arrow_back, color: Colors.white,),
            onPressed: ()=>Navigator.of(context).pop()),
      ),
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

                      child: RaisedButton(
                        child: Text(
                          this.nameValue,
                          textScaleFactor: 1.5,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.deepOrange),
                        ),
                        onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) => EnergonositDrawer()));
                          _nameVal();
                        },
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
          Container(
            width: 250,
            height: 70,
            color: Colors.white30,
            child: Container(
              width: 230,
              height: 50,
              margin: EdgeInsets.all(15),
              color: Colors.black12,
              child: RaisedButton(
                elevation:
                3.0, //убераем у нее тень (или цифрами указывается сколько пикселей с верху вниз убрать тень)
                color: Colors.tealAccent,
                child: Text(
                  "Расчитать",
                  textScaleFactor: 1.5,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.indigo),
                ),
                onPressed: () {
                  if (nameValue=="Выберите энергоноситель"){
                    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Нажмите в верхнем правом углу меню и выберите энергоноситель"),));
                  } else{
                    if(valueFirst.text==""){
                      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Вы не ввели кол-во, Пожалуйста введите кол-во"),));
                    }else{
                      setState(() async{
                        nString=valueFirst.text;
                        print("-------------------------");
                        print("nString" + " " + nString);
                        n=double.parse(nString);
                        print("-------------------------");
                        print(n);

                        SharedPreferences pref=await SharedPreferences.getInstance();
                        vT=pref.getDouble("tSgoraniya")*n;//Теплота сгорания введенного объема топлива ккал
                        vElectro=pref.getDouble("nEl")*n;// по отношении к электроэнергии
                        vGaz=pref.getDouble("nGaz")*n;// по отношении к Газу
                        vUgol=pref.getDouble("nUgol")*n;// по отношении к Углю
                      });
                    }
                  }
                },
              ),
            ),
          ),
          Table(//вторая таблица с результатами
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
                          "Теплота сгорания введенного объема топлива, кКал",
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                    TableCell(
//                  height: height_tabl, //высота строки
                      child: Text(
                        vT.toString(),
                        textScaleFactor: 1.5,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.indigo),
                      ),
                    ),
                  ]),
              TableRow(//

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
                          "Электроэнергии для выработки этого же кол-ва тепла необходимо затратить, кВт",
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                    TableCell(
//                  height: height_tabl, //высота строки
                      child: Text(
                        vElectro.toString(),
                        textScaleFactor: 1.5,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.indigo),
                      ),
                    ),
                  ]),
              TableRow(//

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
                          "Газа природного для выработки этого же кол-ва тепла необходимо затратить, м3",
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                    TableCell(
//                  height: height_tabl, //высота строки
                      child: Text(
                        vGaz.toString(),
                        textScaleFactor: 1.5,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.indigo),
                      ),
                    ),
                  ]),
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
                          "Угля каменного для выработки этого же кол-ва тепла необходимо затратить, кг",
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87),
                        ),
                      ),
                    ),
                    TableCell(
//                  height: height_tabl, //высота строки
                      child: Text(
                        vUgol.toString(),
                        textScaleFactor: 1.5,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.indigo),
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
