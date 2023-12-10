import 'package:chess_aah/home_page.dart';
import 'package:chess_aah/spectate.dart';
import 'package:chess_aah/widgits/gameForm.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CreateGame extends StatelessWidget {
  const CreateGame({super.key});

  @override
  Widget build(BuildContext context) {
    var dataBaseRef = FirebaseDatabase.instance.ref("matches");
    return Scaffold(
        body: Center(
          child: GameForm(),
        ),
        appBar: AppBar(
          title: Text("Create Game"),
          actions: [
            CircleAvatar(
              backgroundColor: Colors.amber,
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            notchMargin: 20,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (ctx) => HomePage()));
                    },
                    icon: Icon(Icons.home_filled)),
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (ctx) => SpectatePage()));
                    },
                    icon: Icon(
                      Icons.play_arrow,
                    )),
                IconButton(
                    onPressed: () async {},
                    icon: Icon(
                      Icons.add,
                      color: Colors.blue,
                    ))
              ],
            )));
  }
}
