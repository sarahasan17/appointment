import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

const IconData access_time_outlined =
    IconData(0xee2d, fontFamily: 'MaterialIcons');

class appointment_reminder extends StatelessWidget {
  @override
  final String date;
  final String fromtime;
  final String totime;
  final VoidCallback? onClicked;
  final VoidCallback? onClicked2;
  final VoidCallback? onClicked3;
  final VoidCallback? onClicked4;
  appointment_reminder(
      {this.date = 'Add date',
      this.fromtime = 'Add date',
      this.totime = 'Add date',
      this.onClicked,
      this.onClicked2,
      this.onClicked3,
      this.onClicked4});
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
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Doctor name',
                    style: TextStyle(
                        fontSize: 30.0,
                        color: blue,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'profession',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: blue,
                        fontWeight: FontWeight.w300),
                  ),
                  RatingBar.builder(
                    initialRating: 2.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
              Image.asset(
                "images/image.png",
                width: 130,
                height: 150,
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xFFF5FAFF),
            ),
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: blue,
                      size: 25.0,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      date,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                          color: blue,
                          fontFamily: 'SourceSansPro'),
                    ),
                    GestureDetector(
                      onTap: onClicked,
                      child: Icon(Icons.arrow_drop_down_sharp,
                          color: blue, size: 25),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Icon(
                      access_time_outlined,
                      color: blue,
                      size: 25.0,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      fromtime,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                          color: blue,
                          fontFamily: 'SourceSansPro'),
                    ),
                    GestureDetector(
                      onTap: onClicked2,
                      child: Icon(Icons.arrow_drop_down_sharp,
                          color: blue, size: 25),
                    ),
                    Text(
                      totime,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                          color: blue,
                          fontFamily: 'SourceSansPro'),
                    ),
                    GestureDetector(
                      onTap: onClicked3,
                      child: Icon(Icons.arrow_drop_down_sharp,
                          color: blue, size: 25),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: onClicked4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: blue,
              ),
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Reschedule',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SourceSansPro',
                    fontSize: 20.0),
              ),
            ),
          )
        ]),
      ),
    ));
  }
}

class Buildwidget extends StatefulWidget {
  const Buildwidget({Key? key}) : super(key: key);

  @override
  State<Buildwidget> createState() => _BuildwidgetState();
}

class _BuildwidgetState extends State<Buildwidget> {
  @override
  DateTime? date;
  TimeOfDay? time;
  TimeOfDay? time2;
  String getText() {
    if (date == null)
      return 'Select date';
    else {
      return DateFormat('dd/MM/yyyy').format(date!);
    }
  }

  String getText2() {
    if (time == null)
      return 'Add time';
    else {
      final hours = time?.hour.toString().padLeft(2, '0');
      final min = time?.minute.toString().padLeft(2, '0');
      return '${time?.hour}:${time?.minute}';
    }
  }

  String getText3() {
    if (time2 == null)
      return 'Add time';
    else {
      final hours = time2?.hour.toString().padLeft(2, '0');
      final min = time2?.minute.toString().padLeft(2, '0');
      return '${time2?.hour}:${time2?.minute}';
    }
  }

//'${date?.day}/${date?.month}/${date?.year}'//
  Widget build(BuildContext context) => appointment_reminder(
        date: getText(),
        fromtime: getText2(),
        totime: getText3(),
        onClicked: () => pickdate(context),
        onClicked2: () => picktime1(context),
        onClicked3: () => picktime2(context),
        onClicked4: () => clearDatetime(context),
      );

  Future pickdate(BuildContext context) async {
    final initialdate = DateTime.now();
    final showdate = await showDatePicker(
      context: context,
      initialDate: date ?? DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (showdate == null) return;
    setState(() => date = showdate);
  }

  Future picktime1(BuildContext context) async {
    final initialtime = TimeOfDay(hour: 9, minute: 0);
    final newtime = await showTimePicker(
        context: context, initialTime: time ?? initialtime);
    if (newtime == null) return;
    setState(() => time = newtime);
  }

  Future picktime2(BuildContext context) async {
    final initialtime = TimeOfDay(hour: 9, minute: 0);
    final newtime = await showTimePicker(
        context: context, initialTime: time2 ?? initialtime);
    if (newtime == null) return;
    setState(() => time2 = newtime);
  }

  Future clearDatetime(BuildContext context) async {
    setState(
      () => date = null,
    );
    setState(
      () => time = null,
    );
    setState(
      () => time2 = null,
    );
  }
}
