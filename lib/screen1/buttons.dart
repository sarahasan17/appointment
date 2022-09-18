import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';

class buttons1 extends StatelessWidget {
  @override
  final String text1;
  final String text2;
  final VoidCallback? onpressed;
  buttons1({this.text1 = '', this.text2 = '', this.onpressed});
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onpressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            ),
            color: blue,
          ),
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(5.0),
          height: 130,
          width: 170,
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: textinbutton(
                  text: text1,
                ),
              ),
              Expanded(
                child: textinbutton(text: text2),
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class buttons2 extends StatelessWidget {
  @override
  final String text1;
  final VoidCallback? onpressed;
  buttons2({this.text1 = '', this.onpressed});
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onpressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            ),
            color: blue,
          ),
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(5.0),
          height: 130,
          width: 170,
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              Expanded(
                child: textinbutton(
                  text: text1,
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class textinbutton extends StatelessWidget {
  final String text;
  textinbutton({this.text = ''});
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: "SourceSansPro",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white),
    );
  }
}
