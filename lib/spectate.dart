import 'package:chess_aah/create_game.dart';
import 'package:chess_aah/home_page.dart';
import 'package:chess_aah/widgits/friends.dart';
import 'package:chess_aah/widgits/search.dart';
import 'package:flutter/material.dart';

class SpectatePage extends StatelessWidget {
  const SpectatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Spactate"),
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_arrow,
                      color: Colors.blue,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (ctx) => CreateGame()));
                    },
                    icon: Icon(Icons.add))
              ],
            )),
        body: SingleChildScrollView(
            child: Column(
          children: [SearchWidgit(), FriendsWidgit()],
        )));
  }
}
