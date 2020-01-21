import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:spravochnik_energi/spravochniki/main_drawer/texnica_bezopasnosti.dart';



class TrebovanRadioustanovkam extends StatefulWidget {
  @override
  _TrebovanRadioustanovkamState createState() => _TrebovanRadioustanovkamState();
}

class _TrebovanRadioustanovkamState extends State<TrebovanRadioustanovkam> {
  double h_shript = 1.2;
  double h_megduStrok = 1.0;

//---------------Текст странички--------------
  String text = '''
 \n 5.1. Токоведущие части радиоустановок, доступные случайному прикосновению, должны быть закрыты или ограждены в тех случаях, когда напряжение на них превышает:
в помещениях с повышенной опасностью - 42 В переменного тока и 110 В постоянного тока;
в помещениях особо опасных - 12 В постоянного и переменного тока.
 \n 5.2. Около радиооборудования с выдвижными блоками и открывающимися дверцами, при воз-можности случайного прикосновения к токоведущим частям, должны быть проложены диэлектрические ковры шириной не менее 0,7 м и длиной, соответствующей длине оборудования. Диэлектрические ков-ры прокладываются около всех видов радиооборудования в помещениях с токопроводящими полами.
 \n  5.3. Для защиты обслуживающего персонала от воздействия электромагнитных полей (ЭМП) высокочастотные установки должны быть оборудованы таким образом, чтобы на рабочих местах и в местах возможного нахождения персонала, связанного профессионально с воздействием ЭМП, напря-женность электрического (Е) и магнитного (Н)  полей в зависимости от времени их воздействия не превышала значений, рассчитанных  по 
СанПиН 2.2.4.010-03, утвержденым постановлением Главного Государственного санитарного врача Кыргызской Республики от 20. 02. 2004 г. № 10.                                                                                                                                                                                    
 \n  5.4. На рабочих местах в зоне обслуживания высокочастотных установок необходимо не реже 1 раза в год производить измерения интенсивности излучения. Измерения должны выполняться при мак-симальной используемой мощности излучения и включении всех одновременно работающих источни-ков высокой частоты.
Измерения интенсивности излучения должны также производиться при вводе в действие новых генераторных установок, при реконструкции действующих, после ремонтных работ, которые могут ока-зать влияние на интенсивность излучения.
 \n  5.5. Измерения интенсивности излучения должны производиться работниками, прошедшими спе-циальное обучение. Результаты измерений заносятся в протокол.

  
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: Text(
            "5. ТРЕБОВАНИЯ БЕЗОПАСНОСТИ К РАДИОУСТАНОВКАМ",
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
