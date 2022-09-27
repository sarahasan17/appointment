import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';
import 'package:appointment/screen1/dosage.dart';

class View_medicine extends StatefulWidget {
  @override
  State<View_medicine> createState() => _View_medicineState();
}

class _View_medicineState extends State<View_medicine> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: const Text(
          "Daily reminder",
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(padding: EdgeInsets.all(10.0)),
            const Text(
              'Your Medication',
              style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w600,
                  color: blue),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: light,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text_med(text: "Name"),
                      text_med(text: "Dosage"),
                    ],
                  ),
                  const SizedBox(
                    width: 200.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Dosage_medicine()));
                    },
                    child: Container(
                      color: blue,
                      child: const Icon(
                        Icons.add,
                        color: light,
                        size: 35.0,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class text_med extends StatelessWidget {
  final String text;
  text_med({this.text = ""});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 25.0,
        fontFamily: 'SourceSansPro',
        fontWeight: FontWeight.w700,
        color: blue,
      ),
    );
  }
}
