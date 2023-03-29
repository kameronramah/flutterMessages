import 'package:flutter/material.dart';
import 'package:m2tldigitalcampus/controller/firebase_manager.dart';
import 'package:m2tldigitalcampus/controller/globale.dart';
import 'package:m2tldigitalcampus/model/utilisateur.dart';

class ListFavoris extends StatefulWidget {
  const ListFavoris({Key? key}) : super(key: key);

  @override
  State<ListFavoris> createState() => _ListFavorisState();
}

class _ListFavorisState extends State<ListFavoris> {

  //

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: myUser.favoris.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context,index){
          FirebaseManager().getUser(myUser.favoris[index]).then((value){
            Utilisateur otherUser = value;
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(otherUser.avatar??defaultImage)
                )
              ),
            );
          });



        }
    );
  }
}
