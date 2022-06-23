import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'message.dart';
import 'package:mental_health_application/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatSpace extends StatefulWidget {
  @override
  _ChatSpaceState createState() => _ChatSpaceState();
}

class _ChatSpaceState extends State<ChatSpace> {
  var msgController = TextEditingController();
  List<Message> messages = [
    Message(
        text: "are you coming ?",
        date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
        isSentByMe: false),
    Message(
        text: "yup",
        date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
        isSentByMe: true),
    Message(
        text: "are you coming ?",
        date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
        isSentByMe: false),
    Message(
        text: "yup",
        date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
        isSentByMe: true),
    Message(
        text: "are you coming ?",
        date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
        isSentByMe: false),
    Message(
        text: "yup",
        date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
        isSentByMe: true),
    Message(
        text: "are you coming ?",
        date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
        isSentByMe: false),
    Message(
        text: "yup",
        date: DateTime.now().subtract(Duration(days: 3, minutes: 3)),
        isSentByMe: true),
  ].reversed.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatbot"),
        backgroundColor: orangeColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: GroupedListView<Message, DateTime>(
              padding: EdgeInsets.all(8),
              reverse: true,
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              elements: messages,
              groupBy: (message) => DateTime(
                message.date.year,
                message.date.month,
                message.date.day,
              ),
              groupHeaderBuilder: (Message message) => SizedBox(
                height: 40,
                child: Center(
                  child: Card(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        DateFormat.yMMMd().format(message.date),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              itemBuilder: (context, Message message) => Align(
                alignment: message.isSentByMe
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Card(
                  elevation: 8,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(message.text),
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.grey.shade300,
            child: TextField(
              controller: msgController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: 'Type your message here...',
              ),
              onSubmitted: (text) {
                if (text != "") {
                  final message = Message(
                    text: text,
                    date: DateTime.now(),
                    isSentByMe: true,
                  );
                  setState(() {
                    messages.add(message);
                    msgController.clear();
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
