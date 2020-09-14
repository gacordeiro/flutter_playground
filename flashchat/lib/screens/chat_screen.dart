import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:firebase_auth/firebase_auth.dart' as FBAuth;
import 'package:flashchat/app_router.dart';
import 'package:flashchat/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  FBAuth.User loggedInUser;
  String messageText;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => _closeClicked(context),
          ),
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
                  onChanged: (value) => messageText = value),
            ),
            FlatButton(
              child: Text('Send', style: kSendButtonTextStyle),
              onPressed: _sendClicked,
            )
          ],
        ),
      );

  void _getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) loggedInUser = user;
      print('loggedInUser: ${loggedInUser?.email ?? "<null>"}');
    } catch (e) {
      print(e);
    }
  }

  void _closeClicked(BuildContext context) {
    _auth.signOut();
    context.navigateToWelcome();
  }

  void _sendClicked() {
    _firestore
        .collection('messages')
        .add({'text': messageText, 'sender': loggedInUser.email});
  }
}
