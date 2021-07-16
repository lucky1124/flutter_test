import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tour_app/main/favoritePage.dart';
import 'package:tour_app/main/mapPage.dart';
import 'package:tour_app/main/settingPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {

  TabController? controller;
  FirebaseDatabase? _database;
  DatabaseReference? _reference;
  String _databaseURL = 'https://modutour-d6456-default-rtdb.firebaseio.com/';
  late String id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = TabController(length: 3, vsync: this);
    _database = FirebaseDatabase(databaseURL: _databaseURL);
    _reference =_database?.reference().child('tour');

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    id = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: [
          MapPage(databaseReference: _reference, id: id,),
          FavoritePage(),
          SettingPage(),
        ],
      ),
      bottomNavigationBar: TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.map),
          ),
          Tab(
            icon: Icon(Icons.star),
          ),
          Tab(
            icon: Icon(Icons.settings),
          ),
        ],
        labelColor: Colors.amber,
        unselectedLabelColor: Colors.blue,
        indicatorColor: Colors.transparent,
        controller: controller,
      ),
    );
  }
}
