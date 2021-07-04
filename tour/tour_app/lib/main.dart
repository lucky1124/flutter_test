import 'package:flutter/material.dart';
import 'package:tour_app/loginPage.dart';
import 'package:tour_app/singPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' :(context) => LoginPage(),
        '/sign' : (context) => SingPage(),
      },
    );
  }
}
