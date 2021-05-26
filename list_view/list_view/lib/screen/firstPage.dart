import 'package:flutter/material.dart';
import 'package:list_view/animalItem.dart';

class FirstPage extends StatelessWidget {

  final List<Animal> list;

  const FirstPage({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView.builder(itemBuilder : (context, position) {
            return GestureDetector(
              onTap: (){
                AlertDialog dialog = AlertDialog(
                  content: Text('이 동물은 ${list[position].kind}입니다')
                );
                showDialog(context: context, builder: (BuildContext context) => dialog);
              },

              child: Card(
                elevation: 3,
                child: Row(
                  children: [
                    Image.asset(list[position].image, height: 100,
                      width: 100,
                      fit: BoxFit.contain,),
                    SizedBox(
                      width: 20,
                    ),
                    Text(list[position].animalName),
                  ],
                ),
              ),
            );
          },
          itemCount: list.length,),
        ),
      ),
    );
  }
}
