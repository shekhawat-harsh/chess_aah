import 'package:chess_aah/provider.dart';
import 'package:chess_aah/widgits/past_match_card.dart';
import 'package:chess_aah/widgits/win_percentage_widgit.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(screenWidthProvider.notifier).state =
        MediaQuery.of(context).size.width;
    var dataBaseSnapshot = FirebaseDatabase.instance;
    var width = MediaQuery.of(context).size.width;
    final email = ref.read(emailProvider);
    var userNameSnapshot = FirebaseDatabase.instance
        .ref("usernames")
        .child(email.replaceAll(".", "^").replaceAll("@", "%"));
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          notchMargin: 20,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  color: Colors.blue,
                  icon: Icon(Icons.home_filled)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_arrow,
                  )),
              IconButton(onPressed: () {}, icon: Icon(Icons.add))
            ],
          )),
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
          children: [
            SizedBox(
              width: width,
              height: 150,
              child: FirebaseAnimatedList(
                  query: userNameSnapshot,
                  itemBuilder: (ctx, snapShot, animation, index) {
                    return Card(
                      child: Column(
                        children: [
                          Text(
                            "Hello!",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            snapShot.value.toString(),
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            StreamBuilder(
                stream: dataBaseSnapshot
                    .ref("win_percent")
                    .child(email.replaceAll(".", "^").replaceAll("@", "%"))
                    .onValue,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    double ovrWin = double.parse(snapshot.data!.snapshot
                            .child("overall/win")
                            .value
                            .toString()) /
                        100;
                    final blackWin = double.parse(snapshot.data!.snapshot
                            .child("black/win")
                            .value
                            .toString()) /
                        100;
                    final whiteWin = double.parse(snapshot.data!.snapshot
                            .child("white/win")
                            .value
                            .toString()) /
                        100;
                    return WinPercentage(
                        blackWin: blackWin,
                        overallWin: ovrWin,
                        whiteWin: whiteWin);
                  } else {
                    return CircularProgressIndicator();
                  }
                })),
            SizedBox(
              height: 10,
            ),
            Text(
              "Past Matches",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: width,
              height: 350,
              child: FirebaseAnimatedList(
                  defaultChild: CircularProgressIndicator(),
                  scrollDirection: Axis.vertical,
                  query: dataBaseSnapshot
                      .ref("recent_matches")
                      .child(email.replaceAll(".", "^").replaceAll("@", "%")),
                  itemBuilder: (ctx, dataSnapshot, animation, index) {
                    var opponent = dataSnapshot.key
                        .toString()
                        .replaceAll("%", "@")
                        .replaceAll("^", ".");
                    var result = dataSnapshot.child("result").value.toString();
                    var moves = dataSnapshot.child("moves").value.toString();
                    var historySnapshot = dataBaseSnapshot
                        .ref("past_matches")
                        .child(email.replaceAll(".", "^").replaceAll("@", "%"))
                        .child(dataSnapshot.key!)
                        .once();

                    return FutureBuilder(
                        future: historySnapshot,
                        builder: (ctx, snapShot) {
                          String? tWon;
                          String? tLost;
                          String? tDraw;

                          if (snapShot.data != null) {
                            tWon = snapShot.data!.snapshot
                                .child("won")
                                .value
                                .toString();

                            tLost = snapShot.data!.snapshot
                                .child("lost")
                                .value
                                .toString();
                            tDraw = snapShot.data!.snapshot
                                .child("won")
                                .value
                                .toString();
                          }
                          print(
                              "${snapShot.data!.snapshot.child("won").value} is data");
                          return PastMatchMatchCard(
                              opponent: opponent,
                              moves: moves,
                              result: result,
                              tdraw: tDraw!,
                              tlsot: tLost!,
                              twon: tWon!);
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
