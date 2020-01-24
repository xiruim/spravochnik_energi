import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:spravochnik_energi/spravochniki/main_drawer/texnica_bezopasnosti.dart';



class AvariynoVosstanovitRaboti extends StatefulWidget {
  @override
  _AvariynoVosstanovitRabotiState createState() => _AvariynoVosstanovitRabotiState();
}

class _AvariynoVosstanovitRabotiState extends State<AvariynoVosstanovitRaboti> {
  @override
  double h_shript = 1.2;
  double h_megduStrok = 1.0;

//---------------Текст странички--------------
  String text = '''
 \n 12.1. Восстановительные работы в аварийных случаях, а также кратковременные, не терпящие отлагательства работы по устранению таких неисправностей оборудования, которые могут привести к аварии (зачистка и подтяжка нагревающихся контактов, очистка загрязнившейся изоляции и т.д.), разрешается производить без выписки наряда.
 \n 12.2. Работы должны производиться с выполнением всех технических мероприятий, обеспечивающих безопасность работающих.
 \n 12.3. Для устранения аварий или повреждений, чтобы сократить перерыв в действии оборудования, допускается устройство временных соединений и обходных цепей.
 \n 12.4. Временные соединения и обходные цепи не должны нарушать систему электрической и механической блокировок оборудования.
 \n 12.5. При устройстве временных соединений и обходных цепей провода напряжением выше 1000 В должны полностью прокладываться за ограждением оборудования или надежно подвешиваться на высоте не менее 2,5 м.
Если при таких соединениях применяется кабель с металлической оболочкой, то оболочка должна надежно заземляться на каждом конце кабеля.
 \n 12.6. Провода и кабели, применяющиеся для устройства временных соединений и обходных цепей, должны иметь сечение и изоляцию, соответствующие току и напряжению в поврежденной цепи.
 \n 12.7. О всех временных соединениях, обходных цепях и других проделанных при ликвидации аварии работах старший по дежурной смене должен сделать подробную запись в журнале, проинструктировать дежурный персонал своей смены о правилах безопасной эксплуатации временно восстановленных участков оборудования, а при сдаче смены - обратить внимание персонала новой смены на правила безопасной эксплуатации его.
 \n 12.8. В ближайшее время, но не позднее очередного технического осмотра на временно восстановленном оборудовании, все временные соединения и обходные цепи должны быть устранены. О ликвидации временных соединений и обходных цепей должна быть сделана запись в журнале.

  
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: Text(
            "12. АВАРИЙНО - ВОССТАНОВИТЕЛЬНЫЕ РАБОТЫ.",
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
