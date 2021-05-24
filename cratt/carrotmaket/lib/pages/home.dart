import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> datas = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    datas = [
      {
        'image': "assets/images/ara-1.jpg",
        'title': "네미시스 축구화275",
        'location': '제주 제주시 아라동',
        'price': '30000',
        'likes': '2'
      },
      {
        'image': "assets/images/ara-2.jpg",
        'title': "LA갈비 5키로",
        'location': '제주 제주시 아라동',
        'price': '30000',
        'likes': '2'
      },
      {
        'image': "assets/images/ara-3.jpg",
        'title': "네미시스 축구화275",
        'location': '제주 제주시 아라동',
        'price': '30000',
        'likes': '2'
      },
      {
        'image': "assets/images/ara-4.jpg",
        'title': "네미시스 축구화275",
        'location': '제주 제주시 아라동',
        'price': '30000',
        'likes': '2'
      },
      {
        'image': "assets/images/ara-5.jpg",
        'title': "네미시스 축구화275",
        'location': '제주 제주시 아라동',
        'price': '30000',
        'likes': '2'
      }
    ];
  }

  Widget _appbarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print('click');
        },
        onLongPress: () {
          print('long press');
        },
        child: PopupMenuButton<String>(
          offset: Offset(0,18),
          onSelected: (String where){
            print(where);
          },
          itemBuilder: (BuildContext context){
            return[
              PopupMenuItem(child: Text("아라동"), value: "ara",),
              PopupMenuItem(child: Text("문화동"), value: "munhwa",),
              PopupMenuItem(child: Text("유천동"), value: "uchen",),

            ];
          },
          child: Row(
            children: <Widget>[
              Text(
                '아라동',
                style: TextStyle(),
              ),
              Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
      ),
      elevation: 1,
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.tune),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_none),
        ),
      ],
    );
  }

  Widget _bodyWidget() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (BuildContext _context, int index) {
          return Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        datas[index]['image'],
                        width: 100,
                        height: 100,
                      )),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            datas[index]['title'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(datas[index]['location']),
                          Text(datas[index]['price']),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.favorite_border),
                                Text(datas[index]['likes']),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ));
        },
        separatorBuilder: (BuildContext _context, int index) {
          return Container(
            height: 1,
            color: Colors.grey.withOpacity(0.4));},
        itemCount: 5,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }
}
