import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Center(child: RandomWords()),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {

  List<WordPair> words = [];

  @override
  Widget build(BuildContext context) {
    final wordpair = WordPair.random();
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {

          if(index >= words.length)
            words.addAll(generateWordPairs().take(20));

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              words[index].asCamelCase,
              textScaleFactor: 1.2,
            ),
          );
        });
  }
}
