import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:m2tldigitalcampus/model/messages.dart';
import 'package:m2tldigitalcampus/model/utilisateur.dart';
import 'package:m2tldigitalcampus/controller/globale.dart';
import 'package:m2tldigitalcampus/controller/firebase_manager.dart';
import 'package:m2tldigitalcampus/view/conversation.dart';

class ListMessage extends StatefulWidget {
  Utilisateur user;
  ListMessage({required this.user, super.key});

  @override
  State<ListMessage> createState() => _ListMessageState();
}

class _ListMessageState extends State<ListMessage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseManager()
            .cloudMessages
            .where(
                "(FROM == ${widget.user.uid} && TO == ${myUser.uid}) || (FROM == ${myUser.uid} && TO == ${widget.user.uid})")
            .orderBy("DATE", descending: true)
            .snapshots(),
        builder: (context, snap) {
          List documents = snap.data?.docs ?? [];
          debugPrint(documents.toString());
          if (documents.isEmpty) {
            return Container();
          } else {
            return ListView.builder(
                reverse: true,
                itemCount: documents.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  Message message = Message(documents[index]);
                  return Column(
                      crossAxisAlignment: message.from == myUser.uid
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        FractionallySizedBox(
                            widthFactor: 0.4,
                            child: Card(
                                color: message.from == myUser.uid
                                    ? Colors.green
                                    : Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(message.content))))
                      ]);
                });
          }
          ;
        });
  }
}
