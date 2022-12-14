import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';
import 'package:appointment/screen1/uploads.dart';

class View_prescription extends StatefulWidget {
  const View_prescription({Key? key}) : super(key: key);

  @override
  State<View_prescription> createState() => _View_prescriptionState();
}

class _View_prescriptionState extends State<View_prescription> {
  @override
  //late File file;
  Widget build(BuildContext context) {
    //final filename = file != null ? basename(file!.path) : 'No File selected';
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
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '19-09-2022',
                style: TextStyle(
                    color: blue,
                    fontSize: 30.0,
                    fontFamily: 'IBMPlexSansCondensed',
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), color: light),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
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
                    const SizedBox(
                      width: 90.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Uploads()));
                      },
                      child: Container(
                        color: blue,
                        child: const Icon(
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
