import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget {
  @override
  _WidgetAppState createState() => _WidgetAppState();
}

class _WidgetAppState extends State<WidgetApp> {



  String sum = '';
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(0,60, 0, 0),
        child: Container(child: Center(
            child: Column(
              children: [
                Text('결과 : $sum', style: TextStyle(fontSize: 20),),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText:'숫자를 입력해주세요'
                    ),

                    keyboardType: TextInputType.number, controller: value1,),

                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText:'숫자를 입력해주세요'
                      ),
                      keyboardType: TextInputType.number, controller: value2),
                ),
                SizedBox(height: 10,),
                RaisedButton(

                  color: Colors.blueGrey,
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Text('더하기')
                    ],
                  ),
                    onPressed: (){
                    setState(() {

                      int result = int.parse(value1.text) + int.parse(value2.text);
                      sum = result.toString();

                    });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
