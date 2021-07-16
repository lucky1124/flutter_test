import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tour_app/data/listData.dart';
import 'package:tour_app/data/tour.dart';
import 'package:http/http.dart' as http;
import 'package:tour_app/main/tourDetailPage.dart';

class MapPage extends StatefulWidget {
  final DatabaseReference? databaseReference;
  final Future<Database>? db;
  final String? id;

  MapPage({this.databaseReference, this.db, this.id});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<DropdownMenuItem<Item>> list = List.empty(growable: true);
  List<DropdownMenuItem<Item>> sublist = List.empty(growable: true);
  List<TourData> tourData = List.empty(growable: true);
  ScrollController? _scrollController;
  String authKey =
      'XjZgK8rFk/qBpeGwhoNnSoxZ4PyCT4Ple1zL2Y9X8wsc1pfujctWMmhNkVVUqc8H8tx9CUe5HPm1TgGI/90jqA==';
  Item? area;
  Item? kind;
  int page = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    list = Area().seoulArea;
    sublist = Kind().kinds;

    area = list[0].value;
    kind = sublist[0].value;

    _scrollController = ScrollController();
    _scrollController!.addListener(() {
      if (_scrollController!.offset >=
              _scrollController!.position.maxScrollExtent &&
          _scrollController!.position.outOfRange) {
        page++;
        getAreaList(area: area!.value, contentTypeId: kind!.value, page: page);
      }
    });
  }

  void getAreaList(
      {required int area,
      required int contentTypeId,
      required int page}) async {
    var url = 'https://api.visitkorea.or.kr/openapi/service/rest/KorService/'
        'areaBasedList?serviceKey=$authKey&pageNo=$page&numOfRows=1&MobileApp=AppTest&MobileOS=ETC'
        '&arrange=A&contentTypeId=15&areaCode=4&sigunguCode=$area&listYN=Y&_type=json';


    if (contentTypeId != 0) {
      url = url + '&contentTypeId=$contentTypeId';
    }
    var response = await http.get(Uri.parse(url));
    String body = utf8.decode(response.bodyBytes);
    print(body);
    var json = jsonDecode(body);
    print(json);
    if (json['response']['header']['resultCode'] == '0000') {
      if (json['response']['body']['items'] == '') {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('마지막 데이터 입니다'),
              );
            });
      } else {
        List jsonArray = json['response']['body']['items']['item'];
        for (var s in jsonArray) {
          setState(() {
            tourData.add(TourData.fromJson(s));
          });
        }
      }
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('검색하기'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  DropdownButton<Item>(
                    value: area,
                    onChanged: (value) {
                      Item selectedItem = value!;
                      setState(() {
                        area = selectedItem;
                      });
                    },
                    items: list,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  DropdownButton<Item>(
                    items: sublist,
                    onChanged: (value) {
                      Item selectedItem = value!;
                      setState(() {
                        kind = selectedItem;
                      });
                    },
                    value: kind,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(onPressed: (){
                    page = 1;
                    tourData.clear();
                    getAreaList(area: area!.value, contentTypeId: kind!.value, page: page);
                  }, child: Text('검색하기'))
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              )
            ],
          ),
        ),
      ),
    );
  }
}
