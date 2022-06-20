import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/constants.dart';

class UpcomingSessionsPage extends StatefulWidget {
  @override
  _UpcomingSessionsPageState createState() => _UpcomingSessionsPageState();
}

class _UpcomingSessionsPageState extends State<UpcomingSessionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming sessions'),
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
