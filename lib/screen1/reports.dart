import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
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
            padding: const EdgeInsets.all(20.0),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'HOSPITAL NAME',
                    style: TextStyle(
                      color: blue,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'IBMPlexSansCondensed',
                    ),
                  ),
                  SizedBox(height: 20.0),
                  NewWidget(text: "Doctor's name:"),
                  SizedBox(height: 10.0),
                  NewWidget(text: "Diagnosis:"),
                  SizedBox(height: 10.0),
                  NewWidget(text: "Blood Pressure:"),
                  SizedBox(height: 10.0),
                  NewWidget(text: "Pulse Rate:"),
                  SizedBox(height: 10.0),
                  NewWidget(text: "Weight:"),
                  SizedBox(height: 10.0),
                  NewWidget(text: "Diet:"),
                  SizedBox(height: 10.0),
                  NewWidget(text: "Next Visit:"),
                  SizedBox(height: 10.0),
                  NewWidget(text: "Follow up Phy:"),
                  SizedBox(height: 10.0),
                  NewWidget(text: "Medicines:"),
                  SizedBox(height: 10.0),
                ])),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  final String text;
  const NewWidget({this.text = ""});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 25,
        color: blue,
        fontWeight: FontWeight.w400,
        fontFamily: 'IBMPlexSansCondensed_italic',
      ),
    );
  }
}
