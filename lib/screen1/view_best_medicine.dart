import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';

class View_best_medicine extends StatefulWidget {
  const View_best_medicine({Key? key}) : super(key: key);

  @override
  State<View_best_medicine> createState() => _View_best_medicineState();
}

class _View_best_medicineState extends State<View_best_medicine> {
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
        body: Container(),
      ),
    );
  }
}
