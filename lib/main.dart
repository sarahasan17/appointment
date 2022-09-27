import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:appointment/screen1/firstscreen2.dart';
import 'dart:async';
import 'package:camera/camera.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(Splashscreen(camera: firstCamera));
}

class Splashscreen extends StatelessWidget {
  final CameraDescription camera;
  const Splashscreen({required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
          splash: Image.asset("images/My project.png"),
          backgroundColor: const Color(0xFF3D5DB6),
          duration: 2000,
          splashTransition: SplashTransition.fadeTransition,
          splashIconSize: 150,
          pageTransitionType: PageTransitionType.leftToRight,
          nextScreen: Firstscreen2(camera: camera)),
    );
  }
}
