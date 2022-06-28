import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/constants.dart';

import '../services/remote_service.dart';

class SessionHistoryPage extends StatefulWidget {
  @override
  _SessionHistoryPageState createState() => _SessionHistoryPageState();
}

class _SessionHistoryPageState extends State<SessionHistoryPage> {
  List<dynamic>? pastSessions;

  Future GetPastSessions() async {
    pastSessions = await ApiService.instance.get('doctor/history/user/');
  }

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 0), () async {
      await GetPastSessions();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Session history'),
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
              children: pastSessions == null
                  ? []
                  : [
                      for (Map<String, dynamic> pastSession in pastSessions!)
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
                                      'Session ${pastSession["id"].toString()}',
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
                                      "Duration: ${pastSession["duration"]}",
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
                                      "Date: ${pastSession["date"].toString().substring(0, 10)} (${pastSession["date"].toString().substring(11, 19)})",
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
