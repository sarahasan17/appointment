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

class firstscreen extends StatefulWidget {
  @override
  State<firstscreen> createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: blue,
          title: Center(
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
                children: [
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
              SizedBox(height: 20.0),
              Row(
                children: [
                  buttons1(
                    text1: "Scan",
                    text2: "Prescription",
                  ),
                  buttons1(
                    text1: "View",
                    text2: "Prescription",
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const view_prescription()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  buttons1(
                    text1: "Appointment",
                    text2: "Reminder",
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Buildwidget()),
                      );
                    },
                  ),
                  buttons1(
                    text1: "View",
                    text2: "Medicine",
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => view_medicine()),
                      );
                    },
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                "Get best deals!",
                style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: "Pacifico",
                    fontWeight: FontWeight.w500,
                    color: blue),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  buttons1(
                    text1: "View best",
                    text2: "Medicine",
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const view_best_medicine()),
                      );
                    },
                  ),
                  buttons2(
                    text1: "Reports",
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const reports()),
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
