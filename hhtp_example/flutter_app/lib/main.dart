import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget {
  @override
  _HttpAppState createState() => _HttpAppState();
}

class _HttpAppState extends State<HttpApp> {
  String result = "";
  List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    data = new List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Example'),
      ),
      body: Container(
          child: Center(
              child: data.length == 0
                  ? Text(
                      '데이터가 없습니다',
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          child: Container(
                            child: Column(
                              children: [
                                Text(data[index]['title'].toString()),
                                Text(data[index]['authors'].toString()),
                                Text(data[index]['sale_price'].toString()),
                                Text(data[index]['status'].toString()),
                                Image.network(
                                  data[index]['thumbnail'],
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.contain,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: data.length,
                    ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getJSONData();
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = 'https://dapi.kakao.com/v3/search/book?target=title&query=doit';
    var response = await http.get(Uri.parse(url),
        headers: {'Authorization': "KaKaoAK 10068e5a09bde0cc8d7364d3b2298699"});

    setState(() {
      var dataConvertedToJSON = json.decode(response.body);

      List result = dataConvertedToJSON['documents'];

      data.addAll(result);
    });

    return response.body;
  }
}
