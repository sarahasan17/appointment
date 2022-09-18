import 'dart:ffi';
import 'dart:ui' as ui;
//import 'dart:html';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';
import 'package:path/path.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              container_frontend(
                icon: Icons.attach_file,
                text: "Select File",
              ),
              SizedBox(
                height: 20.0,
              ),
              container_frontend(
                icon: Icons.cloud_download_outlined,
                text: "Upload File",
              ),
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
