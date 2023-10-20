import 'package:flutter/material.dart';

class SpectatePage extends StatelessWidget {
  const SpectatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            CircleAvatar(
              backgroundColor: Colors.amber,
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [Text("data")],
        )));
  }
}
