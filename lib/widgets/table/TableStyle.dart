import 'package:finalchat2/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TableStyle extends StatelessWidget {
  TableStyle(this.email,this.username);
  final String email;
  final String username;
  String FEmail ;


  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: !isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 250,
          padding: EdgeInsets.symmetric(vertical: 15 ,horizontal: 0),
          margin: EdgeInsets.symmetric(vertical: 0 ,horizontal: 50),
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text(
                  username,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                  ),
                ),
                onPressed: () {
                  FEmail =email ;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatScreen(
                      FEmail
                    )),
                  );
                },
              ),
              Text(
                email,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
