import 'package:chat/chat_massage.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _textEditingController = TextEditingController();
  List<ChatMessage> _chats = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: ListView.builder(
            reverse: true,
            itemBuilder: (context, index) {
            return _chats[index];
          }, itemCount: _chats.length,
          )),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Center(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: _textEditingController,
                            decoration: InputDecoration(
                                hintText: '메시지 입력창'
                            ),
                            onSubmitted: _handleSubmitted,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  FlatButton(
                      onPressed: () {
                        _handleSubmitted(_textEditingController.text);
                      },
                      child: Text(
                          'Send'
                      ), color: Colors.blueAccent
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text){

    _textEditingController.clear();
    ChatMessage newChat = ChatMessage(text);
    setState(() {
      _chats.insert(0, newChat);
    });


  }


}



