import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class FriendsWidgit extends StatelessWidget {
  FriendsWidgit({super.key});
  final firebaseDatabse = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: 300,
          child: FirebaseAnimatedList(
            query: firebaseDatabse.ref("friends"),
            itemBuilder: (context, snapshot, animation, index) {
              return Text("data");
            },
          ),
        ),
      ),
    );
  }
}
