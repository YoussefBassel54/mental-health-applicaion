import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/constants.dart';

import '../services/remote_service.dart';

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
            child: SingleChildScrollView(
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
                    onPressed: () async {
                      var response =
                          await ApiService.instance.post('daily/tweet/', {
                        "user": ApiService.instance.userID,
                        "day": DateTime.now().toString().substring(0, 10),
                        "description": myController.text,
                      });
                      if (response == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            elevation: 5,
                            duration: Duration(seconds: 3),
                            behavior: SnackBarBehavior.fixed,
                            content: Text(
                              "day tweet already submitted, try again tomorrow",
                            ),
                          ),
                        );
                      }
                      Future.delayed(Duration(seconds: 3), () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/rateday');
                      });
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
      ),
    );
  }
}
