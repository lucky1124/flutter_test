import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sql_exm/todo.dart';

class DatabaseApp extends StatefulWidget {
  final Future<Database> db;

  DatabaseApp(this.db);

  @override
  _DatabaseAppState createState() => _DatabaseAppState();
}

class _DatabaseAppState extends State<DatabaseApp> {
  Future<List<Todo>> todoList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoList = getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DatabaseEx'),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return CircularProgressIndicator();
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.active:
                  return CircularProgressIndicator();
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemBuilder: (context, index) {
                          Todo todo = snapshot.data[index];
                          return ListTile(
                            title: Text(
                              todo.title,
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Container(
                              child: Column(
                                children: [
                                  Text(todo.content),
                                  Text('체크:${todo.active.toString()}'),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                          onPressed: () async {
                                            TextEditingController controller =
                                                TextEditingController(
                                                    text: todo.content);

                                            Todo result = await showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        '${todo.title}'),
                                                    content: TextField(
                                                      controller: controller,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration: InputDecoration(
                                                        labelText: '수정사항입력',
                                                        border: OutlineInputBorder()
                                                      ),
                                                    ),
                                                    actions: [
                                                      Text(
                                                        '다 끝내셨나요?',
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      ),
                                                      TextButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              todo.active ==
                                                                      true
                                                                  ? todo.active =
                                                                      false
                                                                  : todo.active =
                                                                      true;
                                                              todo.content =
                                                                  controller
                                                                      .value
                                                                      .text;
                                                            });
                                                            Navigator.of(
                                                                    context)
                                                                .pop(todo);
                                                          },
                                                          child: Text('예')),
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('아니오')),
                                                    ],
                                                  );
                                                });
                                            if (result != null) {
                                              _upDateTodo(result);
                                            }
                                          },
                                          child: Text('수정하기')),
                                      TextButton(
                                          onPressed: () async {
                                            Todo result = await showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        '${todo.id}:${todo.title}'),
                                                    content: Text(
                                                        '${todo.content}를 삭제하시겠습니까?'),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop(todo);
                                                          },
                                                          child: Text('예')),
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('아니오'))
                                                    ],
                                                  );
                                                });
                                            if (result != null) {
                                              _deleteTodo(result);
                                            }
                                          },
                                          child: Text('삭제하기')),
                                    ],
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.blue,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: snapshot.data.length);
                  } else {
                    return Text('No data');
                  }
              }
              return CircularProgressIndicator();
            },
            future: todoList,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final todo = await Navigator.of(context).pushNamed('/add');
          _insertTodo(todo);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _insertTodo(Todo todo) async {
    final Database database = await widget.db;
    await database.insert('todos', todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    setState(() {
      todoList = getTodos();
    });
  }

  Future<List<Todo>> getTodos() async {
    final Database database = await widget.db;
    final List<Map<String, dynamic>> maps = await database.query('todos');

    return List.generate(maps.length, (i) {
      bool active = maps[i]['active'] == 1 ? true : false;
      return Todo(
          title: maps[i]['title'].toString(),
          content: maps[i]['content'].toString(),
          active: active,
          id: maps[i]['id']);
    });
  }

  void _upDateTodo(Todo todo) async {
    final Database database = await widget.db;
    await database.update(
      'todos',
      todo.toMap(),
      where: 'id=?',
      whereArgs: [todo.id],
    );
    setState(() {
      todoList = getTodos();
    });
  }

  void _deleteTodo(Todo todo) async {
    final Database database = await widget.db;
    await database.delete('todos', where: 'id=?', whereArgs: [todo.id]);
    setState(() {
      todoList = getTodos();
    });
  }
}
