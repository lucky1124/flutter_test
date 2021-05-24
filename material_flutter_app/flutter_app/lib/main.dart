import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '위젯 연습',
      theme: ThemeData(),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0,200, 0),
                      child: Image.asset('images/logo.png', height: 200,),
                    ),
                  ),
                  Container(
                    child:   Padding(
                      padding: const EdgeInsets.only(left:50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('전 태 성',style: TextStyle(fontFamily: 'Bazzi',
                              fontSize: 30
                          ),),
                          SizedBox(height: 10,),
                          Text('JEON TAE SEONG',style: TextStyle(fontFamily: 'Bazzi',
                              fontSize: 30
                          ),),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text('대표', style: TextStyle(fontSize: 20),),
                              SizedBox(width: 10),
                              Text('CEO', style: TextStyle(fontSize: 20)),
                            ],
                          )

                        ],
                      ),
                    )
                  )
                ],
              )),
          Expanded(
              child: Container(
                color: Color(0XFF403F3F),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 20, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Mobile : 010-9799-1124',style: TextStyle(color: Colors.white),),
                      SizedBox(height: 10,),
                      Text('Tell : 010-9799-1124',style: TextStyle(color: Colors.white)),
                      SizedBox(height: 10,),
                      Text('E-mail : lucky1124@naver.com',style: TextStyle(color: Colors.white)),
                      SizedBox(height: 10,),
                      Text('Website : lucky1124.com',style: TextStyle(color: Colors.white)),
                      SizedBox(height: 10,),
                      Divider(thickness: 2.0,endIndent:50, color: Colors.white,),
                      SizedBox(height: 10,),
                      Text('대전 중구 문화로 184-1',style: TextStyle(color: Colors.white)),


                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
