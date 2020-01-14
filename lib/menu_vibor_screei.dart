import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:spravochnik_energi/main.dart';
import 'package:spravochnik_energi/spravochniki/main_drawer/texnica_bezopasnosti.dart';
import 'package:spravochnik_energi/spravochniki/sechenie_and_diametr_provodnika.dart';
import 'package:spravochnik_energi/spravochniki/sprav_energonosit.dart';

class MenuViborScreen extends StatefulWidget {
  @override
  _MenuViborScreenState createState() => _MenuViborScreenState();
}

//повторяющийся виджет контейнеров с выбором нужного экрана
Widget conteiner_obshii (BuildContext context,
    String image,
    String textNameScreen,
    nameScreen
    ){
  return Column(children: <Widget>[
    Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: horisont_padd, vertical: vertical_padd),
            decoration: BoxDecoration(
              border: Border.all(color: color_border,width: width_border),
              borderRadius: BorderRadius.all(Radius.circular(radius_border)),
              //color: color_borderRadius,
            ),
            width: width_contaner,
            height: height_contaner,
            margin: EdgeInsets.all(1), //отступы со всех сторон
            child: FittedBox(
              child: Image.asset(image, width: 22,height: 25,alignment: Alignment.bottomCenter,),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: horisont_padd, vertical: vertical_padd),
            decoration: BoxDecoration(
              border: Border.all(color: color_border,width: width_border),
              borderRadius: BorderRadius.all(Radius.circular(radius_border)),
              //color: color_borderRadius,
            ),
            width: width_contaner,
            height: height_contaner,
            margin: EdgeInsets.all(1), //отступы со всех сторон
            child: InkWell(
              child: RichText(
                text: TextSpan(
                  text: textNameScreen,
                  style: TextStyle(inherit: true,/*color: Colors.black.withOpacity(0.5), при использовании Paint color не использовать*/
                    fontSize: 20,
                    foreground: Paint()..style=PaintingStyle.stroke..strokeWidth=2..color=Colors.purple[700],// Делает обводку и границы буквы
                  ),

                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => nameScreen));
              },
            ),
          ),
        ),
      ],
    ),
  ]);
}


//---переменные для padding
double horisont_padd =5;
double vertical_padd =5;
double width_border=2;
double radius_border=10;
Color color_border = Colors.black;
Color color_borderRadius = Colors.black45;

//---переменные для контейнера
double width_contaner = 350;
double height_contaner = 250;


class _MenuViborScreenState extends State<MenuViborScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: <Widget>[
            conteiner_obshii(context, "assets/116436902_energonositel.jpg",
                "Энергоносители - калькулятор энергоэффективностей разных видов топлива",
                SpravEnergonositel()),
            conteiner_obshii(context,
                "assets/xraschet-secheniya-provoda-po-diametru.jpg.pagespeed.ic.hKDCt7ETiy.jpg",
                "Расчет сечения проводника по его диаметру или диаметра по сечению",
                SechenieAndDiametrProvodnika()),
            conteiner_obshii(context,
                "assets/tehnika-bezopasnosti-elektrobezopasnost_r_w.jpg",
                "Техника безопасности в электроустановках", TexnikaBezopasnosti())
          ],
        ));
  }
}
