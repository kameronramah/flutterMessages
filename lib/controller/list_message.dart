import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:m2tldigitalcampus/model/messages.dart';
import 'package:m2tldigitalcampus/model/utilisateur.dart';
import 'package:m2tldigitalcampus/controller/globale.dart';
import 'package:m2tldigitalcampus/controller/firebase_manager.dart';
import 'package:m2tldigitalcampus/view/conversation.dart';
import 'package:translator/translator.dart';

class ListMessage extends StatefulWidget {
  Utilisateur user;
  ListMessage({required this.user, super.key});

  @override
  State<ListMessage> createState() => _ListMessageState();
}

class _ListMessageState extends State<ListMessage> {
  final translator = GoogleTranslator();
  List<Message> _translatedMessages = [];

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
          if (documents.isEmpty) {
            return Container();
          } else {
            return ListView.builder(
                reverse: true,
                itemCount: documents.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  Message message = Message(documents[index]);
                  if (index >= _translatedMessages.length) {
                    // Si le message n'a pas encore été traduit, on le traduit
                    translator
                        .translate(message.content, to: window.locale.languageCode)
                        .then((value) => {
                              setState(() {
                                message.content = value.toString();
                                _translatedMessages.add(message);
                              })
                            });
                    // On retourne le message non traduit pour l'instant
                    return Container();
                  }
                  else {
                    // Si le message a déjà été traduit, on retourne le message traduit
                    Message translatedMessage = _translatedMessages[index];
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
                                      child: Text(translatedMessage.content))))
                        ]);
                  }
                });
          }
          ;
        });
  }
}
