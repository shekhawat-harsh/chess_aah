import 'package:chess_aah/home_page.dart';
import 'package:chess_aah/spectate.dart';
import 'package:flutter/material.dart';

class CreateGame extends StatelessWidget {
  const CreateGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            height: 50,
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Colors.blue,
                    ))
              ],
            )));
  }
}
