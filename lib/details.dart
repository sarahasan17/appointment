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
import 'package:appointment/signup.dart';

class details extends StatefulWidget {
  const details({Key? key}) : super(key: key);

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
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
                  'LOGIN',
                  style: TextStyle(
                      color: blue, fontSize: 50.0, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
                decoration:
                    kinputdecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {},
                decoration:
                    kinputdecoration.copyWith(hintText: 'Enter your password.'),
              ),
              SizedBox(
                height: 10.0,
              ),
              text_app(
                text: 'LOGIN',
                colors: blue,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Don\'t have an account    ',
                    style: TextStyle(color: blue),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => signup()),
                      );
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: blue),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class detials extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _detialsState createState() => _detialsState();
}

class _detialsState extends State<detials> {
  String message = '';
  bool showstate = false;
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showstate,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                      color: blue, fontSize: 50.0, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kinputdecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration:
                    kinputdecoration.copyWith(hintText: 'Enter your password.'),
              ),
              SizedBox(
                height: 24.0,
              ),
              text_app(
                colors: blue,
                onPress: () async {
                  try {
                    setState(() {
                      showstate = true;
                    });
                    await Firebase.initializeApp();
                    final loginuser = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    /*if (loginuser != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => )));
                    }*/
                    setState(() {
                      showstate = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
                text: 'Log in',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
class details extends StatefulWidget {
  const details({Key? key}) : super(key: key);

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  TextEditingController _name = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _allergies = TextEditingController();
  TextEditingController _poc = TextEditingController();
  TextEditingController _bloodgroup = TextEditingController();
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    saveddata();
  }

  void saveddata() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsondata =
        jsonDecode(sharedPreferences.getString('userdata')!);
    User user = User.fromJson(jsondata);
    if (jsondata.isNotEmpty) {
      _name.value = TextEditingValue(text: user.name);
      _contact.value = TextEditingValue(text: user.contact);
      _address.value = TextEditingValue(text: user.address);
      _allergies.value = TextEditingValue(text: user.allergy);
      _poc.value = TextEditingValue(text: user.POC);
      _bloodgroup.value = TextEditingValue(text: user.bloodgroup);
    }
  }

  void storedata() {
    User user = User(_name.text, _contact.text, _address.text, _allergies.text,
        _poc.text, _bloodgroup.text);
    String userdata = jsonEncode(user);
    print(userdata);
    sharedPreferences.setString('userdata', userdata);
  }

  @override
  Widget build(BuildContext context) {
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
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Column(
                children: [
                  TextField(
                    controller: _name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your Name'),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    controller: _contact,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your contact number'),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    controller: _address,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your address'),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    controller: _allergies,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your allergies'),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    controller: _poc,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your POC'),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    controller: _bloodgroup,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your Blood Group'),
                  ),
                  SizedBox(height: 25.0),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: blue,
                        ),
                        height: 70,
                        width: 175,
                        child: ElevatedButton(
                          onPressed: storedata,
                          child: Center(
                            child: Text(
                              'Add',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontFamily: 'SourceSansPro'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: blue,
                        ),
                        height: 70,
                        width: 175,
                        child: ElevatedButton(
                          onPressed: () {
                            sharedPreferences.remove('userdata');
                            _name.value = TextEditingValue(text: '');
                            _contact.value = TextEditingValue(text: '');
                            _address.value = TextEditingValue(text: '');
                            _allergies.value = TextEditingValue(text: '');
                            _bloodgroup.value = TextEditingValue(text: '');
                            _poc.value = TextEditingValue(text: '');
                          },
                          child: Center(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontFamily: 'SourceSansPro'),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  String name, contact, address, allergy, POC, bloodgroup;
  User(this.name, this.contact, this.address, this.allergy, this.POC,
      this.bloodgroup);
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        contact = json['contact'],
        address = json['address'],
        allergy = json['allergy'],
        POC = json['POC'],
        bloodgroup = json['bloodgroup'];
  Map<String, dynamic> toJson() => {
        'name': name,
        'contact': contact,
        'address': address,
        'allergy': allergy,
        'POC': POC,
        'bloodgroup': bloodgroup,
      };
}
*/
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
