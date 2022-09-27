import 'package:flutter/material.dart';
import 'package:appointment/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class Appointment_reminder extends StatelessWidget {
  @override
  final String date;
  final String fromtime;
  final String totime;
  final VoidCallback? onClicked;
  final VoidCallback? onClicked2;
  final VoidCallback? onClicked3;
  final VoidCallback? onClicked4;
  Appointment_reminder(
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
        title: const Center(
          child: Text(
            "Daily reminder",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Doctor name',
                    style: TextStyle(
                        fontSize: 30.0,
                        color: blue,
                        fontWeight: FontWeight.w600),
                  ),
                  const Text(
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
                    itemBuilder: (context, _) => const Icon(
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
              color: light,
            ),
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: blue,
                      size: 25.0,
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                          color: blue,
                          fontFamily: 'SourceSansPro'),
                    ),
                    GestureDetector(
                      onTap: onClicked,
                      child: const Icon(Icons.arrow_drop_down_sharp,
                          color: blue, size: 25),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    const Icon(
                      Access_time_outlined,
                      color: blue,
                      size: 25.0,
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      fromtime,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                          color: blue,
                          fontFamily: 'SourceSansPro'),
                    ),
                    GestureDetector(
                      onTap: onClicked2,
                      child: const Icon(Icons.arrow_drop_down_sharp,
                          color: blue, size: 25),
                    ),
                    Text(
                      totime,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                          color: blue,
                          fontFamily: 'SourceSansPro'),
                    ),
                    GestureDetector(
                      onTap: onClicked3,
                      child: const Icon(Icons.arrow_drop_down_sharp,
                          color: blue, size: 25),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: blue,
                ),
                padding: const EdgeInsets.all(13.0),
                child: const Text(
                  'Set Alarm',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SourceSansPro',
                      fontSize: 20.0),
                ),
              ),
              const SizedBox(
                width: 25.0,
              ),
              GestureDetector(
                onTap: onClicked4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: blue,
                  ),
                  padding: const EdgeInsets.all(13.0),
                  child: const Text(
                    'Reschedule',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SourceSansPro',
                        fontSize: 20.0),
                  ),
                ),
              )
            ],
          ),
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
  DateTime? date;
  TimeOfDay? time;
  TimeOfDay? time2;
  String getText() {
    if (date == null) {
      return 'Select date';
    } else {
      return DateFormat('dd/MM/yyyy').format(date!);
    }
  }

  String getText2() {
    if (time == null) {
      return 'Add time';
    } else {
      final hours = time?.hour.toString().padLeft(2, '0');
      final min = time?.minute.toString().padLeft(2, '0');
      return '${hours}:${min}';
    }
  }

  String getText3() {
    if (time2 == null) {
      return 'Add time';
    } else {
      final hours = time2?.hour.toString().padLeft(2, '0');
      final min = time2?.minute.toString().padLeft(2, '0');
      return '$hours:$min';
    }
  }

//'${date?.day}/${date?.month}/${date?.year}'//
  @override
  Widget build(BuildContext context) => Appointment_reminder(
        date: getText(),
        fromtime: getText2(),
        totime: getText3(),
        onClicked: () => Pickdate(context),
        onClicked2: () => Picktime1(context),
        onClicked3: () => Picktime2(context),
        onClicked4: () => clearDatetime(context),
      );

  Future Pickdate(BuildContext context) async {
    final showdate = await showDatePicker(
      context: context,
      initialDate: date ?? DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (showdate == null) return;
    setState(() => date = showdate);
  }

  Future Picktime1(BuildContext context) async {
    final initialtime =
        TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
    final newtime = await showTimePicker(
        context: context, initialTime: time ?? initialtime);
    if (newtime == null) return;
    setState(() => time = newtime);
  }

  Future Picktime2(BuildContext context) async {
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
    Future setAlarm(BuildContext context) async {
      if (time == DateTime.now()) {
        setState(() => print("Alarm"));
      }
    }
  }
}
