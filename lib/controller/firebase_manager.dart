import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:m2tldigitalcampus/model/utilisateur.dart';
import 'package:m2tldigitalcampus/model/messages.dart';

class FirebaseManager {
  //attributs
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  final cloudMessages = FirebaseFirestore.instance.collection("MESSAGES");
  final cloudUsers = FirebaseFirestore.instance.collection("UTILISATEURS");

  //creer un utilisateur
  Future<Utilisateur> Inscription(String email, String password) async {
    UserCredential authResult = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    String? uid = authResult.user?.uid;
    if (uid == null) {
      return Future.error(("error"));
    } else {
      Map<String, dynamic> map = {"EMAIL": email, "FAVORIS": []};
      addUser(uid!, map);
      return getUser(uid!);
    }
  }

  //ajoouter un utlisateur
  addUser(String uid, Map<String, dynamic> map) {
    cloudUsers.doc(uid).set(map);
  }

  //récuperer un utilisateur
  Future<Utilisateur> getUser(String uid) async {
    DocumentSnapshot snapshot = await cloudUsers.doc(uid).get();
    return Utilisateur(snapshot);
  }

  //connecter avec un utilisateur
  Future<Utilisateur> connect(String email, String password) async {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    String? uid = userCredential.user?.uid;
    if (uid == null) {
      return Future.error(("problème de connexion"));
    } else {
      return getUser(uid!);
    }
  }

// mise à jour d'un utlisateur
  updateUser(String uid, Map<String, dynamic> map) {
    cloudUsers.doc(uid).update(map);

  }



//suppression d'un utlisateur

// Uploadd de l'image
  Future<String> Upload(
      String destination, String nameImage, Uint8List bytes) async {
    String url = "";
    TaskSnapshot snapshot =
        await storage.ref("$destination/$nameImage").putData(bytes);
    url = await snapshot.ref.getDownloadURL();
    return url;
  }


  // envoyer une message

  Future<void> sendMessage(String from, String to, String content) async {
  
    Map<String, dynamic> map = {
      "FROM": from,
      "TO": to,
      "CONTENT": content,
      "CONVERSATIONID": from + to,
      "DATE": DateTime.now()
    };
    cloudMessages.add(map);
  }
}
