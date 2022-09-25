import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:appointment/screen1/firstscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:appointment/firstscreen2.dart';
import 'dart:async';
import 'dart:io';
import 'dart:async';
import 'package:camera/camera.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(splashscreen(camera: firstCamera));
}

class splashscreen extends StatelessWidget {
  final CameraDescription camera;
  splashscreen({required this.camera});

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
          nextScreen: firstscreen2(camera: camera)),
    );
  }
}
