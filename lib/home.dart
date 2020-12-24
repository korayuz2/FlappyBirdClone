import 'dart:async';
import 'dart:math';

import 'package:flappy_bird_clone/bariyer.dart';
import 'package:flappy_bird_clone/bulut.dart';
import 'package:flappy_bird_clone/gameover.dart';
import 'package:flappy_bird_clone/kus.dart';
import 'package:flutter/material.dart';

class HomeDart extends StatefulWidget {
  @override
  _HomeDartState createState() => _HomeDartState();
}

class _HomeDartState extends State<HomeDart> {
  double ucuskontrol = 0;
  double time = 0;
  double yukseklik = 0;
  double sonyukseklik = 0;
  double hiz = 3;
  bool oyunbasladimi = false;
  double bulutbir = -1.5;
  double bulutiki = 2;
  double bulutuc = 3.85;
  double bulutdort = 7.25;
  double boruyerleskesi = 1;
  double boruyerleskesiiki = 3;
  static double borualt1 = 110.0;
  static double boruust1 = 500.0 - 130.0 - borualt1;
  static double borualt2 = 210.0;
  static double boruust2 = 500.0 - 130.0 - borualt2;

  double duvaravurma = 0;
  int rnd;
  int sayac = 0;
  int score = 0;

  void zipzip() {
    time = 0;
    sonyukseklik = ucuskontrol;
  }

  void basla() {
    sonyukseklik = ucuskontrol;
    oyunbasladimi = true;
    Timer.periodic(Duration(milliseconds: 70), (zaman) {
      time += 0.05;
      yukseklik = -5 * time * time + hiz * time;
      setState(() {
        bulutbir += -0.05;
        bulutiki += -0.05;
        bulutuc += -0.05;
        bulutdort += -0.05;
        boruyerleskesi += -0.05;
        boruyerleskesiiki += -0.05;
        ucuskontrol = sonyukseklik - yukseklik;
      });
      duvaravurma = ucuskontrol;
      duvaravurma = -duvaravurma + 1;
      duvaravurma = duvaravurma * 250;
      print(duvaravurma);

      if (boruyerleskesi < 0.3) {
        if (boruyerleskesi > -0.2) {
          if ((duvaravurma <= (borualt1 - 25) ||
              duvaravurma >= borualt1 + 175)) {
            zaman.cancel();
            oyunbasladimi = false;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GameOverDart(
                          sayacgame: sayac,
                        )));
          }
        }
      }
      if (boruyerleskesi < 0.01) {
        if (boruyerleskesi > -0.01) {
          sayac += 1;
        }
      }

      if (boruyerleskesiiki < 0.3) {
        if (boruyerleskesiiki > -0.2) {
          if (duvaravurma <= (borualt2 - 25) || duvaravurma >= borualt2 + 175) {
            zaman.cancel();
            oyunbasladimi = false;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GameOverDart(
                          sayacgame: sayac,
                        )));
          }
        }
      }

      if (boruyerleskesiiki < 0.01) {
        if (boruyerleskesiiki > -0.01) {
          sayac += 1;
        }
      }
      if (boruyerleskesi <= -1.6) {
        var rng = new Random();
        borualt1 = rng.nextInt(300) + 10.toDouble();
        boruust1 = 500.0 - 130.0 - borualt1;
        boruyerleskesi += 4;
      }
      if (boruyerleskesiiki <= -1.6) {
        var rng = new Random();
        borualt2 = rng.nextInt(300) + 10.toDouble();
        boruust2 = 500.0 - 130.0 - borualt2;
        boruyerleskesiiki += 4;
      }
      if (bulutbir <= -2.5) {
        bulutbir += 7;
      }

      if (bulutiki <= -2.5) {
        bulutiki += 7;
      }
      if (bulutuc <= -2.5) {
        bulutuc += 7;
      }
      if (bulutdort <= -2.5) {
        bulutdort += 7;
      }
      if (ucuskontrol > 1.3) {
        zaman.cancel();
        oyunbasladimi = false;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GameOverDart(
                      sayacgame: sayac,
                    )));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (oyunbasladimi == true) {
          zipzip();
        } else {
          basla();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Container(
                    color: Colors.lightBlue,
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    child: BulutDart(),
                    alignment: Alignment(bulutbir, -0.7),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    child: BulutDart(),
                    alignment: Alignment(bulutiki, -0.7),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    child: BulutDart(),
                    alignment: Alignment(bulutuc, 0),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    child: BulutDart(),
                    alignment: Alignment(bulutdort, 0),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(0, ucuskontrol),
                    child: KusDart(),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(boruyerleskesi, 1.06),
                    child: BariyerDart(
                      size: borualt1,
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(boruyerleskesi, -1.06),
                    child: BariyerDart(
                      size: boruust1,
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(boruyerleskesiiki, 1.06),
                    child: BariyerDart(
                      size: borualt2,
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(boruyerleskesiiki, -1.06),
                    child: BariyerDart(
                      size: boruust2,
                    ),
                  ),
                  Container(
                    alignment: Alignment(0, 0.2),
                    child: oyunbasladimi
                        ? Text(" ")
                        : Text(
                            "O Y N A M A K  İ Ç İ N   T I K L A",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.blue[800],
                                fontSize: 20,
                                fontStyle: FontStyle.italic),
                          ),
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
              color: Colors.green,
            ),
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.brown,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SCORE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "$sayac",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
