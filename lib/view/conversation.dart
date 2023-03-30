import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:m2tldigitalcampus/controller/list_message.dart';

class Conversation extends StatefulWidget {
  String email;
  Conversation({required this.email, super.key});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  //variable
  TextEditingController newMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.email)),
      body: bodyPage(),
    );
  }

  Widget bodyPage() {
    return Column(
      children: [
        Flexible(child: ListMessage()),
        TextField(
          controller: newMessage,
          decoration: InputDecoration(
              suffixIcon:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
              hintText: "Entrez votre message",
              contentPadding: const EdgeInsets.all(10),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent))),
        )
      ],
    );
  }
}
