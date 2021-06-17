import 'dart:js';

import 'package:flutter/material.dart';

void main() {
  runApp(
    FriendlyChatApp()
  );
}

class FriendlyChatApp extends StatelessWidget {
  const FriendlyChatApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : '채팅 앱',
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();

  Widget _buildTextComposer(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
            child: TextField( 
              controller: _textController, 
              onSubmitted: _handleSubmitted, 
              decoration: const InputDecoration.collapsed(hintText: 'Send a message'), 
            ), 
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              icon: Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '채팅 앱'
        ),
      ),
      body: _buildTextComposer(),
    );
  }

  void  _handleSubmitted(String text){
    _textController.clear();
  }
}

class ChatMessage extends StatelessWidget {
  const ChatMessage({Key key, this.text}) : super(key: key);
  final String text;
  final String _name = 'Jacob';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right : 16.0),
            child: CircleAvatar(child: Text(_name[0]),),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_name, style: Theme.of(context).textTheme.headline4,),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(text),
              )
            ],
          )
        ],
      ),
    );
  }
}


// class ChatScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState()  => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen>{
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('FriendlyChat')),
//     );
//   }
// }