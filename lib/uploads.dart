import 'dart:ui' as ui;
//import 'dart:html';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';
import 'package:path/path.dart';

class uploads extends StatefulWidget {
  const uploads({Key? key}) : super(key: key);

  @override
  State<uploads> createState() => _uploadsState();
}

class _uploadsState extends State<uploads> {
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
          child: ListView(
            children: [Text('UPLOADS:')],
          ),
        ),
      ),
    );
  }
}
