import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/constants.dart';

import '../services/remote_service.dart';

class BookSessionPage extends StatefulWidget {
  @override
  _BookSessionPageState createState() => _BookSessionPageState();
}

class _BookSessionPageState extends State<BookSessionPage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String duration = "30mins";
  List<dynamic>? doctors;

  Future GetDoctors() async {
    doctors = await ApiService.instance.get('doctor/doctorslist/');
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 0), () async {
      await GetDoctors();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book a session'),
        backgroundColor: Color(0xFFB2B9E2),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 8),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: doctors == null
                  ? []
                  : [
                      for (Map<String, dynamic> doctor in doctors!)
                        GestureDetector(
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Pick date and time"),
                              actions: [
                                TextButton(
                                    onPressed: () => _selectTime(context),
                                    child: Text('Choose time')),
                                TextButton(
                                    onPressed: () => _selectDate(context),
                                    child: Text('Choose date')),
                                DropdownButton<String>(
                                  value: duration,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.black),
                                  underline: Container(
                                    height: 2,
                                    color: mainAppColor,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      duration = newValue!;
                                    });
                                  },
                                  items: <String>['30mins', '60mins', '90mins']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                                TextButton(
                                  onPressed: () {
                                    var response = ApiService.instance
                                        .post('doctor/booksession/', {
                                      "doctor": doctor["id"],
                                      "guest": ApiService.instance.userID,
                                      "duration": duration,
                                      "date":
                                          "${selectedDate.toString().substring(0, 10)} ${selectedTime.hour}:${selectedTime.minute}:00.000",
                                    });
                                  },
                                  child: Text('confirm'),
                                ),
                              ],
                            ),
                          ),
                          child: Card(
                            elevation: 3,
                            color: Colors.white30,
                            child: ListTile(
                              title: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        doctor["name"],
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "specialty: ${doctor["specialty"]}",
                                        style: TextStyle(
                                          fontSize: 23,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "description: ${doctor["description"]}",
                                        style: TextStyle(
                                          fontSize: 23,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Session price: ${doctor["session_price"]}",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
            ),
          ),
        ],
      ),
    );
  }
}
