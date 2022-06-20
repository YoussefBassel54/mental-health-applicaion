import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/constants.dart';

class BookSessionPage extends StatefulWidget {
  @override
  _BookSessionPageState createState() => _BookSessionPageState();
}

class _BookSessionPageState extends State<BookSessionPage> {
  DateTime selectedDate = DateTime.now();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book a session'),
        backgroundColor: Color(0xFFB2B9E2),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, snapshot) {
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Book this session'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Text('cancel'),
                        ),
                        TextButton(
                          onPressed: () => _selectDate(context),
                          child: Text('choose date'),
                        ),
                        TextButton(
                          onPressed: () {
                            //add booked session to backend
                            print(selectedDate);
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/payment');
                          },
                          child: Text('confirm'),
                        ),
                      ],
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    title: Text(
                      'omar',
                      style: TextStyle(fontSize: 15),
                    ),
                    subtitle: Text(
                      'bta3 nafseya',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
