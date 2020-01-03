import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:spravochnik_energi/main.dart';
import 'package:spravochnik_energi/spravochniki/sechenie_and_diametr_provodnika.dart';
import 'package:spravochnik_energi/spravochniki/sprav_energonosit.dart';

class MenuViborScreen extends StatefulWidget {
  @override
  _MenuViborScreenState createState() => _MenuViborScreenState();
}

////----повторяющаяся функция контейнеров---------
//Widget getComponent({
//  Color colorFon = Colors.white,
//}) {
//  return Container(
//    color: colorFon,
//    width: 350,
//    height: 50,
//    margin: EdgeInsets.all(1), //отступы со всех сторон
//    child: FittedBox(
//      child: Image.asset("assets/116436902_energonositel.jpg"),
//      fit: BoxFit.fill,
//    ),
//  );
//}


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
            Column(children: <Widget>[
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
                        child: Image.asset("assets/116436902_energonositel.jpg", width: 22,height: 25,alignment: Alignment.bottomCenter,),
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
                            text: "Энергоносители - калькулятор энергоэффективностей разных видов топлива",
                            style: TextStyle(inherit: true,/*color: Colors.black.withOpacity(0.5), при использовании Paint color не использовать*/
                              fontSize: 20,
                              foreground: Paint()..style=PaintingStyle.stroke..strokeWidth=2..color=Colors.purple[700],// Делает обводку и границы буквы
                            ),

                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SpravEnergonositel()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ]),
            Column(children: <Widget>[
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
                        child: Image.asset("assets/xraschet-secheniya-provoda-po-diametru.jpg.pagespeed.ic.hKDCt7ETiy.jpg", width: 22,height: 25,alignment: Alignment.bottomCenter,),
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
                            text: "Расчет сечения проводника по его диаметру или диаметра по сечению",
                            style: TextStyle(inherit: true,/*color: Colors.black.withOpacity(0.5), при использовании Paint color не использовать*/
                              fontSize: 20,
                              foreground: Paint()..style=PaintingStyle.stroke..strokeWidth=2..color=Colors.purple[700],// Делает обводку и границы буквы
                            ),

                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SechenieAndDiametrProvodnika()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ],
        ));
  }
}
