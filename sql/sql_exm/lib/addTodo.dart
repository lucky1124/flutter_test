import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'todo.dart';

class AddTodoApp extends StatefulWidget {
  final Future<Database> db;

  AddTodoApp(this.db);

  @override
  _AddTodoAppState createState() => _AddTodoAppState();
}

class _AddTodoAppState extends State<AddTodoApp> {
  TextEditingController titleController;
  TextEditingController contentController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text('Todo추가'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          labelText: '제목', border: OutlineInputBorder()))),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    maxLines: 15,
                      controller: contentController,
                      decoration: InputDecoration(
                          labelText: '할일', border: OutlineInputBorder()))),
              ElevatedButton(onPressed: (){
                Todo todo = Todo(
                  title : titleController.value.text,
                  content :contentController.value.text,
                  active: false
                );
                Navigator.of(context).pop(todo);


              }, child: Text('저장하기'))
            ],
          ),
        ),
      ),
    );
  }
}
