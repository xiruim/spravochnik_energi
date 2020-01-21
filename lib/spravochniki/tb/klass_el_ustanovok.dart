import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:spravochnik_energi/spravochniki/main_drawer/texnica_bezopasnosti.dart';


class KlassElUstanovok extends StatefulWidget {
  @override
  _KlassElUstanovokState createState() => _KlassElUstanovokState();
}

class _KlassElUstanovokState extends State<KlassElUstanovok> {

  double h_shript = 1.2;
  double h_megduStrok = 1.0;

//---------------Текст странички--------------
  String text = '''
 \n 3.1. Электроустановки Компании подразделяются на электросиловые установки (оборудование) и радиоустановки (оборудование).
К электросиловым установкам относятся: генераторы, трансформаторы, выпрямители, электро-двигатели, распределительные устройства, силовые щиты, релейные щиты и щиты управления, устрой-ства релейной защиты и автоматики с вторичными цепями, воздушные и кабельные линии электропе-редачи, сети электроосвещения и тому подобные установки, в которых производится, передается, рас-пределяется, преобразуется по величине напряжения и тока и потребляется электроэнергия промыш-ленной частоты 50 Гц и постоянного тока.
К радиоустановкам относятся: передатчики, приемники, возбудители, оконечная аппаратура, устройства контроля, измерения, коммутации, автоматики, телеметрии и тому подобные установки, в которых подводимая электрическая энергия потребляется и преобразуется радиотехническими и элек-тронными устройствами из энергии промышленной частоты в энергию радио - или звуковой частоты.
\n 3.2. По условиям электробезопасности все электроустановки Компании подразделяются на элект-роустановки напряжением до 1000 В включительно и электроустановки напряжением выше 1000 В (по действующему значению напряжения).
\n3.3. Радиоустановки подразделяются на имеющие блокировку и без блокировки.
\n3.4. Блокировочными устройствами, не позволяющими открывать двери шкафов оборудования или заходить за их ограждения без отключения опасного напряжения, должно быть снабжено обору-дование, в котором требуется доступ обслуживающего персонала к токоведущим частям для опера-тивных переключений, перестроек и т.п. (передатчики, модуляторы).
К радиоустановкам, не имеющим блокировки, относятся радиоприемные устройства, дистанцион-но управляемые коммутаторы, усилители, тональные усилители, тональные манипуляторы, магнитофо-ны, измерительные приборы, эквиваленты, высокочастотные переключатели, фидеры и другое подоб-ное оборудование.
\n3.5. При сооружении и эксплуатации электросиловых установок следует руководствоваться соот-ветствующими требованиями Правил устройств электроустановок (ПУЭ), Правил эксплуатации элект-роустановок потребителей и Правил техники безопасности при эксплуатации электроустановок потре-бителей.

  
  ''';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: Text(
            "I. ОБЩИЕ ТРЕБОВАНИЯ\n 3. КЛАССИФИКАЦИЯ ЭЛЕКТРОУСТАНОВОК КОМПАНИИ",
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
