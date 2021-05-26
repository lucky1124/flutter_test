import 'package:flutter/material.dart';
import 'package:list_view/animalItem.dart';
import 'package:list_view/screen/firstPage.dart';
import 'package:list_view/screen/seconndPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Animal> animalList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animalList.add(Animal('image/bee.png', "벌", "곤충", true));
    animalList.add(Animal('image/cat.png', "고양이", "포유류", false));
    animalList.add(Animal('image/cow.png', "소", "포유류", false));
    animalList.add(Animal('image/dog.png', "개", "포유류", false));
    animalList.add(Animal('image/fox.png', "여우", "포유류", false));
    animalList.add(Animal('image/monkey.png', "원숭이", "영장류", false));
    animalList.add(Animal('image/pig.png', "돼지", "포유류", false));
    animalList.add(Animal('image/wolf.png', "늑대", "포유류", false));


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'list view',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: TabBarView(
            children: [
              FirstPage(list: animalList,),
              SecondPage(list: animalList,)
            ],
          ),
          bottomNavigationBar: Container(
            height: 50,
            color: Color(0xFF727272),
            child: TabBar(
              indicatorColor: Colors.transparent,
              labelColor: Colors.cyan,
              unselectedLabelColor: Colors.white,
              tabs: <Tab>[
              Tab(icon: Icon(Icons.looks_one,  )),
              Tab(icon: Icon(Icons.looks_two,  ),)
            ],),
          ),
        ),

      ),
    );
  }
}
