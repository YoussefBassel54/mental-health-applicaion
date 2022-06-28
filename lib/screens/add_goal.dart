import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/constants.dart';

import '../services/remote_service.dart';

class AddGoal extends StatefulWidget {
  final Map<String, dynamic>? goal;
  const AddGoal({Key? key, this.goal}) : super(key: key);

  @override
  _AddGoalState createState() => _AddGoalState();
}

class _AddGoalState extends State<AddGoal> {
  TextEditingController _goalController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  bool status = false;
  bool remindMe = false;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String dropdownValue = 'Work';

  @override
  void initState() {
    // TODO: implement initState
    if (widget.goal != null) {
      _goalController.text = widget.goal!["title"];
    }
    super.initState();
  }

  Future<void> _selectDate(BuildContext context, bool startOrEnd) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: startDate,
        firstDate: DateTime(1923, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        if (startOrEnd) {
          startDate = picked;
          print("start date = $startDate");
        } else {
          endDate = picked;
          print("end date = $endDate");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new goal'),
        backgroundColor: Color(0xFFB2B9E2),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Goal title",
                  ),
                  controller: _titleController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 300),
                child: FlatButton(
                  color: orangeColorFaded,
                  onPressed: () => _selectDate(context, true),
                  child: Text('Start date'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 300),
                child: FlatButton(
                  color: orangeColorFaded,
                  onPressed: () => _selectDate(context, false),
                  child: Text('End date'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Goal description",
                  ),
                  controller: _goalController,
                ),
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ), //SizedBox
                  Text(
                    'Is it Completed ? ',
                    style: TextStyle(fontSize: 17.0),
                  ), //Text
                  SizedBox(width: 10), //SizedBox
                  /** Checkbox Widget **/
                  Checkbox(
                    value: status,
                    onChanged: (value) {
                      setState(() {
                        status = value!;
                        print(status);
                      });
                    },
                  ), //Checkbox
                ], //<Widget>[]
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ), //SizedBox
                  Text(
                    'Remind me ',
                    style: TextStyle(fontSize: 17.0),
                  ), //Text
                  SizedBox(width: 10), //SizedBox
                  /** Checkbox Widget **/
                  Checkbox(
                    value: remindMe,
                    onChanged: (value) {
                      setState(() {
                        remindMe = value!;
                        print(remindMe);
                      });
                    },
                  ),
                ], //<Widget>[]
              ),
              Padding(
                padding: const EdgeInsets.only(right: 310),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: mainAppColor,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Work', 'Hangout', 'Chores']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: FlatButton(
                  color: orangeColorFaded,
                  onPressed: () async {
                    if (_titleController.text != "" &&
                        _goalController.text != "") {
                      var response =
                          await ApiService.instance.post('daily/goal/', {
                        "title": _titleController.text,
                        "start": startDate.toString(),
                        "end": endDate.toString(),
                        "status": status ? "Finished" : "Unfinished",
                        "description": _goalController.text,
                        "remind_me": remindMe,
                        "category": dropdownValue,
                        "user": ApiService.instance.userID,
                      });
                      if (response != null) {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/dailygoals');
                      }
                      return;
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                              "Goal title and Goal description fields must not be empty"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                                child: Text('OK')),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
