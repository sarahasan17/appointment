import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';

class view_best_medicine extends StatefulWidget {
  const view_best_medicine({Key? key}) : super(key: key);

  @override
  State<view_best_medicine> createState() => _view_best_medicineState();
}

class _view_best_medicineState extends State<view_best_medicine> {
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
        body: Container(),
      ),
    );
  }
}
