import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';

class reports extends StatefulWidget {
  const reports({Key? key}) : super(key: key);

  @override
  State<reports> createState() => _reportsState();
}

class _reportsState extends State<reports> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[300],
          title: Center(
            child: Text(
              "Daily reminder",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: light, borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}
