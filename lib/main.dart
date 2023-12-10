import 'package:camera/camera.dart';
import 'package:chess_aah/screens/create_game.dart';
import 'package:chess_aah/screens/home_page.dart';
import 'package:chess_aah/screens/landing_page.dart';
import 'package:chess_aah/screens/spectate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String? email;
String? password;
late List<CameraDescription> cameras;
late HomePage screenHome;
late SpectatePage screenSpectate;
late CreateGame screenCreateGame;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  cameras = await availableCameras();
  await Firebase.initializeApp();
  runApp(ProviderScope(
    child: MaterialApp(
      home: LandingPage(),
      theme: ThemeData.dark(useMaterial3: true),
    ),
  ));
}
