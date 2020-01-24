import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:spravochnik_energi/spravochniki/main_drawer/texnica_bezopasnosti.dart';



class AKB extends StatefulWidget {
  @override
  _AKBState createState() => _AKBState();
}

class _AKBState extends State<AKB> {
  @override
  double h_shript = 1.2;
  double h_megduStrok = 1.0;

//---------------Текст странички--------------
  String text = '''
 \n 16.1. Аккумуляторное помещение должно быть всегда заперто на замок. Лицам, осматривающим эти помещения, ключи выдаются на общих основаниях.
 \n 16.2. Запрещается: курение в аккумуляторном помещении, вход в него с огнем, пользование электронагревательными приборами, аппаратами и инструментами, могущими дать искру.
На дверях аккумуляторного помещения должны быть сделаны надписи: «Аккумуляторная», «Огнеопасно»,  «Запрещается курить» или вывешены соответствующие  знаки безопасности.
  \n 16.3. Обеспечение безопасной работы при эксплуатационном обслуживании аккумуляторных установок (обслуживаемые и необслуживаемые).
  \n  16. 3.1. Аккумуляторы подразделяются на: 
  \n - кислотные (с залитым жидким или гелевым электролитом);
  \n   -щелочные.
  \n 16.3.2. При работах, связанных с техническим обслуживанием аккумуляторных установок, необходимо соблюдать меры, исключающие поражение обслуживающего персонала электрическим током и получение химических ожогов, а также меры, обеспечивающие условия взрывобезопасности и пожаробезопасности в местах размещения установок.
  \n  16.3.3. При работах с аккумуляторами следует всегда помнить, что последние имеют очень низкое внутреннее электрическое сопротивление. Поэтому при случайном коротком замыкании, даже на одном элементе, возникают большие токи разряда, что может явиться причиной сильных ожогов обслуживающего персонала, взрыва и выхода из строя части или всей батареи.
  \n  16.4. Обеспечение безопасной работы при хранении аккумуляторов.
            Хранение аккумуляторов должно осуществляться в сухих проветриваемых помещениях при температуре окружающей среды, допускаемой для данного типа аккумуляторов. При этом должна исключаться их герметичная укупорка в транспортной или иной таре.   

  
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: Text(
            "16. АККУМУЛЯТОРНЫЕ БАТАРЕИ.",
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
