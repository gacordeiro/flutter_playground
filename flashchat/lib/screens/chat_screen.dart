import 'package:flashchat/constants.dart';
import 'package:flutter/material.dart';


class ChatScreen extends StatefulWidget {
  static const id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null, //TODO check if needed
        actions: [
          IconButton(icon: Icon(Icons.close), onPressed: _closeClicked),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildMessageContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageContainer() => Container(
        decoration: kMessageContainerDecoration,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                decoration: kMessageTextFieldDecoration,
                onChanged: (value) {
                  print('onChanged: $value'); // TODO
                },
              ),
            ),
            FlatButton(
              child: Text('Send', style: kSendButtonTextStyle),
              onPressed: _sendClicked,
            )
          ],
        ),
      );

  void _closeClicked() {
    print('_closeClicked'); //TODO
  }

  void _sendClicked() {
    print('_sendClicked'); //TODO
  }
}
