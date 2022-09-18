import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
