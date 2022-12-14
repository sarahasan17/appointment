import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';

class Dosage_medicine extends StatelessWidget {
  final String name;
  final String unit;
  final String Dosage;

  const Dosage_medicine(
      {this.name = "Add name",
      this.unit = "Add unit",
      this.Dosage = "Add Dosage"});
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
          decoration: const BoxDecoration(),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name:   $name',
                style: const TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.w500,
                    fontSize: 30.0,
                    color: blue),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Unit:   $unit',
                style: const TextStyle(
                    fontFamily: 'SourceSansPro', fontSize: 30.0, color: blue),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Dosage:   $Dosage',
                style: const TextStyle(
                    fontFamily: 'SourceSansPro', fontSize: 30.0, color: blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
