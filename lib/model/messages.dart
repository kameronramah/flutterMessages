import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  late String from;
  late String to;
  late String content;
  late DateTime date;

  Message.empty() {
    from = "";
    to = "";
    content = "";
    date = DateTime.now();
  }

  Message(DocumentSnapshot snapshot) {
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    from = map["FROM"];
    to = map["TO"];
    content = map["CONTENT"];
    date = DateTime.now();
  }
}
