import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:mental_health_application/utilities/constants.dart';
import 'package:mental_health_application/utilities/goal_manager.dart';

import '../services/remote_service.dart';

class GoalsPage extends StatefulWidget {
  @override
  _GoalsPageState createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  TextEditingController _goalController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime focusedDay = now;
  DateTime selectedDay = now;
  bool status = false;
  List<dynamic>? goals;

  Future GetGoals() async {
    goals = await ApiService.instance.get('daily/goal/user/');
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () async {
      await GetGoals();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _goalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Daily Goals'),
        backgroundColor: Color(0xFFB2B9E2),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: orangeColor,
          onPressed: () {
            //openDialog(selectedDay);
            Navigator.pop(context);
            Navigator.pushNamed(context, '/addgoalpage');
          },
          child: Icon(CupertinoIcons.plus)),
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
              children: goals == null
                  ? []
                  : [
                      for (Map<String, dynamic> goal in goals!)
                        GestureDetector(
                          onTap: () => showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                        'Are you sure you want to delete this goal ?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('No'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          ApiService.instance.delete(
                                              'daily/goal/edit/${goal["id"]}');
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pushNamed(
                                              context, '/dailygoals');
                                        },
                                        child: Text('Yes'),
                                      ),
                                    ],
                                  )),
                          child: Card(
                            elevation: 3,
                            color: goal["status"] == "Unfinished"
                                ? Colors.white30
                                : mainAppColor,
                            child: ListTile(
                              title: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        goal["title"],
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
                                        "description: ${goal["description"]}",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            "type of goal: ${goal["category"]}")),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "start date: ${goal["start"].toString().substring(0, 10)}",
                                        style: TextStyle(color: Colors.black26),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "end date: ${goal["end"].toString().substring(0, 10)}",
                                        style: TextStyle(color: Colors.black26),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child:
                                            Text("status: ${goal["status"]}")),
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
