import 'package:appointment/screen1/appointment_reminder.dart';
import 'package:appointment/screen1/reports.dart';
import 'package:appointment/constants.dart';
import 'package:flutter/material.dart';
import 'package:appointment/screen1/buttons.dart';
import 'package:appointment/screen1/view_prescription.dart';
import 'package:appointment/screen1/view_medicine.dart';
import 'package:appointment/screen1/view_best_medicine.dart';
import 'package:unicons/unicons.dart';
import 'package:appointment/screen1/login_page.dart';
import 'package:appointment/screen1/scan_prescription.dart';
import 'package:camera/camera.dart';
import 'package:appointment/main.dart';
import 'dart:ffi';

class Firstscreen2 extends StatefulWidget {
  final CameraDescription camera;
  const Firstscreen2({Key? key, required this.camera}) : super(key: key);

  @override
  State<Firstscreen2> createState() => _Firstscreen2State();
}

class _Firstscreen2State extends State<Firstscreen2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: white,
            title: const Center(
              child: Text(
                "Daily reminder",
                style: TextStyle(
                    fontSize: 25.0, fontWeight: FontWeight.w600, color: blue),
              ),
            ),
          ),
          body: ListView(children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              color: blue,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textpart(text: ' Hello Users!'),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      details(camera: widget.camera)),
                            );
                          },
                          child: const Icon(
                            UniconsLine.apps,
                            size: 50.0,
                            color: white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Center(
                      child: Buttons3(
                        text1: 'Scan Prescription',
                        icon: Icons.document_scanner_outlined,
                        onpressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Scan_prescription(camera: widget.camera)),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Center(
                      child: Buttons3(
                        text1: 'View Prescription',
                        icon: Icons.view_carousel_rounded,
                        onpressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const View_prescription()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Center(
                      child: Buttons3(
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
                    ),
                    const SizedBox(height: 10.0),
                    Center(
                      child: Buttons3(
                        text1: 'View Medicine',
                        icon: Icons.medical_information_rounded,
                        onpressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => View_medicine()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    textpart(text: ' Get Best Deals!'),
                    const SizedBox(height: 10.0),
                    Center(
                      child: Buttons3(
                        text1: 'View Best Medicine',
                        icon: Icons.add_to_photos_rounded,
                        onpressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const View_best_medicine()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Center(
                      child: Buttons3(
                        text1: 'Reports',
                        icon: Icons.file_copy_outlined,
                        onpressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Reports()),
                          );
                        },
                      ),
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
