import 'package:flutter/material.dart';
import 'package:spravochnik_energi/main.dart';
import 'package:shared_preferences/shared_preferences.dart';


class EnergonositDrawer extends StatefulWidget {
  @override
  _EnergonositDrawerState createState() => _EnergonositDrawerState();
}

class _EnergonositDrawerState extends State<EnergonositDrawer> {
  String title;

  // создаем контроллеры
  TextEditingController valueFirst =
  TextEditingController(); // контроллер для сохранения величины вводимого значения
  double valueSecond; //переменная для сохранения величины выводимого значения
  TextEditingController valueName =
  TextEditingController(); //контроллер для сохранения наименования величины вводимого значения

  String nameValue="Выберите энергоноситель"; double tSgoraniya;
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



  Widget getComponent(String valName, double val, double kEl, double kGaz, double kUgol){


  return Container(
    width: 250,
    height: 80,
    padding: EdgeInsets.all(5),

    child: RaisedButton(
      elevation:
      3.0, //убераем у нее тень (или цифрами указывается сколько пикселей с верху вниз убрать тень)
      color: Colors.greenAccent,
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

        setState(() async{
          SharedPreferences pref=await SharedPreferences.getInstance();
          await pref.setString("nameValue", valName);
          await pref.setDouble("tSgoraniya", val);
          await pref.setDouble("nEl", kEl);
          await pref.setDouble("nGaz", kGaz);
          await pref.setDouble("nUgol", kUgol);

          print("-------------------------");
          print("nameValue" + " " + pref.getString("nameValue"));

          Navigator.pop(context);// закрывает выпадающее меню
        });
      },

    ),
  );

}



  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        //mainAxisAlignment: MainAxisAlignment.start, // Разместит children как можно ближе к концу главной оси
        children: <Widget>[
          Container(
            height: 50,
          ),
          getComponent(electro, valElectro, 1, 0.108, 0.133),
          getComponent(gaz, valGaz, 9.3, 1, 1.24),
          getComponent(gazSgigen, valGazSgigen, 12.5, 1.35, 1.667),
          getComponent(ugol, valUgol, 7.5,  0.806, 1),
          getComponent(drova, valDrova, 3.9, 0.452, 0.52),
          getComponent(pellet, valPellet, 4.7, 0.513, 0.627),
          getComponent(benzin, valBenzin, 12.2, 1.313, 1.627),
          getComponent(dtoplivo, valDt, 11.9, 1.228, 1.587),
          getComponent(mazut, valMazut, 11.2, 1.213, 1.493),
          getComponent(neft, valNeft, 12.2, 1.313, 1.627),
        ],
      ),
    );
  }
}
