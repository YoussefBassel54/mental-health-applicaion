import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

DateTime now = new DateTime.now();
const Color mainAppColor = Color(0xFFB2B9E2);
const Color inactiveBtnColor = Colors.white;
const Color activeBtnColor = Colors.white54;
const Color orangeColor = Color(0xFFFD9A04);
const Color orangeColorFaded = Color(0xAAFD9A04);
const Color noColor = Color(0x00FFFFFF);
final kToday = now;
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

const kSendButtonTextStyle = TextStyle(
  color: Color(0xFFB2B9E2),
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
