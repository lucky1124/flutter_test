import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          Container(
            height: 300,
            child: Image.asset('image/camp.png', fit: BoxFit.cover,),
          )
        ],
      ),
    );
  }
}
