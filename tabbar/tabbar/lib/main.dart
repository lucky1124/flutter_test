import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: [
            Container(
              color: Colors.blueGrey,
            ),
            Container(
              color: Colors.deepPurple,
            ),
            Container(
              color: Colors.cyan,
            ),
          ],
        ),
        bottomNavigationBar: TabBar(
          indicatorColor: Colors.transparent,
          labelColor: Colors.cyan,
          tabs: [
            Tab(
              icon: Icon(Icons.add),
              text: '1',
            ),
            Tab(icon: Icon(Icons.add), text: '2'),
            Tab(
              icon: Icon(Icons.add),
              text: '3',
            ),
          ],
        ),
      ),
    ));
  }
}
