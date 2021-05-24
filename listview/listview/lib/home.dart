import 'dart:math';
import 'package:flutter/material.dart';
import 'data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var list = Data().list;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 300,
                child: Text(
                  list[counter],
                  textAlign: TextAlign.center,
                  maxLines: 20,
                  softWrap: true, style: TextStyle(
                    textBaseline: TextBaseline.alphabetic, fontSize: 20.0
                ),
                )),
            FlatButton(
              color: Colors.teal,
              child: Text('바꾸기'),
              onPressed: () {
                setState(() {
                  counter = Random().nextInt(list.length);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
