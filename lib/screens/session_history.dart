import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/constants.dart';

class SessionHistoryPage extends StatefulWidget {
  @override
  _SessionHistoryPageState createState() => _SessionHistoryPageState();
}

class _SessionHistoryPageState extends State<SessionHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Session history'),
        backgroundColor: Color(0xFFB2B9E2),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, snapshot) {
              return Card(
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
              );
            },
          ),
        ]),
      ),
    );
  }
}
