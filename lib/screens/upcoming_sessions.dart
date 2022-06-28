import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/constants.dart';

import '../services/remote_service.dart';

class UpcomingSessionsPage extends StatefulWidget {
  @override
  _UpcomingSessionsPageState createState() => _UpcomingSessionsPageState();
}

class _UpcomingSessionsPageState extends State<UpcomingSessionsPage> {
  List<dynamic>? sessions;

  Future GetSessions() async {
    sessions = await ApiService.instance.get('doctor/usersession/user/');
  }

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 0), () async {
      await GetSessions();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming sessions'),
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
              children: sessions == null
                  ? []
                  : [
                      for (Map<String, dynamic> session in sessions!)
                        Card(
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
                                      'Session ${session["id"].toString()}',
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
                                      "Duration: ${session["duration"]}",
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
                                      "Date: ${session["date"].toString().substring(0, 10)} (${session["date"].toString().substring(11, 19)})",
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                    ),
                                  ),
                                ],
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
