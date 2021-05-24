import 'package:flutter/material.dart';
import 'package:listview/favorite.dart';
import 'package:listview/search.dart';
import 'package:listview/setting.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(length: 4,
      child: Scaffold(
        body: TabBarView(children: <Widget>[
          Home(),
          Search(),
          Favorite(),
          Setting()
        ]),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: TabBar(
            labelColor: Colors.teal,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.transparent,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.search)),
              Tab(icon: Icon(Icons.favorite)),
              Tab(icon: Icon(Icons.settings))
            ],
          ),
        ),
      ),),
    );
  }
}
