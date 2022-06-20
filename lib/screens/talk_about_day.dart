import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/constants.dart';

class TalkAboutDay extends StatefulWidget {
  @override
  _TalkAboutDayState createState() => _TalkAboutDayState();
}

class _TalkAboutDayState extends State<TalkAboutDay> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainAppColor,
        title: Text("Rate your day"),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: myController,
                  maxLines: 18,
                  maxLength: 560,
                  maxLengthEnforced: true,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      fillColor: Color(0x77B2B9E2),
                      filled: true,
                      border: OutlineInputBorder(),
                      hintText: "Tell us about your day"),
                ),
                FlatButton(
                  color: orangeColor,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text that the user has entered by using the
                          // TextEditingController.
                          content: Text(myController.text),
                        );
                      },
                    );
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
