import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class NewMessages extends StatefulWidget {
  NewMessages(this.FEmail);
  String FEmail;
  @override
  _NewMessagesState createState() => _NewMessagesState(FEmail);
}

class _NewMessagesState extends State<NewMessages> {
  _NewMessagesState(this.FEmail);
  String FEmail;
  final _controller =TextEditingController();
  String _enteredMessage = "";

  _sendMessage() async{
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    FirebaseFirestore.instance.collection('chat').add({
      'text':_enteredMessage ,
      'createdAt': Timestamp.now(),
      'username':userData['username'],
      'userId':user.uid,
      'email':user.email,
      'Receved_email':FEmail+user.email,
    });
    _controller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Send a messag....'),
            onChanged: (val){
              setState(() {
                _enteredMessage = val ;
              });
            },
          ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
              icon: Icon(Icons.send),
              onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
          ),
        ],
      ),
    );
  }
}
