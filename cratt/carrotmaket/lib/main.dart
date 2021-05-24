import 'package:carrotmaket/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CarrotMarket',
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Home(),
              Container(),
              Container(),
              Container(),
              Container(),
            ],
          ),
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }

  Widget BottomBar(){
    return Container(
      color: Colors.white,
        height:50,
        child: TabBar(
          indicatorColor: Colors.transparent,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(icon: Icon(Icons.home), iconMargin: EdgeInsets.all(2),
            child: Text('홈',style: TextStyle(fontSize: 10),),),
            Tab(icon: Icon(Icons.speaker_notes_rounded ),iconMargin: EdgeInsets.all(2),
              child: Text('동네생활',style: TextStyle(fontSize: 10)),),
            Tab(icon: Icon(Icons.location_pin ), iconMargin: EdgeInsets.all(2),
              child: Text('내 주변',style: TextStyle(fontSize: 10)),),
            Tab(icon: Icon(Icons.chat_bubble_outline),iconMargin: EdgeInsets.all(2),
              child: Text('채팅',style: TextStyle(fontSize: 10)),),
            Tab(icon: Icon(Icons.supervised_user_circle_sharp),iconMargin: EdgeInsets.all(2),
              child: Text('나의 당근',style: TextStyle(fontSize: 10)),)
          ],
        ),
      );
  }
}
