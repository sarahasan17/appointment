import 'package:appointment/appointment_reminder.dart';
import 'package:appointment/reports.dart';
import 'package:appointment/constants.dart';
import 'package:flutter/material.dart';
import 'package:appointment/screen1/buttons.dart';
import 'package:appointment/view_prescription.dart';
import 'package:appointment/view_medicine.dart';
import 'package:appointment/view_best_medicine.dart';
import 'package:unicons/unicons.dart';
import 'package:appointment/details.dart';
import 'package:appointment/scan_prescription.dart';
import 'package:camera/camera.dart';
import 'package:appointment/main.dart';
import 'dart:ffi';

class firstscreen2 extends StatelessWidget {
  final CameraDescription camera;
  firstscreen2({required this.camera});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: white,
            title: Center(
              child: Text(
                "Daily reminder",
                style: TextStyle(
                    fontSize: 25.0, fontWeight: FontWeight.w600, color: blue),
              ),
            ),
          ),
          body: ListView(children: [
            Container(
              padding: EdgeInsets.all(15.0),
              color: blue,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textpart(text: 'Hello Users!'),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => details()),
                            );
                          },
                          child: Icon(
                            UniconsLine.apps,
                            size: 50.0,
                            color: white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    buttons3(
                      text1: 'Scan Prescription',
                      icon: Icons.document_scanner_outlined,
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  scan_prescription(camera: camera)),
                        );
                      },
                    ),
                    SizedBox(height: 10.0),
                    buttons3(
                      text1: 'View Prescription',
                      icon: Icons.view_carousel_rounded,
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const view_prescription()),
                        );
                      },
                    ),
                    SizedBox(height: 10.0),
                    buttons3(
                      text1: 'Appointment Reminder',
                      icon: Icons.lock_clock,
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Buildwidget()),
                        );
                      },
                    ),
                    SizedBox(height: 10.0),
                    buttons3(
                      text1: 'View Medicine',
                      icon: Icons.medical_information_rounded,
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => view_medicine()),
                        );
                      },
                    ),
                    SizedBox(height: 10.0),
                    textpart(text: 'Get Best Deals!'),
                    SizedBox(height: 10.0),
                    buttons3(
                      text1: 'View Best Medicine',
                      icon: Icons.add_to_photos_rounded,
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const view_best_medicine()),
                        );
                      },
                    ),
                    SizedBox(height: 10.0),
                    buttons3(
                      text1: 'Reports',
                      icon: Icons.file_copy_outlined,
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => reports()),
                        );
                      },
                    ),
                  ]),
            ),
          ])),
    );
  }
}

class textpart extends StatelessWidget {
  final String text;
  textpart({this.text: ""});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: white,
            fontSize: 45,
            fontWeight: FontWeight.w100,
            fontFamily: 'IBMPlexSansCondensed'));
  }
}
