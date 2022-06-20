import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:mental_health_application/utilities/constants.dart';
import 'package:mental_health_application/utilities/goal_manager.dart';

class GoalsPage extends StatefulWidget {
  @override
  _GoalsPageState createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  late Map<DateTime, List<Goal>> selectedGoals;
  TextEditingController _goalController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime focusedDay = now;
  DateTime selectedDay = now;

  @override
  void initState() {
    selectedGoals = {};
    super.initState();
  }

  @override
  void dispose() {
    _goalController.dispose();
    super.dispose();
  }

  Future openDialog(DateTime selectedDay) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Add new goal'),
            content: TextFormField(
              controller: _goalController,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: Text('CANCEL')),
              TextButton(
                  onPressed: () {
                    if (_goalController.text.isEmpty) {
                    } else {
                      if (selectedGoals[selectedDay] != null) {
                        selectedGoals[selectedDay]?.add(Goal(
                            title: _goalController.text,
                            timeCreated: DateTime.now()));
                      } else {
                        selectedGoals[selectedDay] = [
                          Goal(
                              title: _goalController.text,
                              timeCreated: DateTime.now())
                        ];
                      }
                    }
                    Navigator.pop(context);
                    _goalController.clear();
                    setState(() {});
                    return;
                  },
                  child: Text('SUBMIT')),
            ],
          ));

  List<Goal> _getGoalsForDay(DateTime date) {
    // Implementation example
    return selectedGoals[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Daily Goals'),
        backgroundColor: Color(0xFFB2B9E2),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            TableCalendar(
              rowHeight: 35,
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: selectedDay,
              startingDayOfWeek: StartingDayOfWeek.saturday,
              calendarFormat: _calendarFormat,
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
              ),
              onRangeSelected: null,
              eventLoader: _getGoalsForDay,
              selectedDayPredicate: (DateTime date) =>
                  isSameDay(selectedDay, date),
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
            ),
            const SizedBox(height: 8),
            FlatButton(
              color: orangeColor,
              onPressed: () {
                openDialog(selectedDay);
              },
              child: Text(
                "Add goal",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
              child: GroupedListView<Goal, DateTime>(
                shrinkWrap: true,
                padding: EdgeInsets.all(8),
                useStickyGroupSeparators: true,
                floatingHeader: true,
                elements: _getGoalsForDay(selectedDay),
                groupBy: (Goal goal) {
                  return goal.timeCreated;
                },
                groupHeaderBuilder: (Goal goal) =>
                    SizedBox(height: 2, child: Container()),
                itemBuilder: (context, Goal goal) => Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text("Did you achieve this goal ?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        setState(() {});
                                        Navigator.pop(context);
                                      },
                                      child: Text('NO')),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          selectedGoals[selectedDay]!
                                              .remove(goal);
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Text('YES')),
                                ],
                              ));
                    },
                    child: Card(
                      color: mainAppColor,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(goal.title),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
