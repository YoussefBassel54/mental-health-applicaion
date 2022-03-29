import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/constants.dart';

class Mood extends StatefulWidget {
  @override
  _MoodState createState() => _MoodState();
}

class _MoodState extends State<Mood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mood'),
        backgroundColor: Color(0xFFB2B9E2),
      ),
      body: Stack(
        children: [
          Image.asset(
            'images/background.PNG',
            fit: BoxFit.fill,
            width: 411.4,
          ),
        ],
      ),
    );
  }
}
