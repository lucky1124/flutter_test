import 'package:flutter/material.dart';
import 'package:netflex/model/model_movie.dart';
import 'package:netflex/widget/carousal_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Movie> movies = [

    Movie.fromMap({
      'title': '네멋대로해라',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'godard.jpg',
      'like': false
    }),
    Movie.fromMap({
      'title': '네멋대로해라',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'godard.jpg',
      'like': false
    }),
    Movie.fromMap({
      'title': '네멋대로해라',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'godard.jpg',
      'like': false
    }),
    Movie.fromMap({
      'title': '네멋대로해라',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'godard.jpg',
      'like': false
    })


  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            CarouselImage(movies: movies,),
            TopBar(),
          ],
        )
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'images/logo.png',
            fit: BoxFit.contain,
            height: 25,
          ),
          Container(
            child: Text('TV프로그램',
            style: TextStyle(fontSize: 14),),
          ),
          Container(
            child: Text('영화',
              style: TextStyle(fontSize: 14),),
          ),
          Container(
            child: Text('내가 찜한 콘텐츠',
              style: TextStyle(fontSize: 14),),
          )
        ],
      ),
    );
  }
}
