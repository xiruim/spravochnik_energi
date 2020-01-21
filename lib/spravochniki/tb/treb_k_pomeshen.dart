import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:spravochnik_energi/spravochniki/main_drawer/texnica_bezopasnosti.dart';



class TrebovPomashen extends StatefulWidget {
  @override
  _TrebovPomashenState createState() => _TrebovPomashenState();
}

class _TrebovPomashenState extends State<TrebovPomashen> {
  double h_shript = 1.2;
  double h_megduStrok = 1.0;

//---------------Текст странички--------------
  String text = '''
  \n 4.1. Производственные помещения должны быть обеспечены телефонной связью между собой и с помещением, где находится старший по смене.
\n 4.2. Освещение помещений должно удовлетворять требованиям Методических указаний 2.2.4.009-03, утвержденным  постановлением Главного Государственного санитарного врача Кыргыз-ской Республики от 20 февраля 2004 года № 10.
\n 4.3.  С целью предотвращения неблагоприятного влияния на здоровье человека электромагнит-ных полей (ЭМП), создаваемых оборудованием руководствоваться Гигиеническими требованиями к размещению и эксплуатации средств сухопутной подвижной радиосвязи СанПиН 2.1.8/2.2.4.012-03.
\n 4.4. Для борьбы с избыточной инсоляцией, т.е. облучением прямыми солнечными лучами поме-щений, следует применять солнцезащитные устройства: шторы, жалюзи, солнцезащитные козырьки.
\n 4.5. Помещения должны быть оборудованы системами отопления, вентиляции и кондициониро-вания.
\n 4.6. В производственных помещениях должно быть оборудовано место для хранения защитных средств и предохранительных приспособлений.
\n 4.7. В производственных помещениях на видном месте должна быть расположена аптечка пер-вой (доврачебной) помощи. В аптечку должны быть вложены перечень медикаментов и принадлежно-стей, находящихся в ней, и инструкция по их применению.
\n 4.8. По степени опасности поражения людей электрическим током производственные помещения подразделяются на три категории:
\n а) С ПОВЫШЕННОЙ ОПАСНОСТЬЮ, в которых имеется одно из следующих условий, создающих повы-шенную опасность:
СЫРОСТЬ (относительная влажность длительно превышает 75%) или ТОКОВЕДУЩАЯ ПЫЛЬ;
ТОКОПРОВОДЯЩИЕ ПОЛЫ (металлические, земляные, железобетонные, кирпичные и т.п.);
ВЫСОКАЯ ТЕМПЕРАТУРА (температура постоянно или периодически (более 1 сут.) превышает +35°C);
возможность ОДНОВРЕМЕННОГО прикосновения человека к имеющим соединение с землей метал-локонструкциям зданий, технологическим аппаратам, механизмам и т.п., с одной стороны, и к металли-ческим корпусам электрооборудования - с другой;
\n б) ОСОБО ОПАСНЫЕ, в которых имеется одно из следующих условий, создающих особую опасность:
ОСОБАЯ СЫРОСТЬ (относительная влажность воздуха близка к 100% - потолок, стены, пол и пред-меты в помещении покрыты влагой);
ХИМИЧЕСКИ АКТИВНАЯ СРЕДА (в которой постоянно или длительное время содержатся пары или от-ложения, разрушающе действующие на изоляцию и токоведущие части оборудования);
ОДНОВРЕМЕННОЕ НАЛИЧИЕ двух или более условий повышенной опасности;
\n в) БЕЗ ПОВЫШЕННОЙ ОПАСНОСТИМ, в которых отсутствуют условия, создающие повышенную и особую опасность.
\n 4.9. Начальник отдела энергетики обязан определить степень опасности всех производственных помещений и отнести их к указанным выше категориям, оформив это приказом по Компании.
  В помещениях на видном месте вывешиваются таблички с указанием категории данного помеще-ния по степени опасности поражения электрическим током и фамилия ответственного за состояние охраны труда.
\n 4.10. При необходимости транзитного прохода шин (проводов) высокого напряжения через за-блокированные помещения эти шины (провода) должны иметь сплошное металлическое ограждение (короба, трубы и т.п.), соединенное с защитным заземлением. При этом на ограждении обязателен четкий указатель принадлежности транзита и предупреждающий знак " Осторожно! Электрическое напряжение".
\n 4.11. В помещениях с повышенной опасностью и особо опасных может быть проложена автоном-ная электросеть номинальным напряжением не выше 42 В, предназначенная для подключения элек-троинструментов и ручных электрических светильников.
\n 4.12. В помещениях при возможности одновременного прикосновения персонала к металличе-ским корпусам оборудования и трубопроводам отопления, водопровода и канализации последние сле-дует оградить токонепроводящими решетками.
\n 4.13. Для снижения уровня электромагнитного поля в помещениях за счет излучения антенн и фидерных линий, близко расположенных от зданий, части здания со стороны излучающих систем должны быть экранированы: стены - заземленными металлическими листами или сеткой в толще сте-ны, оконные проемы - заземленной металлической сеткой или специальным металлизированным стек-лом.
\n 4.14. Установка и размещение оборудования должны осуществляться с соблюдением норм и тре-бований, приведенных в таблицах 1, 2. 

  
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: Text(
            "4. ТРЕБОВАНИЯ К ПРОИЗВОДСТВЕННЫМ ПОМЕЩЕНИЯМ. РАЗМЕЩЕНИЕ ОБОРУДОВАНИЯ",
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
            ])));
  }
}