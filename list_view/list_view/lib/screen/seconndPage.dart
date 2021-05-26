import 'package:flutter/material.dart';

import '../animalItem.dart';
class SecondPage extends StatelessWidget {

  final List<Animal> list;

  const SecondPage({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('두번째'),
      ),
    );
  }
}

