import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:spravochnik_energi/menu_vibor_screei.dart';
import 'dart:math';
import 'dart:core';

import 'package:spravochnik_energi/spravochniki/sprav_energonosit.dart';
import 'package:spravochnik_energi/spravochniki/tb/akkumulyatori.dart';
import 'package:spravochnik_energi/spravochniki/tb/avariyno_vosstanovit_raboti.dart';
import 'package:spravochnik_energi/spravochniki/tb/klass_el_ustanovok.dart';
import 'package:spravochnik_energi/spravochniki/tb/naznachenie_obl_primenen.dart';
import 'package:spravochnik_energi/spravochniki/tb/operativ_obslugivanie.dart';
import 'package:spravochnik_energi/spravochniki/tb/organizaczion_meropr.dart';
import 'package:spravochnik_energi/spravochniki/tb/proizvodstvo_rabot.dart';
import 'package:spravochnik_energi/spravochniki/tb/texnich_meropriiat.dart';
import 'package:spravochnik_energi/spravochniki/tb/treb_k_pomeshen.dart';
import 'package:spravochnik_energi/spravochniki/tb/treb_k_siz.dart';
import 'package:spravochnik_energi/spravochniki/tb/treb_k_zu.dart';
import 'package:spravochnik_energi/spravochniki/tb/trebov_k_radioustanovkam.dart';
import 'package:spravochnik_energi/spravochniki/tb/trebovan_k_personal.dart';

class TexnikaBezopasnosti extends StatefulWidget {
  @override
  _TexnikaBezopasnostiState createState() => _TexnikaBezopasnostiState();
}

class _TexnikaBezopasnostiState extends State<TexnikaBezopasnosti> {
  //задаем ключ
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //---переменные для таблицы
  double width_tabl = 200; //ширина ячейки таблицы
  double height_tabl = 70; //высота ячейки таблицы

  String
      nString; // текстовая переменная для перевода введенных значений в число

  // создаем контроллеры
  TextEditingController valueFirst =
      TextEditingController(); // контроллер для сохранения величины вводимого значения

  //повторяющийся виджет основных столбцов  в таблице
  Widget tablRowComponent(String nomerPoz, String nameTablComp, nameScreen,
      {double h_shript = 1.2, double h_megduStrok = 1.0}) {
    return TableCell(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: InkWell(
        child: Row(
          children: <Widget>[
            RichText(
              //Данный виджет используется, если необходимо отобразить в тексте несколько стилей. Каждый отдельный текст описывается с помощью TextSpan, в котором мы указываем необходимые нам стили. Для того чтобы не усложнять визуально код, старайтесь использовать для основного текста — стиль принятый по умолчанию, а для отличия — TextSpan:
              text: TextSpan(
                text: nomerPoz,
                style: TextStyle(
                  inherit: true,
                  color: Colors.black.withOpacity(1.0),
                  /* при использовании Paint color не использовать*/
                  fontSize: 20,
//                foreground: Paint()..style=PaintingStyle.stroke..strokeWidth=2..color=Colors.purple[700],// Делает обводку и границы буквы
                ),
              ),
            ),
            Flexible(
              //если вам придется работать с текстом, который выходит за рамки контейнера, вы можете обернуть виджет RichText или Text в виджет Flexible.
              child: RichText(
                text: TextSpan(
                  text: nameTablComp,
                  style: TextStyle(
                    inherit: true,
                    color: Colors.black.withOpacity(1.0),
                    /* при использовании Paint color не использовать*/
                    fontSize: 20,
//                foreground: Paint()..style=PaintingStyle.stroke..strokeWidth=2..color=Colors.purple[700],// Делает обводку и границы буквы
                  ),
                ),
              ),
            )
          ],
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => nameScreen));
        },
      ),
    ));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: GradientAppBar(
        title: Text(
          "Техника безопасности в электроустановках",
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
              MaterialPageRoute(builder: (context) => MenuViborScreen())),
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
        child: ListView(
          children: <Widget>[
            //-----------Таблица вводных данных---------------
            Table(
              border: TableBorder.all(width: 3, color: Colors.deepPurple),
              defaultColumnWidth: FixedColumnWidth(50.0),
              children: [
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                  tablRowComponent(
                      "1. ",
                      "Назначение и область применения правил.",
                      NaznacenieOblPrimenen()),
                ]),
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                  tablRowComponent(
                      "2. ",
                      "Требования к техническому персоналу.",
                      TrebovanPersonalu()),
                ]),
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                  tablRowComponent(
                      "3. ",
                      "Классификация электроустановок компании.",
                      KlassElUstanovok()),
                ]),
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                  tablRowComponent(
                      "4. ",
                      "Требования к помещениям. \n Размещение оборудования.",
                      TrebovPomashen()),
                ]),
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                  tablRowComponent(
                      "5. ",
                      "Требования безопасности к Радиоустановкам.",
                      TrebovanRadioustanovkam()),
                ]),
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                  tablRowComponent(
                      "6. ",
                      "Требования к применению Средств защиты.",
                      TrebovanSIZ()),
                ]),
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                  tablRowComponent("7. ", "ЗУ - заземление электроустановок.",
                      TrebovanZU()),
                ]),
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                  tablRowComponent(
                      "8. ",
                      "Оперативное обслуживание электроустановок.",
                      OperativObslugivanie()),
                ]),
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                  tablRowComponent(
                      "9. ",
                      "Производство работ в электроустановках.",
                      ProizvodstvoRabot()),
                ]),
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                  tablRowComponent(
                      "10. ",
                      "ОРГАНИЗАЦИОННЫЕ МЕРОПРИЯТИЯ, обеспечивающие безопасность работ.",
                      OrganizaczionMeropr()),
                ]),
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                  tablRowComponent(
                      "11. ",
                      "ТЕХНИЧЕСКИЕ МЕРОПРИЯТИЯ, "
                          "обеспечивающие безопасность работ, выполняемых со снятием   без снятия "
                          "напряжения на токоведущих частях и вблези них.",
                      TexnichMeropriyatiya()),
                ]),
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                  tablRowComponent(
                      "12. ",
                      "АВАРИЙНО - ВОССТАНОВИТЕЛЬНЫЕ РАБОТЫ.",
                      AvariynoVosstanovitRaboti()),
                ]),
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                  tablRowComponent("", " ", TexnikaBezopasnosti()),
                ]),
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                  tablRowComponent(
                      "16. ", "АККУМУЛЯТОРНЫЕ БАТАРЕИ.", AKB()),
                ]),
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                  tablRowComponent(
                      "17. ",
                      "17. ПОГРУЗОЧНО - РАЗГРУЗОЧНЫЕ РАБОТЫ.",
                      TexnikaBezopasnosti()),
                ]),
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                  tablRowComponent(
                      "18. ", "РАБОТЫ НА ВЫСОТЕ.", TexnikaBezopasnosti()),
                ]),
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                  tablRowComponent(
                      "19. ",
                      "Требования безопасности при работе С ЭЛЕКТРОИНСТРУМЕНТОМ, "
                          "ручными электрическими машинами и ручными электрическими светильниками.",
                      TexnikaBezopasnosti()),
                ]),
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                  tablRowComponent(
                      "20. ",
                      "ПРОВЕДЕНИЕ ИСПЫТАНИЙ ОБОРУДОВАНИЯ И ИЗМЕРЕНИЙ.",
                      TexnikaBezopasnosti()),
                ]),
                TableRow(//первая строка таблицы
                    children: <TableCell>[
                  tablRowComponent("21. ", "ПЛАКАТЫ И ЗНАКИ БЕЗОПАСНОСТИ.",
                      TexnikaBezopasnosti()),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
