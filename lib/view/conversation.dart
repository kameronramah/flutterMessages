import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:m2tldigitalcampus/controller/globale.dart';
import 'package:m2tldigitalcampus/controller/list_message.dart';
import 'package:m2tldigitalcampus/model/utilisateur.dart';
import 'package:m2tldigitalcampus/controller/firebase_manager.dart';

class Conversation extends StatefulWidget {
  Utilisateur user;
  Conversation({required this.user, super.key});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  //variable
  TextEditingController newMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.user.email)),
      body: bodyPage(),
    );
  }

  Widget bodyPage() {
    return Column(
      children: [
        Flexible(child: ListMessage(user: widget.user)),
        TextField(
          controller: newMessage,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    FirebaseManager().sendMessage(
                        myUser.uid, widget.user.uid, newMessage.text);
                    newMessage.text = "";
                  },
                  icon: const Icon(Icons.send)),
              hintText: "Entrez votre message",
              contentPadding: const EdgeInsets.all(10),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent))),
        )
      ],
    );
  }
}
