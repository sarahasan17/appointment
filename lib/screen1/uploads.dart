import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';

class Uploads extends StatefulWidget {
  const Uploads({Key? key}) : super(key: key);

  @override
  State<Uploads> createState() => _UploadsState();
}

class _UploadsState extends State<Uploads> {
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
        body: ListView(
          children: [Text('UPLOADS:')],
        ),
      ),
    );
  }
}
