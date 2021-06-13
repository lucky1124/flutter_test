import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'addTodo.dart';
import 'databaseapp.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {

  Future<Database> initDatabase() async {
    return openDatabase(join(await getDatabasesPath(), 'todo_database.db'),
        onCreate: (db, version) {
          return db.execute(
              "CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, active BOOL)");
        }, version: 1);
  }

  @override
  Widget build(BuildContext context) {
    Future<Database> database = initDatabase();

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => DatabaseApp(database),
        '/add':(context) => AddTodoApp(database),
      },
    );
  }

}
