import 'package:flappy_bird_clone/home.dart';
import 'package:flutter/material.dart';

class GameOverDart extends StatelessWidget {
  final sayacgame;

  GameOverDart({this.sayacgame});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.transparent, child: HomeDart()),
        Container(
          color: Colors.black.withOpacity(0.5),
        ),
        AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "G A M E  O V E R ",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "$sayacgame",
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Center(child: Text('T R Y A G A I N')),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeDart()));
              },
            ),
          ],
        )
      ],
    );
  }
}

/*AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("S C O R E"),
                  Text("aaaa"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Center(child: Text('T R Y A G A I N')),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeDart()));
                },
              ),
            ],
          ),*/

/*Scaffold(
      appBar: AppBar(
        title: Text("G A M E O V E R"),
      ),
      body: FlatButton(
        child: Text("try again"),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeDart()));
        },
      ),
    );*/
