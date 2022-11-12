import 'dart:js_util';

import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:intl/intl.dart';

class PertamaPage extends StatefulWidget {
  const PertamaPage({super.key});

  @override
  State<PertamaPage> createState() => _PertamaPageState();
}

class _PertamaPageState extends State<PertamaPage> {
  DateTime? dateTimenow = DateTime.now(), dateTimeTommorow, picked_date;
  var year, month, day;
  TimeOfDay? picked_time, selected_time = TimeOfDay.now();

  Future<Null> getDate(BuildContext context) async {
    picked_date = await showDatePicker(
        context: context,
        initialDate: dateTimenow!,
        firstDate: DateTime(dateTimenow!.year - 1),
        lastDate: DateTime(dateTimenow!.year + 1));

    if (picked_date != null && picked_date != dateTimenow!) {
      setState(() {
        dateTimenow = picked_date;
      });
    }
  }

  Future<Null> getTime(BuildContext context) async {
    picked_time =
        await showTimePicker(context: context, initialTime: selected_time!);

    if (picked_time != null && picked_time != dateTimenow!) {
      setState(() {
        selected_time = picked_time;
      });
    }
  }

  void dateTime_method() {
    dateTimenow = new DateTime.now();
    dateTimeTommorow = dateTimenow!.add(const Duration(days: 1));
    year = dateTimeTommorow!.year;
    month = dateTimeTommorow!.month;
    day = dateTimeTommorow!.day;

    var data = DateFormat('HH:mm:ss').format(dateTimenow!);
    var data1 = DateFormat('dd MMMM yy').format(dateTimenow!);
    var data2 = DateFormat('HH:mm').format(dateTimenow!);
    var data3 = DateFormat('HH:mm:ss').format(dateTimenow!);
    var data4 = DateFormat('yyyy-MM-dd').format(dateTimenow!);
    var data5 = DateTime.now().add(Duration(days: -1));

    log("data 1" + data1.toString());
    log("data2" + data2.toString());
    log("data3" + data3.toString());
    log("data4" + data4.toString());
    log("data5" + data5.toString());
    log("year" + year.toString());
    log("month" + month.toString());
    log("day" + day.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          MaterialButton(
            onPressed: () {
              getDate(context);
            },
            child: Text("Test Tanggal"),
          ),
          MaterialButton(
            onPressed: () {
              getTime(context);
            },
            child: Text("Test Waktu"),
          ),
          Text("${dateTimenow.toString().substring(0, 10)}"),
          Text("${selected_time.toString().substring(10, 15)}"),
        ],
      ),
    );
  }
}
