import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/constants.dart';

class RateDay extends StatefulWidget {
  @override
  _RateDayState createState() => _RateDayState();
}

class _RateDayState extends State<RateDay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate your day'),
        backgroundColor: Color(0xFFB2B9E2),
      ),
      body: Container(
        color: Colors.white,
        child: Column(),
      ),
    );
  }
}
