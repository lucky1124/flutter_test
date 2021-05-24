import 'package:flutter/material.dart';
import 'package:netflex/screen/home_screen.dart';
import 'package:netflex/widget/bottom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TabController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NetFlix',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.white),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: <Widget>[
              HomeScreen(),
              Container(),
              Container(),
              Container()
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
