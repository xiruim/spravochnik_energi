import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:spravochnik_energi/spravochniki/main_drawer/texnica_bezopasnosti.dart';



class TrebovanSIZ extends StatefulWidget {
  @override
  _TrebovanSIZState createState() => _TrebovanSIZState();
}

class _TrebovanSIZState extends State<TrebovanSIZ> {
  double h_shript = 1.2;
  double h_megduStrok = 1.0;

//---------------Текст странички--------------
  String text = '''
 \n 6.1. Работники, эксплуатирующие оборудование Компании, должны быть обеспечены специальной одеждой, специальной обувью и другими средствами индивидуальной защиты.  
 \n 6.2. Ответственность за своевременное обеспечение спецодеждой, спецобувью и другими сред-ствами индивидуальной защиты (СИЗ) несет Компания.
 \n 6.3. Спецодежда, спецобувь и другие средства индивидуальной защиты (Приложение 1), выда-ваемые работникам, должны соответствовать характеру и условиям работы и обеспечивать безопас-ность труда.
 \n 6.4. Для хранения выданных работникам средств индивидуальной защиты работодатель предо-ставляет специально оборудованные помещения (гардеробные или шкафчики) для хранения спец-одежды, спецобуви и других СИЗ. 
 \n 6.5. Работодатель должен принимать меры к тому, чтобы работники не допускались к работе без средств индивидуальной защиты.
 \n 6.6. Ответственность за обеспечение персонала и комплектование электроустановок испытан-ными средствами защиты, организацию надлежащего хранения и создания необходимого запаса, про-изводство периодических осмотров и испытаний, изъятие непригодных средств и за организацию их учета несут руководитель технического департамента или начальник отдела энергетики.
 \n 6.7. Необходимо вести журналы учета и содержания средств защиты (Приложение 2). 
            Наличие и состояние средств защиты должно проверяться осмотром периодически, но не реже 1 раза в 6 месяцев, ответственным за их состояние с записью результатов осмотра в журнал.
 \n 6.8. При обнаружении непригодности средств защиты, выданных для отдельной электроустанов-ки, обслуживающий ее персонал обязан немедленно их изъять, поставить об этом в известность одного из лиц, указанных в п.6.6, сделать запись в журнале учета и содержания средств защиты.
 \n 6.9. Лица, получившие средства защиты в индивидуальное пользование, отвечают за правиль-ную эксплуатацию их и своевременную отбраковку.
 \n 6.10. Средства защиты размещают в специально отведенных местах. В местах хранения должны быть перечни средств защиты. 
 \n 6.11. Все находящиеся в эксплуатации электрозащитные средства и предохранительные пояса должны быть пронумерованы, за исключением касок защитных, диэлектрических ковров, плакатов и знаков безопасности, защитных ограждений. Допускается использование заводских номеров.
 \n 6.12. Изолированный инструмент, указатели напряжения до 1000 В, а также предохранительные пояса и страховочные канаты разрешается маркировать доступными средствами с записью результатов испытаний в журнале учета и содержания средств защиты.
 \n 6.13. Перед каждым применением средств защиты, персонал обязан проверить его исправность, отсутствие внешних повреждений, загрязнений, проверить по штампу срок годности.
Пользоваться средствами защиты с истекшим сроком годности запрещается.
 \n 6.14. Периодичность испытаний средств защиты  (Приложение 3). 

  
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: Text(
            "6. ТРЕБОВАНИЯ К ПРИМЕНЕНИЮ СРЕДСТВ ЗАЩИТЫ.",
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
