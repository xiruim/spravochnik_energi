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

  // создаем контроллеры
  TextEditingController valueFirst =
      TextEditingController(); // контроллер для сохранения величины вводимого значения
  double valueSecond; //переменная для сохранения величины выводимого значения
  TextEditingController valueName =
  TextEditingController(); //контроллер для сохранения наименования величины вводимого значения

  @override
  void initState(){
    super.initState();
    _nameVal();
  }

  String nameValue="Выберите энергоноситель"; double tSgoraniya;
  void _nameVal()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    nameValue=pref.getString("nameValue");
    vT1=pref.getDouble("tSgoraniya");//Теплота сгорания 1 объема топлива ккал
    vElectro1=pref.getDouble("nEl");// по отношении к электроэнергии
    vGaz1=pref.getDouble("nGaz");// по отношении к Газу
    vUgol1=pref.getDouble("nUgol");// по отношении к Углю

    print("222222222222222222222222222222222222222");
    print("nameValue" + " " + nameValue);
    print("pref.getString(nameValue)" + " " + pref.getString("nameValue"));

    setState(() {
      print("3333333333333333333333333333333333333");
      print("nameValue" + " " + nameValue);
      print("pref.getString(nameValue)" + " " + pref.getString("nameValue"));
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
  double vT, vT1;//Выделяемое тепло при затрате определенного кол-ва топлива. кКал
  double vElectro, vElectro1; //выводит данные по отношению к ЭЭ
  double vGaz, vGaz1;//  выводит данные по отношению к природному газу
  double vUgol, vUgol1;//выводит данные по отношению к уголь
  double nEl;//коэф отношения к электроэнергии
  double nGaz; //коэф отношения к газ
  double nUgol;//коэф отношения к уголь
  double n=1;// переменная для хранения вводимый объем
  String nString;// переменная для хранения вводимый объем в текстовом значении
  
  final _scaffoldKey=GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: EnergonositDrawer(
      ),
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
                      child: Stack(
                        children: <Widget>[
                          Positioned(
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
                          Positioned(
                            child: RaisedButton(
//                              highlightColor: Colors.transparent,
                              color: Color(0x00444444),
                              highlightElevation: height_tabl,
                              onPressed: () {
                                print("rrrrrrrrrrrrrrrrrr");
                                print("nameValue" + " "+ nameValue);
                                Navigator.push(context, MaterialPageRoute(builder: (
                                    context) => EnergonositDrawer()));
                              },
                            ),
                          ),
                        ],
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
                      setState((){
                        nString=valueFirst.text;
                        print("-------------------------");
                        print("nString" + " " + nString);
                        n=double.parse(nString);
                        print("-------------------------");
                        print(n);

                        vT=vT1*n;//Теплота сгорания введенного объема топлива ккал
                        vElectro=vElectro1*n;// по отношении к электроэнергии
                        vGaz=vGaz1*n;// по отношении к Газу
                        vUgol=vUgol1*n;// по отношении к Углю
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
