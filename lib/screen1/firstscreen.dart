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

class Firstscreen extends StatefulWidget {
  const Firstscreen({Key? key}) : super(key: key);

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: blue,
          title: const Center(
            child: Text(
              "Daily reminder",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Hello users!",
                    style: TextStyle(
                        fontSize: 40.0,
                        fontFamily: "Pacifico",
                        fontWeight: FontWeight.w500,
                        color: blue),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  const Buttons1(
                    text1: "Scan",
                    text2: "Prescription",
                  ),
                  Buttons1(
                    text1: "View",
                    text2: "Prescription",
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const View_prescription()),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Buttons1(
                    text1: "Appointment",
                    text2: "Reminder",
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Buildwidget()),
                      );
                    },
                  ),
                  Buttons1(
                    text1: "View",
                    text2: "Medicine",
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => View_medicine()),
                      );
                    },
                  )
                ],
              ),
              SizedBox(height: 20.0),
              const Text(
                "Get best deals!",
                style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: "Pacifico",
                    fontWeight: FontWeight.w500,
                    color: blue),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Buttons1(
                    text1: "View best",
                    text2: "Medicine",
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const View_best_medicine()),
                      );
                    },
                  ),
                  Buttons2(
                    text1: "Reports",
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Reports()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
