import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  final String txt;

  const ChatMessage(this.txt, {Key key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.amberAccent,
            child: Text('?'),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '에고고', style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                ),
                Text(
                    txt
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
