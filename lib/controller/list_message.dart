import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:m2tldigitalcampus/model/utilisateur.dart';
import 'package:m2tldigitalcampus/controller/globale.dart';
import 'package:m2tldigitalcampus/controller/firebase_manager.dart';
import 'package:m2tldigitalcampus/view/conversation.dart';

class ListMessage extends StatefulWidget {
  const ListMessage({super.key});

  @override
  State<ListMessage> createState() => _ListMessageState();
}

class _ListMessageState extends State<ListMessage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseManager().cloudUsers.snapshots(),
        builder: (context, snap) {
          List documents = snap.data?.docs ?? [];
          if (documents.isEmpty) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            return ListView.builder(
                reverse: true,
                itemCount: documents.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  Utilisateur otherUser = Utilisateur(documents[index]);
                  if (otherUser.uid == myUser.uid) {
                    return Container();
                  } else {
                    return Column(
                        crossAxisAlignment: otherUser.email == 'tata@tata.fr'
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.end,
                        children: [
                          FractionallySizedBox(
                              widthFactor: 0.4,
                              child: Card(
                                  color: otherUser.email == 'tata@tata.fr'
                                      ? Colors.grey
                                      : Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Text(
                                        "Bonjour je m'appelle Kameron et je suis en M2TL, je fais acutellement un projet Flutter d'envoi de messages. Bonjour je m'appelle Kameron et je suis en M2TL, je fais acutellement un projet Flutter d'envoi de messages. Bonjour je m'appelle Kameron et je suis en M2TL, je fais acutellement un projet Flutter d'envoi de messages. Bonjour je m'appelle Kameron et je suis en M2TL, je fais acutellement un projet Flutter d'envoi de messages. Bonjour je m'appelle Kameron et je suis en M2TL, je fais acutellement un projet Flutter d'envoi de messages. Bonjour je m'appelle Kameron et je suis en M2TL, je fais acutellement un projet Flutter d'envoi de messages. Bonjour je m'appelle Kameron et je suis en M2TL, je fais acutellement un projet Flutter d'envoi de messages. Bonjour je m'appelle Kameron et je suis en M2TL, je fais acutellement un projet Flutter d'envoi de messages.",
                                      ))))
                        ]);
                  }
                });
          }
        });
  }
}
