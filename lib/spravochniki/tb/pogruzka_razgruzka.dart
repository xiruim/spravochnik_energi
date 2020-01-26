
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:spravochnik_energi/spravochniki/main_drawer/texnica_bezopasnosti.dart';



class PogruzRazgruz extends StatefulWidget {
  @override
  _PogruzRazgruzState createState() => _PogruzRazgruzState();
}

class _PogruzRazgruzState extends State<PogruzRazgruz> {
  double h_shript = 1.2;
  double h_megduStrok = 1.0;

//---------------Текст странички--------------
  String text = '''
 \n 17.1. Погрузочно - разгрузочные работы должны осуществляться на специально отведенной тер-ритории с твердым и ровным покрытием, под руководством специально выделенного инженерно - тех-нического работника, который несет непосредственную ответственность за соблюдение правил охраны труда при выполнении работ.
\n 17.2. Погрузочно - разгрузочные работы рекомендуется производить механизированным спосо-бом с помощью подъемно - транспортного оборудования (кранов, погрузчиков и т.п.) и средств малой механизации (блоков, талей и т.п.).
\n 17.3. Механизированный способ погрузочно - разгрузочных работ является обязательным для грузов массой более 20 кг, а также при подъеме грузов на высоту более 3 м.
\n 17.4. Предельная норма переноски грузов вручную по ровной и горизонтальной поверхности на одного человека не должна превышать 20 кг для мужчин старше 18 лет.
Нормы предельно допустимых нагрузок для женщин старше 18 лет при подъеме и перемещении тяжестей вручную должны соответствовать данным, приведенным в табл. 4.
                                                                                                                                                                             Таблица 4


\n Подъем и перемещение тяжестей при чередовании с другой работой (до 2 раз в час) - 10 кг
\n Подъем и перемещение тяжестей постоянно в течение рабочей смены -	7 кг
\n Величина динамической работы, совершаемой в течение каж-дого часа рабочей смены, не должна превышать:
\n с рабочей поверхности - 1750 кгм
\n с пола	- 875 кгм    



\n Примечания: 1. В массу поднимаемого и перемещаемого груза включается масса тары и упаковки.
                      \n  2. При перемещении грузов на тележках или в контейнерах прилагаемое усилие не должно превышать 10 кг.

\n 17.5. При подъеме трансформаторов, машин и другого тяжеловесного оборудования должна быть разработана схема строповки. Канат троса должен крепиться за каркасы, рамы или за специально предназначенные для этой цели детали (кольца, скобы и т.д.).
\n 17.6. Тяжеловесные грузы допускается перемещать при помощи катков по горизонтальной по-верхности.
\n 17.7. При перемещении груза на катках следует очистить путь от всех посторонних предметов. Концы катков не должны выступать из-под грузов больше, чем на 0,5 м. Для подведения катков под груз необходимо пользоваться ломами или домкратами. Во избежание опрокидывания груза следует иметь дополнительные катки, подкладываемые под переднюю часть груза.
\n 17.8. При спуске груза по наклонной плоскости необходимо применять задерживающие приспо-собления, препятствующие скатыванию или соскальзыванию груза под действием собственной тяжести или его опрокидыванию.
\n 17.9. Запрещается находиться под грузом, который перемещается, поднимается или опускается.
\n 17.10. Все погрузочно - разгрузочные работы необходимо производить в рукавицах, а при выпол-нении работ с помощью грузоподъемных механизмов - в касках.


  
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: Text(
            "17. ПОГРУЗОЧНО - РАЗГРУЗОЧНЫЕ РАБОТЫ.",
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
