import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tour_app/data/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseDatabase? _database;
  DatabaseReference? reference;
  String _databaseUrl = 'https://modutour-d6456-default-rtdb.firebaseio.com/';

  late TextEditingController _idTextController;
  late TextEditingController _pwTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _idTextController = TextEditingController();
    _pwTextController = TextEditingController();
    _database = FirebaseDatabase(databaseURL: _databaseUrl);
    reference = _database?.reference().child('user');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap:(){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                child: Image.asset(
                  'image/camp.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '모두의 여행',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 200,
                child: TextField(
                  controller: _idTextController,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: '아이디', border: OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 200,
                child: TextField(
                  controller: _pwTextController,
                  maxLines: 1,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: '비밀번호', border: OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/sign');
                      },
                      child: Text('회원가입')),
                  SizedBox(width: 10),
                  TextButton(
                      onPressed: () {
                        if (_idTextController.value.text.length == 0 ||
                            _pwTextController.value.text.length == 0) {
                          makeDialog('빈간이 있습니다');
                        }
                        else{
                          reference!.child(_idTextController.value.text).onValue.listen((event) {
                            if(event.snapshot.value == null){
                              makeDialog('아이디가 없습니다');
                            }
                            else{
                              reference!.child(_idTextController.value.text).onChildAdded.listen((event) {
                                User user = User.fromSnapshot(event.snapshot);
                                var bytes = utf8.encode(_pwTextController.value.text);
                                var digest = sha1.convert(bytes);
                                if(user.pw == digest.toString()){
                                  Navigator.of(context).pushReplacementNamed('/main',
                                  arguments: _idTextController.value.text);
                                }
                                else{
                                  makeDialog('비빌번호가 틀립니다');
                                }
                              });
                            }
                          });
                        }
                      },
                      child: Text('로그인'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void makeDialog(String text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(text),
          );
        });
  }
}
