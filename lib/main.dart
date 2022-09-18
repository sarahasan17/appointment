import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:appointment/screen1/firstscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(splashscreen());
  WidgetsFlutterBinding.ensureInitialized();
}

class splashscreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
          splash: Container(
            child: Image.asset("images/My project.png"),
          ),
          backgroundColor: Color(0xFF3D5DB6),
          duration: 2000,
          splashTransition: SplashTransition.fadeTransition,
          splashIconSize: 150,
          pageTransitionType: PageTransitionType.leftToRight,
          nextScreen: firstscreen()),
    );
  }
}
