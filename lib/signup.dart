import 'dart:convert';
import 'package:appointment/firstscreen2.dart';
import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: blue,
          title: Center(
            child: Text(
              "Daily reminder",
              style: TextStyle(
                  fontSize: 25.0, fontWeight: FontWeight.w600, color: white),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                      color: blue, fontSize: 50.0, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.left,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
                decoration:
                    kinputdecoration.copyWith(hintText: 'Enter your name'),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                textAlign: TextAlign.left,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
                decoration:
                    kinputdecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                textAlign: TextAlign.left,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
                decoration:
                    kinputdecoration.copyWith(hintText: 'Enter your age'),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                textAlign: TextAlign.left,
                obscureText: true,
                onChanged: (value) {},
                decoration:
                    kinputdecoration.copyWith(hintText: 'Enter your password.'),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                textAlign: TextAlign.left,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
                decoration: kinputdecoration.copyWith(
                    hintText: 'Confirm your password'),
              ),
              SizedBox(
                height: 10.0,
              ),
              text_app(
                text: 'SIGN UP',
                colors: blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class text_app extends StatelessWidget {
  final Color? colors;
  final VoidCallback? onPress;
  final String text;
  text_app({this.colors, this.onPress, this.text = ''});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colors,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
