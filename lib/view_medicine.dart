import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';
import 'package:appointment/dosage.dart';

class view_medicine extends StatefulWidget {
  @override
  State<view_medicine> createState() => _view_medicineState();
}

class _view_medicineState extends State<view_medicine> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Text(
          "Daily reminder",
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(padding: EdgeInsets.all(10.0)),
            Text(
              'Your Medication',
              style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w600,
                  color: blue),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: light,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text_med(text: "Name"),
                      text_med(text: "Dosage"),
                    ],
                  ),
                  SizedBox(
                    width: 200.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => dosage()));
                    },
                    child: Container(
                      color: blue,
                      child: Icon(
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
      style: TextStyle(
        fontSize: 25.0,
        fontFamily: 'SourceSansPro',
        fontWeight: FontWeight.w700,
        color: blue,
      ),
    );
  }
}
