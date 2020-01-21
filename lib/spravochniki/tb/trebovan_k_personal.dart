import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:spravochnik_energi/spravochniki/main_drawer/texnica_bezopasnosti.dart';

class TrebovanPersonalu extends StatefulWidget {
  @override
  _TrebovanPersonaluState createState() => _TrebovanPersonaluState();
}

class _TrebovanPersonaluState extends State<TrebovanPersonalu> {
  double h_shript = 1.2;
  double h_megduStrok = 1.0;

//---------------Текст странички--------------
  String text = '''
   \n 2.1. К работам по техническому обслуживанию, монтажу и ремонту оборудования Компании до-пускаются лица старше 18 лет, прошедшие медицинский осмотр, обученные безопасным методам ра-боты, прошедшие проверку знаний правил техники безопасности, имеющие группу по электробезопас-ности не ниже II и соответствующую квалификацию.
          \n 2.2. Порядок обучения и проверки знаний Правил должны соответствовать требованиям «Поло-жения о порядке обучения охране труда и проверки знаний требованиям охраны труда работников организаций», утвержденного постановлением Правительства Кыргызской Республики от 05.04.2004 г. № 225, а также «Положения о порядке проверки знаний правил, норм и инструкций у руководителей, специалистов, рабочего персонала юридических и физических лиц, независимо от организационно-правовой формы собственности, осуществляющих деятельность в энергетическом производстве», утвержденного постановлением Исполнительного совета Государственного агентства по энергетике при Правительстве Кыргызской Республики от 19.12.2001 г. № 144-П.
      \n 2.3. Программа обучения с указанием необходимых разделов Правил должна составляться и утверждаться директором по производству по согласованию с инженером по технике безопасности и ОТ.
 \n 2.4. Для проведения проверки знаний по технике безопасности и ОТ приказом по Компании со-здается комиссия по проверке знаний.  Комиссия производит проверку знаний по ТБ и ОТ в объеме, определяемом Правилами.  
 Работнику, прошедшему проверку знаний, присваивается соответствующая группа по электро-безопасности и выдается удостоверение установленной формы, которое он обязан иметь при себе, находясь на работе.
 \n 2.5. Проверка знаний Правил должна производиться:
первичная - перед допуском к самостоятельной работе;
периодическая - в сроки, установленные Положением, указанным в п. 2.2;
внеочередная - при нарушении работником правил, при вводе в эксплуатацию нового оборудо-вания, при переводе на другую работу, если новые обязанности требуют дополнительных знаний по охране труда.
 \n 2.6. Командированные лица должны иметь удостоверения установленной формы о проверке зна-ний по технике безопасности и присвоенной группе по электробезопасности. Проверка знаний настоя-щих Правил должна производиться по месту постоянной работы.
 \n 2.7. Командированные лица при первом прибытии на место командировки проходят инструктаж по электробезопасности с учетом особенностей электроустановок, в которых им предстоит работать, а лица, на которых возлагаются обязанности выдающих наряд, руководителей работ, производителей работ и наблюдающих, проходят инструктаж и по схемам электроснабжения этих электроустановок.

 ''';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: Text(
            "I. ОБЩИЕ ТРЕБОВАНИЯ\n 2. ТРЕБОВАНИЯ К ТЕХНИЧЕСКОМУ ПЕРСОНАЛУ",
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
