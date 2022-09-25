import 'dart:ffi';
import 'dart:ui' as ui;
//import 'dart:html';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';
import 'package:path/path.dart';
import 'package:appointment/uploads.dart';

class view_prescription extends StatefulWidget {
  const view_prescription({Key? key}) : super(key: key);

  @override
  State<view_prescription> createState() => _view_prescriptionState();
}

class _view_prescriptionState extends State<view_prescription> {
  @override
  //late File file;
  Widget build(BuildContext context) {
    //final filename = file != null ? basename(file!.path) : 'No File selected';
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
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '19-09-2022',
                style: TextStyle(
                    color: blue,
                    fontSize: 30.0,
                    fontFamily: 'IBMPlexSansCondensed',
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), color: light),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('DOCTOR NAME',
                            style: TextStyle(
                                color: blue,
                                fontSize: 28.0,
                                fontFamily: 'SourceSansPro',
                                fontWeight: FontWeight.w600)),
                        Text('Hospital',
                            style: TextStyle(
                                color: blue,
                                fontSize: 23.0,
                                fontFamily: 'SourceSansPro',
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    SizedBox(
                      width: 90.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => uploads()));
                      },
                      child: Container(
                        color: blue,
                        child: Icon(
                          Icons.add,
                          color: light,
                          size: 40.0,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
/*
  Future selectfile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) {
      return;
    }
    final path = result.files.single.path!;
    setState(() => file = File(path));
  }

 */
}

class container_frontend extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final ui.VoidCallback? file;
  container_frontend({this.icon, this.text, this.file});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: file,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: blue,
          ),
          height: 80,
          width: 300,
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 32.0,
              ),
              SizedBox(width: 7),
              Text(
                text!,
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ],
          ))),
    );
  }
}
