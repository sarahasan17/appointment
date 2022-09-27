import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';

class Buttons1 extends StatelessWidget {
  @override
  final String text1;
  final String text2;
  final VoidCallback? onpressed;
  const Buttons1({this.text1 = '', this.text2 = '', this.onpressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
          ),
          color: blue,
        ),
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(5.0),
        height: 130,
        width: 170,
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Textinbutton(
                text: text1,
              ),
            ),
            Expanded(
              child: Textinbutton(text: text2),
            ),
            const SizedBox(
              height: 15.0,
            ),
          ],
        )),
      ),
    );
  }
}

class Buttons3 extends StatelessWidget {
  @override
  final String text1;
  final IconData? icon;
  final VoidCallback? onpressed;
  const Buttons3({this.text1 = '', this.icon, this.onpressed});
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onpressed,
        child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
              color: white,
            ),
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(5.0),
            height: 100,
            width: 350,
            child: Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(
                  icon,
                  size: 32.0,
                  color: blue,
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Textinbutton(text: text1),
              ]),
            )));
  }
}

class Buttons2 extends StatelessWidget {
  @override
  final String text1;
  final IconData? icon;
  final VoidCallback? onpressed;
  Buttons2({this.text1 = '', this.icon, this.onpressed});
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
          ),
          color: blue,
        ),
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(5.0),
        height: 120,
        width: 150,
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 40.0,
            ),
            Expanded(
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 30.0,
                    color: blue,
                  ),
                  Textinbutton(
                    text: text1,
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class Textinbutton extends StatelessWidget {
  final String text;
  const Textinbutton({this.text = ''});
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontFamily: "SourceSansPro",
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: blue),
    );
  }
}
