import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalchat2/widgets/chat/message_bubble.dart';
import 'package:finalchat2/widgets/table/TableStyle.dart';
import 'package:firebase_auth/firebase_auth.dart';

class darttable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
      //isEqualTo: "user2@gmail.com"      .orderBy("createdAt",descending: true)

      stream: FirebaseFirestore.instance
          .collection('chat').where('recev',whereIn: [user.email]).snapshots(),
      builder: (ctx , snapShot){
        if(snapShot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
        }
        final docs = snapShot.data.docs ;
        final user = FirebaseAuth.instance.currentUser;
        return ListView.builder(
          reverse: false,
          itemCount: docs.length,
          itemBuilder: (ctx, index) => TableStyle(
            /*
            docs[index]['text'],
            "hat",
            true,
            key: ValueKey('dghhk'),

             */

            docs[index]['email'],
            docs[index]['username'],
          ), //Container
        );
      },
    );
  }
}
